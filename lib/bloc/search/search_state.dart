part of 'search_bloc.dart';

enum SearchFetchStatus { fetching, fetched, initial }

@immutable
abstract class SearchState {
  final List<AutocompletePrediction> predictions;
  final bool isFromSelected;
  final bool isToSelected;
  final SearchFetchStatus status;
  final Destination? fromDestination;
  final Destination? toDestination;
  SearchState copyWith({
    List<AutocompletePrediction>? predictions,
    SearchFetchStatus? status,
    bool? isToSelected,
    bool? isFromSelected,
    Destination? fromDestination,
    Destination? toDestination,
  });
  const SearchState(
      this.status, this.isFromSelected, this.isToSelected, this.predictions,
      {this.fromDestination, this.toDestination});
}

class SearchInitial extends SearchState {
  SearchInitial() : super(SearchFetchStatus.initial, false, false, []);

  @override
  SearchState copyWith({
    List<AutocompletePrediction>? predictions,
    SearchFetchStatus? status,
    bool? isToSelected,
    bool? isFromSelected,
    Destination? fromDestination,
    Destination? toDestination,
  }) {
    return this;
  }
}

class FromParamChanged extends SearchState {
  final String searchParam;
  const FromParamChanged(
    SearchFetchStatus status,
    this.searchParam,
    bool isToSelected,
    List<AutocompletePrediction> predictions, {
    Destination? fromDestionation,
    Destination? toDestionation,
    bool isFromSelected = false,
  }) : super(status, isFromSelected, isToSelected, predictions,
            fromDestination: fromDestionation, toDestination: toDestionation);

  @override
  SearchState copyWith(
      {String? searchParam,
      SearchFetchStatus? status,
      bool? isToSelected,
      bool? isFromSelected,
      Destination? fromDestination,
      Destination? toDestination,
      List<AutocompletePrediction>? predictions}) {
    return FromParamChanged(
        status ?? this.status,
        searchParam ?? this.searchParam,
        isToSelected ?? this.isToSelected,
        predictions ?? this.predictions,
        isFromSelected: isFromSelected ?? this.isFromSelected,
        fromDestionation: fromDestination ?? this.fromDestination,
        toDestionation: toDestination ?? this.toDestination);
  }
}

class ToParamChanged extends SearchState {
  final String searchParam;
  const ToParamChanged(
    SearchFetchStatus status,
    this.searchParam,
    bool isFromSelected,
    List<AutocompletePrediction> predictions, {
    Destination? fromDestionation,
    Destination? toDestionation,
    bool isToSelected = false,
  }) : super(status, isFromSelected, isToSelected, predictions,
            fromDestination: fromDestionation, toDestination: toDestionation);
  @override
  SearchState copyWith(
      {String? searchParam,
      SearchFetchStatus? status,
      bool? isToSelected,
      bool? isFromSelected,
      Destination? fromDestination,
      Destination? toDestination,
      List<AutocompletePrediction>? predictions}) {
    return ToParamChanged(
        status ?? this.status,
        searchParam ?? this.searchParam,
        isFromSelected ?? this.isFromSelected,
        predictions ?? this.predictions,
        isToSelected: isToSelected ?? this.isToSelected,
        fromDestionation: fromDestination ?? this.fromDestination,
        toDestionation: toDestination ?? this.toDestination);
  }
}

class ErrorState extends SearchState {
  final String error;
  const ErrorState(
    SearchFetchStatus status,
    this.error,
    bool isToSelected,
    bool isFromSelected,
    List<AutocompletePrediction> predictions, {
    Destination? fromDestionation,
    Destination? toDestionation,
  }) : super(status, isFromSelected, isToSelected, predictions,
            fromDestination: fromDestionation, toDestination: toDestionation);

  @override
  SearchState copyWith(
      {String? error,
      SearchFetchStatus? status,
      bool? isToSelected,
      bool? isFromSelected,
      Destination? fromDestination,
      Destination? toDestination,
      List<AutocompletePrediction>? predictions}) {
    return ErrorState(
        status ?? this.status,
        error ?? this.error,
        isToSelected ?? this.isToSelected,
        isFromSelected ?? this.isFromSelected,
        predictions ?? this.predictions,
        fromDestionation: fromDestination ?? this.fromDestination,
        toDestionation: toDestination ?? this.toDestination);
  }
}
