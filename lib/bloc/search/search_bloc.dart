import 'dart:async';

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
  SearchBloc(this._searchRepository) : super(SearchInitial()) {
    on<FromChanged>(_onFromChanged);
    on<ToChanged>(_onToChanged);
    on<FromSelected>(_onFromSelected);
    on<ToSelected>(_onToSelected);
    on<_ErrorEvent>(_onErrorEvent);
    on<PredictionsFetched>(_onPredictionsFetched);
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

  void _onPredictionsFetched(PredictionsFetched event, Emitter emit) {
    emit(state.copyWith(
        predictions: event.predictions, status: SearchFetchStatus.fetched));
  }

  void _onFromChanged(FromChanged event, Emitter emit) {
    emit(FromParamChanged(SearchFetchStatus.fetching, event.key,
        state.isToSelected, state.predictions));
    _searchRepository.searchAutocomplete(event.key);
  }

  void _onToChanged(ToChanged event, Emitter emit) {
    emit(ToParamChanged(SearchFetchStatus.fetching, event.key,
        state.isFromSelected, state.predictions));
    _searchRepository.searchAutocomplete(event.key);
  }

  void _onFromSelected(FromSelected event, Emitter emit) {
    emit(state.copyWith(
        isFromSelected: true, fromDestination: event.destination));
  }

  void _onToSelected(ToSelected event, Emitter emit) {
    emit(state.copyWith(isToSelected: true, toDestination: event.destination));
  }

  void _onErrorEvent(_ErrorEvent event, Emitter emit) {
    emit(ErrorState(SearchFetchStatus.fetched, event.error, state.isToSelected,
        state.isFromSelected, state.predictions));
  }
}
