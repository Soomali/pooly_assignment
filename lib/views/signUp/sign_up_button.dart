part of 'sign_up.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) =>
          current is! PhotoChangedState || current is! PhotoSelectState,
      builder: (context, state) {
        return TextButton(
            onPressed: Formz.validate([
              state.age,
              state.email,
              state.name,
              state.password,
              state.surname
            ]).isValid
                ? () {
                    log('kaydol');
                  }
                : null,
            child: Text('Kaydol'));
      },
    );
  }
}
