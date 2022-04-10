part of 'sign_up.dart';

class NameArea extends StatelessWidget {
  final SignupState state;
  const NameArea({
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 5,
            child: LogInInput(
                padding: EdgeInsets.zero,
                error: state.name.valid || state.name.pure ? null : 'HATA',
                hint: 'isim',
                onTextChanged: (name) {
                  context.read<SignupBloc>().add(NameChanged(name));
                })),
        SizedBox(
          width: 8,
        ),
        Expanded(
            flex: 5,
            child: LogInInput(
                padding: EdgeInsets.zero,
                error:
                    state.surname.valid || state.surname.pure ? null : 'HATA',
                hint: 'soy isim',
                onTextChanged: (surname) {
                  context.read<SignupBloc>().add(SurnameChanged(surname));
                })),
        SizedBox(
          width: 8,
        ),
        Expanded(
            flex: 2,
            child: AgeWidget(
              error: state.age.valid || state.age.pure ? null : 'Hata',
            ))
      ],
    );
  }
}
