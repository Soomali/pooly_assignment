part of 'sign_up.dart';

class SignUpLayout extends StatelessWidget {
  const SignUpLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is PhotoSelectState) {
          log('selectPhoto');
        }
      },
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          SignUpPhotoArea(),
          SizedBox(
            height: size.height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(child: LogInInput(hint: 'isim', onTextChanged: (_) {})),
              Expanded(
                  child: LogInInput(hint: 'soy isim', onTextChanged: (_) {})),
            ],
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
          LogInInput(hint: 'E mail', onTextChanged: (_) {}),
          SizedBox(
            height: size.height * 0.05,
          ),
          LogInInput(hint: 'Şifre', onTextChanged: (_) {}),
        ]),
      ),
    );
  }
}
