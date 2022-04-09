part of 'login_page.dart';

class InputArea extends StatelessWidget {
  const InputArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LogInInput(
          hint: 'E mail',
          onTextChanged: (_) {},
        ),
        SizedBox(
          height: 24,
        ),
        LogInInput(obsecure: true, hint: 'Şifre', onTextChanged: (_) {}),
      ],
    );
  }
}
