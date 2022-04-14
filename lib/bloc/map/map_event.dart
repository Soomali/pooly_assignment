part of 'map_bloc.dart';

@immutable
abstract class MapEvent {}

class RouteSelectedEvent extends MapEvent {
  final List<Drive> drives;
  final Route route;
  RouteSelectedEvent(this.drives, this.route);
}

class DriveSelectedEvent extends MapEvent {
  final Drive drive;
  final Route route;
  DriveSelectedEvent(this.drive, this.route);
}

class RouteCancelledEvent extends MapEvent {}

class SearchRequestEvent extends MapEvent {}
