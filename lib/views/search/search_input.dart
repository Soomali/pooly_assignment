part of 'search_page.dart';

class SearchInput extends StatefulWidget {
  final void Function(String) onTextChanged;
  final String hint;
  final String? input;
  const SearchInput(
      {Key? key, required this.onTextChanged, required this.hint, this.input})
      : super(key: key);

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  late final TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.input);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        focusedBorder:
            const OutlineInputBorder(borderSide: BorderSide(width: 1.2)),
        border: const OutlineInputBorder(),
        labelText: widget.hint,
        hintText: widget.hint,
      ),
      onChanged: widget.onTextChanged,
    );
  }
}
