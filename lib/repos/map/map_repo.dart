import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';

import 'package:google_place/google_place.dart';

import '../../entities/entities.dart';

class MapRepository {
  static const apiKey = 'AIzaSyCVRQpkJan67dncU5Yl0O45GcfNog5dkTo';
  final _places = GooglePlace(apiKey);

  final StreamController<Route?> _routeStream = StreamController();
  final StreamController<String?> _errorStream = StreamController();

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

      final distance = _calculateDistanceAsMeters(
          startRes.lat, startRes.lng, stopRes.lat, stopRes.lng);
      final Route route = Route(start, stop, startTime,
          distanceMeters: distance,
          duration: Duration(minutes: distance ~/ 60),
          drives: []);
      route.copyWith(drives: await _fetchDriveData(route));
      _routeStream.add(route);
    } catch (e) {
      _errorStream.add('Unknown error');
    }
  }

  Future<List<Drive>> _fetchDriveData(Route route) async {
    try {
      // this may be changed to a real fetching request.
      return Future<List<Drive>>.delayed(Duration(milliseconds: 1250), () {
        return List.generate(2, (index) => Drive.random(150));
      });
    } catch (e) {
      dev.log('$e');
      return [];
    }
  }

  double _calculateDistanceAsMeters(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12.742 * asin(sqrt(a));
  }

  void search(String search) async {
    var places = await _places.autocomplete.get(search);
    places?.predictions?.forEach((elem) => dev.log(
        '${elem.id},${elem.description},${elem.placeId}, ${elem.distanceMeters}'));
  }
}
