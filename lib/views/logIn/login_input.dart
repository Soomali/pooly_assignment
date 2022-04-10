part of 'login_page.dart';

class LogInInput extends StatelessWidget {
  final String? error;
  final String hint;
  final void Function(String) onTextChanged;
  final bool obsecure;
  final EdgeInsets? padding;
  const LogInInput(
      {Key? key,
      this.error,
      this.padding,
      this.obsecure = false,
      required this.hint,
      required this.onTextChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: width * 0.15),
      child: TextField(
        obscureText: obsecure,
        onChanged: onTextChanged,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          errorText: error,
          hintText: hint,
          labelText: hint,
        ),
      ),
    );
  }
}
