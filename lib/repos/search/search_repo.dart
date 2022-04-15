import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:pooly_test/repos/map/map_repo.dart';
import '../../entities/entities.dart';
import 'dart:async';
import 'package:google_place/google_place.dart';

class SearchRepository {
  final GooglePlace _place = GooglePlace(MapRepository.apiKey);
  StreamController<List<AutocompletePrediction>?> _predictionStream =
      StreamController();
  Stream<List<AutocompletePrediction>?> get predictionStream =>
      _predictionStream.stream;
  void searchAutocomplete(String search) async {
    _place.autocomplete
        .get(search)
        .then((value) => _predictionStream.add(value?.predictions ?? []));
  }
}
