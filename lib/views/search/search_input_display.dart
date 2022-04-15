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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.05,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.grey.shade200,
          ),
          child: Center(child: Text(text))),
    );
  }
}