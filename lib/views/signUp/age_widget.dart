part of 'sign_up.dart';

class AgeWidget extends StatelessWidget {
  final String? error;
  const AgeWidget({Key? key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      maxLength: 2,
      onChanged: (age) {
        context.read<SignupBloc>().add(AgeChanged(age));
      },
      decoration: InputDecoration(
          counterText: "",
          labelText: 'Yaş',
          border: const OutlineInputBorder(),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          errorText: error,
          hintText: ""),
    );
  }
}
