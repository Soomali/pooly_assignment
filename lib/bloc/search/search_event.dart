part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class FromChanged extends SearchEvent {
  final String key;
  FromChanged(this.key);
}

class ToChanged extends SearchEvent {
  final String key;
  ToChanged(this.key);
}

class DateTimeSelected extends SearchEvent {
  final DateTime dateTime;
  DateTimeSelected(this.dateTime);
}

class ToSelected extends SearchEvent {
  final Destination destination;

  ToSelected(this.destination);
}

class PredictionsFetched extends SearchEvent {
  final List<AutocompletePrediction> predictions;

  PredictionsFetched(this.predictions);
}

class FromSelected extends SearchEvent {
  final Destination destination;

  FromSelected(this.destination);
}

class _ErrorEvent extends SearchEvent {
  final String error;

  _ErrorEvent(this.error);
}
