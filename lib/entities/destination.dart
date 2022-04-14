part of 'entities.dart';

class Destination {
  final String? description;
  final String? id;
  final StructuredFormatting? formatting;
  final String? placeId;

  Destination._(this.description, this.id, this.formatting, this.placeId);
  factory Destination.fromPrediction(AutocompletePrediction prediction) {
    prediction.terms?.forEach((element) {
      dev.log('${element.value}');
    });
    return Destination._(prediction.description, prediction.id,
        prediction.structuredFormatting, prediction.placeId);
  }
}
