part of 'search_page.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = context.watch<SearchBloc>().state.predictions;
    return ListView.separated(
        separatorBuilder: (context, _) {
          return SizedBox(
            height: 24,
          );
        },
        itemCount: items.length,
        itemBuilder: (context, index) {
          return SearchResultItem(prediction: items[index]);
        });
  }
}
