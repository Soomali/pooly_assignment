part of 'login_page.dart';

class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is SignupRequestState) {
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => SignUpPage()));
        }
      },
      child: Padding(
        padding:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: Column(
          children: const [LogoWidget(), InputArea(), SignUpWidget()],
        ),
      ),
    );
  }
}
