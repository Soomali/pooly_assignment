part of 'search_page.dart';

class SearchInputDisplay extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const SearchInputDisplay({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.05,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Row(children: [
              Flexible(
                  child: Text(
                text,
                textAlign: TextAlign.center,
              ))
            ])));
  }
}
