import 'dart:async';
import 'dart:developer';

import 'package:google_place/google_place.dart';

import '../../entities/entities.dart';

class MapRepository {
  static const apiKey = 'AIzaSyCVRQpkJan67dncU5Yl0O45GcfNog5dkTo';
  final _places = GooglePlace(apiKey);

  StreamController<Drive?> _driveStream = StreamController();

  Stream<Drive?> get drive => _driveStream.stream;

  void getDrive(Route route) async  {
     try {
     final Future<DetailsResponse?> startDetails =  _places.details.get(route.start.placeId!).then((value) => );
     final Future<DetailsResponse?> stopDetails = _places.details.get(route.stop.placeId!);
     final locationRes = await Future.wait<DetailsResponse?>([startDetails,stopDetails]);
    final startRes = locationRes.first;
    final stopRes = locationRes.last;
     
     
    } catch(e) {
      log('$e');
    }
  }

  void search(String search) async {
    var places = await _places.autocomplete.get(search);
    places?.predictions?.forEach((elem) =>  log(
        '${elem.id},${elem.description},${elem.placeId}, ${elem.distanceMeters}'));
  }
}
