part of 'map_bloc.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

class MapRouteSelected extends MapState {
  final Route route;
  MapRouteSelected(this.route);
}

class MapDriveSelected extends MapState {
  final Drive drive;
  final Route route;
  MapDriveSelected(this.drive, this.route);
}

class MapError extends MapState {
  final String error;

  MapError(this.error);
}

class SearchRequested extends MapState {}

class MapFetchingRoute extends MapState {}
