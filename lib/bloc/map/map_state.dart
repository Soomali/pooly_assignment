part of 'map_bloc.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

class MapRouteSelected extends MapState {
  final List<Drive> drives;
  final Route route;
  MapRouteSelected(this.drives, this.route);
}

class MapDriveSelected extends MapState {
  final Drive drive;
  MapDriveSelected(this.drive);
}

class SearchRequested extends MapState {}

class MapFetchingDrive extends MapState {}
