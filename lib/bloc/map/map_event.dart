part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class RouteSelectedEvent extends MapEvent {
  final Destination start;
  final Destination stop;
  final DateTime startTime;
  RouteSelectedEvent(this.start, this.stop, this.startTime);
}

class DriveSelectedEvent extends MapEvent {
  final Drive drive;
  final Route route;
  DriveSelectedEvent(this.drive, this.route);
}

class RouteCancelledEvent extends MapEvent {}

class DriveConfirmedEvent extends MapEvent {
  final Drive drive;
  final Route route;
  DriveConfirmedEvent(this.drive, this.route);
}

class SearchRequestEvent extends MapEvent {}

class _RouteFetchedEvent extends MapEvent {
  final Route route;

  _RouteFetchedEvent(this.route);
}

class _MapErrorEvent extends MapEvent {
  final String error;

  _MapErrorEvent(this.error);
}
