part of 'map_bloc.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

abstract class MapDataState extends MapState {
  Route get route;
  Drive? get drive;
  List<LatLng> get polyLineCoordinates;
}

class MapRouteSelected extends MapDataState {
  @override
  final Route route;
  @override
  Drive? get drive => null;
  MapRouteSelected(this.route);

  @override
  List<LatLng> get polyLineCoordinates {
    final drive = route.drives.isNotEmpty ? route.drives.first : null;
    if (drive == null) {
      return [];
    } else {
      return route.drives.first.polyLineCoordinates;
    }
  }
}

class MapDriveSelected extends MapDataState {
  @override
  final Drive drive;
  @override
  final Route route;
  MapDriveSelected(this.drive, this.route);
  @override
  List<LatLng> get polyLineCoordinates {
    return drive.polyLineCoordinates;
  }
}

class MapDriveConfirmed extends MapDataState {
  @override
  final Drive drive;
  @override
  final Route route;
  MapDriveConfirmed(this.drive, this.route);

  @override
  List<LatLng> get polyLineCoordinates {
    return drive.polyLineCoordinates;
  }
}

class MapError extends MapState {
  final String error;
  MapError(this.error);
}

class SearchRequested extends MapState {}

class MapFetchingRoute extends MapState {}
