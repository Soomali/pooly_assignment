import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:pooly_test/repos/map/map_repo.dart';

import '../../entities/entities.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository _repository;
  late final StreamSubscription<Route?> _streamSubscription;
  late final StreamSubscription<String?> _errorSubscription;
  MapBloc(this._repository) : super(MapInitial()) {
    on<DriveSelectedEvent>(_onDriveSelectedEvent);
    on<RouteSelectedEvent>(_onRouteSelectedEvent);
    on<RouteCancelledEvent>(_onRouteCancelledEvent);
    on<SearchRequestEvent>(_onSearchRequestEvent);
    on<_RouteFetchedEvent>(_onRouteFetched);
    on<_MapErrorEvent>(_onMapErrorEvent);
    on<DriveConfirmedEvent>(_onDriveConfirmed);
    _streamSubscription = _repository.route.listen((event) {
      if (event == null && state is! MapInitial) {
        add(RouteCancelledEvent());
      } else {
        add(_RouteFetchedEvent(event!));
      }
    });
    _errorSubscription = _repository.error.listen((event) {
      if (event != null) {
        add(_MapErrorEvent(event));
      }
    });
  }
  void _onDriveConfirmed(DriveConfirmedEvent event, Emitter emit) {
    emit(MapDriveConfirmed(event.drive, event.route));
  }

  void _onMapErrorEvent(_MapErrorEvent event, Emitter emit) {
    emit(MapError(event.error));
  }

  void _onRouteFetched(_RouteFetchedEvent event, Emitter emit) {
    emit(MapRouteSelected(event.route));
  }

  void _onDriveSelectedEvent(DriveSelectedEvent event, Emitter emit) {
    emit(MapDriveSelected(event.drive, event.route));
  }

  void _onRouteSelectedEvent(RouteSelectedEvent event, Emitter emit) {
    emit(MapFetchingRoute());
    _repository.fetchRouteData(event.start, event.stop, event.startTime);
  }

  void _onRouteCancelledEvent(RouteCancelledEvent event, Emitter emit) {
    emit(MapInitial());
  }

  void _onSearchRequestEvent(SearchRequestEvent event, Emitter emit) {
    emit(SearchRequested());
  }
}
