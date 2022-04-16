import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:pooly_test/repos/user/user_repository.dart';

import '../../entities/entities.dart';

class MapRepository {
  MapRepository(this._userRepository);

  static const apiKey = 'AIzaSyCVRQpkJan67dncU5Yl0O45GcfNog5dkTo';
  final _places = GooglePlace(apiKey);
  final Geoflutterfire _geo = Geoflutterfire();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final StreamController<Route?> _routeStream = StreamController();
  final StreamController<String?> _errorStream = StreamController();
  final UserRepository _userRepository;
  final PolylinePoints polylinePoints = PolylinePoints();

  Stream<Route?> get route => _routeStream.stream;
  Stream<String?> get error => _errorStream.stream;

  void fetchRouteData(
      Destination start, Destination stop, DateTime startTime) async {
    try {
      final Future<DetailsResponse?> startDetails =
          _places.details.get(start.placeId!);
      final Future<DetailsResponse?> stopDetails =
          _places.details.get(stop.placeId!);
      final locationRes =
          await Future.wait<DetailsResponse?>([startDetails, stopDetails]);
      final startRes = locationRes.first!.result!.geometry!.location!;
      final stopRes = locationRes.last!.result!.geometry!.location!;

      final distance = calculateDistanceAsKilometers(
          startRes.lat, startRes.lng, stopRes.lat, stopRes.lng);
      final Route route = Route(start, stop, startTime,
          distanceMeters: distance,
          duration: Duration(minutes: distance ~/ 60),
          drives: []);
      fetchDriveData(startRes, stopRes).listen((event) {
        _routeStream.add(route.copyWith(drives: event));
      });
    } catch (e) {
      _errorStream.add('Unknown error');
    }
  }

  Stream<List<Drive>> fetchDriveData(Location start, Location stop,
      {double radius = .05}) {
    try {
      final startGeoPoint =
          _geo.point(latitude: start.lat!, longitude: start.lng!);
      return _geo
          .collection(collectionRef: _firestore.collection('Drives'))
          .within(center: startGeoPoint, radius: radius, field: 'start')
          .transform(StreamTransformer.fromHandlers(
              handleData: (event, sink) => _transformDocumentSnapshot(
                  stop, radius * 1000, event, sink)));
    } catch (e) {
      dev.log('$e');
      return const Stream.empty();
    }
  }

  void _transformDocumentSnapshot(Location stop, double radius,
      List<DocumentSnapshot> event, EventSink sink) async {
    final futures = <Future>[];
    final drives = <Drive>[];
    for (var i in event) {
      final data = i.data() as Map<String, dynamic>;
      final points =
          (data['stop'] as Map<String, dynamic>)['geopoint'] as GeoPoint;
      if (calculateDistanceAsKilometers(
                  points.latitude, points.longitude, stop.lat, stop.lng) *
              1000 <
          radius) {
        final passengers = <Passenger>[];
        for (var item in data['passengers'] as List<dynamic>) {
          futures.add(_userRepository
              .getPassenger(item.id)
              .then((value) => passengers.add(value!)));
        }
        await Future.wait(futures);
        final driver = await _userRepository
            .getDriver((data['driver'] as DocumentReference).id);
        final start =
            (data['start'] as Map<String, dynamic>)['geopoint'] as GeoPoint;
        PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          apiKey,
          PointLatLng(start.latitude, start.longitude),
          PointLatLng(points.latitude, points.longitude),
          travelMode: TravelMode.driving,
        );
        List<LatLng> polylineCoordinates = [];

        if (result.points.isNotEmpty) {
          result.points.forEach((PointLatLng point) {
            polylineCoordinates.add(LatLng(point.latitude, point.longitude));
          });
        } else {
          print(result.errorMessage);
        }

        drives.add(Drive(
            passengers,
            driver ?? Driver.random(),
            data['price'],
            (data['startTime'] as Timestamp).toDate(),
            GeoFirePoint(start.latitude, start.longitude),
            GeoFirePoint(points.latitude, points.longitude),
            polylineCoordinates));
      }
    }
    sink.add(drives);
  }

  static double calculateDistanceAsKilometers(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void search(String search) async {
    var places = await _places.autocomplete.get(search);
    places?.predictions?.forEach((elem) => dev.log(
        '${elem.id},${elem.description},${elem.placeId}, ${elem.distanceMeters}'));
  }
}
