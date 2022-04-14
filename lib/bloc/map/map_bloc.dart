import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pooly_test/repos/map/map_repo.dart';

import '../../entities/entities.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository _repository;
  late final StreamSubscription<Drive?> _streamSubscription;
  MapBloc(this._repository) : super(MapInitial()) {
    on<DriveSelectedEvent>(_onDriveSelectedEvent);
    on<RouteSelectedEvent>(_onRouteSelectedEvent);
    on<RouteCancelledEvent>(_onRouteCancelledEvent);
    on<SearchRequestEvent>(_onSearchRequestEvent);
    _streamSubscription = _repository.drive.listen((event) {
      if (event == null && state is! MapInitial) {
        add(RouteCancelledEvent());
      } else {
        //add(DriveSelectedEvent(event, (state)))
      }
    });
  }

  void _onDriveSelectedEvent(DriveSelectedEvent event, Emitter emit) async {
    emit(MapFetchingDrive());
    _repository.fetchDriveData(event.route, event.drive);
  }

  void _onRouteSelectedEvent(RouteSelectedEvent event, Emitter emit) {
    emit(MapRouteSelected(event.drives, event.route));
  }

  void _onRouteCancelledEvent(RouteCancelledEvent event, Emitter emit) {
    emit(MapInitial());
  }

  void _onSearchRequestEvent(SearchRequestEvent event, Emitter emit) {
    emit(SearchRequested());
  }
}
