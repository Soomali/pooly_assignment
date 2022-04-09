part of 'login_page.dart';

class InputArea extends StatelessWidget {
  const InputArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            LogInInput(
              error: state.email.valid || state.email.pure ? null : 'Hatalı',
              hint: 'E mail',
              onTextChanged: (email) {
                context.read<LoginBloc>().add(EmailChanged(email));
              },
            ),
            const SizedBox(
              height: 24,
            ),
            LogInInput(
                error: state.password.valid || state.password.pure
                    ? null
                    : 'Hatalı',
                obsecure: true,
                hint: 'Şifre',
                onTextChanged: (password) {
                  context.read<LoginBloc>().add(PasswordChanged(password));
                }),
            SignInButton()
          ],
        );
      },
    );
  }
}
