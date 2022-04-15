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
                    context.read<AuthBloc>().add(SignUpEvent(SignUpUserData(
                        email: state.email.value,
                        password: state.password.value,
                        name: state.name.value,
                        surname: state.surname.value,
                        age: state.age.value)));
                  }
                : null,
            child: Text('Kaydol'));
      },
    );
  }
}
