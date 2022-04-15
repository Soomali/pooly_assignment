part of 'search_page.dart';

class SearchInputContainer extends StatelessWidget {
  const SearchInputContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                state.isFromSelected
                    ? SearchInputDisplay(
                        text: state.fromDestination!.description!,
                        onTap: () {
                          context.read<SearchBloc>().add(
                              FromChanged(state.fromDestination!.description!));
                        },
                      )
                    : SearchInput(
                        input: state.fromDestination?.description,
                        hint: 'Nereden',
                        onTextChanged: (text) {
                          context.read<SearchBloc>().add(FromChanged(text));
                        },
                      ),
                SizedBox(
                  height: 24,
                ),
                state.isToSelected
                    ? SearchInputDisplay(
                        text: state.toDestination!.description!,
                        onTap: () {
                          context.read<SearchBloc>().add(
                              ToChanged(state.toDestination!.description!));
                          ;
                        },
                      )
                    : SearchInput(
                        input: state.toDestination?.description,
                        hint: 'Nereye',
                        onTextChanged: (text) {
                          context.read<SearchBloc>().add(ToChanged(text));
                        },
                      ),
              ],
            ));
      },
    );
  }
}
