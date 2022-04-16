part of 'sign_up.dart';

class SignUpLayout extends StatelessWidget {
  const SignUpLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is PhotoSelectState) {
          //context.read<SignupBloc>().add(PhotoSelect());
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SignUpColumn(),
        ),
      ),
    );
  }
}

class SignUpColumn extends StatelessWidget {
  const SignUpColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) =>
          current is! PhotoSelectState && current is! PhotoChangedState,
      builder: (context, state) {
        return BlocListener<AuthBloc, AuthState>(
          listener: ((context, state) {
            if (state is Authenticated) {
              Navigator.of(context).pop();
            }
          }),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
            child: SingleChildScrollView(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                SignUpPhotoArea(),
                SizedBox(
                  height: size.height * 0.05,
                ),
                NameArea(
                  state: state,
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                LogInInput(
                    padding: EdgeInsets.zero,
                    error:
                        state.email.valid || state.email.pure ? null : 'HATA',
                    hint: 'E mail',
                    onTextChanged: (email) {
                      context.read<SignupBloc>().add(EmailChanged(email));
                    }),
                SizedBox(
                  height: size.height * 0.05,
                ),
                LogInInput(
                    padding: EdgeInsets.zero,
                    error: state.password.valid || state.password.pure
                        ? null
                        : 'HATA',
                    obsecure: true,
                    hint: 'Şifre',
                    onTextChanged: (password) {
                      context.read<SignupBloc>().add(PasswordChanged(password));
                    }),
                SizedBox(
                  height: size.height * 0.05,
                ),
                LogInInput(
                    padding: EdgeInsets.zero,
                    error: state.university.valid || state.university.pure
                        ? null
                        : 'HATA',
                    hint: 'Üniversite',
                    onTextChanged: (university) {
                      context
                          .read<SignupBloc>()
                          .add(UniversityChanged(university));
                    }),
                SizedBox(
                  height: size.height * 0.05,
                ),
                LogInInput(
                    padding: EdgeInsets.zero,
                    error: state.department.valid || state.department.pure
                        ? null
                        : 'HATA',
                    hint: 'Bölüm',
                    onTextChanged: (university) {
                      context
                          .read<SignupBloc>()
                          .add(DepartmentChanged(university));
                    }),
                SizedBox(
                  height: size.height * 0.05,
                ),
                SignUpButton(),
              ]),
            ),
          ),
        );
      },
    );
  }
}
