import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:google_place/google_place.dart';
import 'package:meta/meta.dart';
import 'package:pooly_test/repos/search/search_repo.dart';

import '../../entities/entities.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchRepository _searchRepository;
  late final StreamSubscription<List<AutocompletePrediction>?>
      _predictionSubscription;
  final Route? route;
  SearchBloc(this._searchRepository, {this.route})
      : super(route == null
            ? SearchInitial()
            : DateTimeSelectedState(
                SearchFetchStatus.fetched, true, true, [], route.startTime,
                fromDestination: route.start, toDestination: route.stop)) {
    on<FromChanged>(_onFromChanged);
    on<ToChanged>(_onToChanged);
    on<FromSelected>(_onFromSelected);
    on<ToSelected>(_onToSelected);
    on<_ErrorEvent>(_onErrorEvent);
    on<PredictionsFetched>(_onPredictionsFetched);
    on<DateTimeSelected>(_onDateTimeSelected);
    _predictionSubscription =
        _searchRepository.predictionStream.listen((event) {
      add(PredictionsFetched(event ?? []));
    });
  }
  @override
  Future<void> close() async {
    super.close();
    _predictionSubscription.cancel();
  }

  void _onDateTimeSelected(DateTimeSelected event, Emitter emit) {
    emit(DateTimeSelectedState(
        state.status, true, true, state.predictions, event.dateTime,
        fromDestination: state.fromDestination,
        toDestination: state.toDestination));
  }

  void _onPredictionsFetched(PredictionsFetched event, Emitter emit) {
    emit(state.copyWith(
        predictions: event.predictions, status: SearchFetchStatus.fetched));
  }

  void _onFromChanged(FromChanged event, Emitter emit) {
    log('fromChanged');
    if (event.key.isEmpty) {
      emit(state.copyWith(isFromSelected: false));
      return;
    }
    emit(FromParamChanged(SearchFetchStatus.fetching, event.key,
        state.isToSelected, state.predictions,
        toDestination: state.toDestination,
        fromDestination: state.fromDestination));
    _searchRepository.searchAutocomplete(event.key);
  }

  void _onToChanged(ToChanged event, Emitter emit) {
    if (event.key.isEmpty) {
      emit(state.copyWith(isToSelected: false));
      return;
    }
    emit(ToParamChanged(SearchFetchStatus.fetching, event.key,
        state.isFromSelected, state.predictions,
        fromDestination: state.fromDestination,
        toDestination: state.toDestination));
    _searchRepository.searchAutocomplete(event.key);
  }

  void _onFromSelected(FromSelected event, Emitter emit) {
    log('fromSelected');
    final newState = state.copyWith(
        isFromSelected: true, fromDestination: event.destination);
    log('fromSelected ${newState.isFromSelected}');
    emit(newState);
  }

  void _onToSelected(ToSelected event, Emitter emit) {
    emit(state.copyWith(isToSelected: true, toDestination: event.destination));
  }

  void _onErrorEvent(_ErrorEvent event, Emitter emit) {
    emit(ErrorState(SearchFetchStatus.fetched, event.error, state.isToSelected,
        state.isFromSelected, state.predictions));
  }
}
