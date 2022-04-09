part of 'login_page.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = BlocProvider.of<LoginBloc>(context).state;
    return TextButton.icon(
        onPressed: Formz.validate([state.email, state.password]).isValid
            ? () {
                context
                    .read<AuthBloc>()
                    .add(LoginRequest(state.email.value, state.password.value));
              }
            : null,
        icon: Icon(Icons.car_rental),
        label: Text('Giriş Yap'));
  }
}
