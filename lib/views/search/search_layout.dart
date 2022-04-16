part of 'search_page.dart';

class SearchLayout extends StatelessWidget {
  const SearchLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(LogOutEvent());
            },
            icon: Icon(Icons.adaptive.arrow_back)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 24,
          ),
          const SearchInputContainer(),
          if (context.watch<SearchBloc>().state is! SearchInitial)
            const Divider(
              thickness: 1.6,
              height: 24,
            ),
          const SearchResultWidget()
        ],
      ),
    );
  }
}
