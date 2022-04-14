import 'dart:async';
import 'dart:developer';

import 'package:google_place/google_place.dart';

import '../../entities/entities.dart';

class MapRepository {
  static const apiKey = 'AIzaSyCVRQpkJan67dncU5Yl0O45GcfNog5dkTo';
  final _places = GooglePlace(apiKey);

  StreamController<Drive?> _driveStream = StreamController();

  Stream<Drive?> get drive => _driveStream.stream;

  void getDrive(Route route) {}

  void search(String search) async {
    var places = await _places.autocomplete.get(search);
    places?.predictions?.forEach((elem) => log(
        '${elem.id},${elem.description},${elem.placeId}, ${elem.distanceMeters}'));
  }
}
