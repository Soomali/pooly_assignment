part of 'search_page.dart';

class SearchResultItem extends StatelessWidget {
  final AutocompletePrediction prediction;
  const SearchResultItem({Key? key, required this.prediction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final bloc = context.read<SearchBloc>();
        final state = bloc.state;
        if (state is FromParamChanged) {
          bloc.add(FromSelected(ent.Destination.fromPrediction(prediction)));
        } else {
          bloc.add(ToSelected(ent.Destination.fromPrediction(prediction)));
        }
      },
      child: Container(
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
            border: Border.all(width: 1.6, color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(Icons.location_on_outlined),
              Flexible(child: Text(prediction.description ?? 'YOK')),
            ],
          )),
    );
  }
}
