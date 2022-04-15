part of 'search_page.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      switch (state.status) {
        case SearchFetchStatus.fetched:
          if (state.isToSelected && state.isFromSelected) {
            return ConfirmArea(state: state);
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

class ConfirmArea extends StatelessWidget {
  final SearchState state;
  const ConfirmArea({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: state is! DateTimeSelectedState
                ? null
                : () {
                    log('confirmed results');
                    log('from:${state.fromDestination?.description},to:${state.toDestination?.description} at ${(state as DateTimeSelectedState).dateTime}');
                    context.read<MapBloc>().add(RouteSelectedEvent(
                        state.fromDestination!,
                        state.toDestination!,
                        (state as DateTimeSelectedState).dateTime));
                  },
            child: Text('CONFIRMED')),
        IconButton(
            onPressed: () {
              final now = DateTime.now();
              showDatePicker(
                      context: context,
                      initialDate: now,
                      firstDate: now,
                      lastDate: now.add(Duration(days: 31)))
                  .then((date) {
                if (date != null) {
                  showTimePicker(context: context, initialTime: TimeOfDay.now())
                      .then((value) {
                    if (value != null) {
                      context.read<SearchBloc>().add(DateTimeSelected(DateTime(
                          date.year,
                          date.month,
                          date.day,
                          value.hour,
                          value.minute)));
                    }
                  });
                }
              });
            },
            icon: Icon(Icons.calendar_month_outlined))
      ],
    );
  }
}
