part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}

class SearchKeyChanged {
  final String key;
  const SearchKeyChanged(this.key);
}

class SearchDeleted {}

class SearchItemSelected {}
