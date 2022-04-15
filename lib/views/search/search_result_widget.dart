part of 'search_page.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      switch (state.status) {
        case SearchFetchStatus.fetched:
          if (state.isToSelected && state.isFromSelected) {
            return TextButton(
                onPressed: () {
                  log('confirmed results');
                  log('from:${state.fromDestination?.description},to:${state.toDestination?.description}');
                },
                child: Text('CONFIRMED'));
          }
          return const Expanded(child: SearchResultList());
        case SearchFetchStatus.fetching:
          return Expanded(
              child: Column(
            children: const [
              Expanded(child: Text('')),
              CircularProgressIndicator(),
              Expanded(child: Text('')),
            ],
          ));
        case SearchFetchStatus.initial:
          return const Center(child: Text(''));
      }
    });
  }
}
