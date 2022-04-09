part of 'login_page.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: const TextSpan(
            style: TextStyle(color: Colors.black),
            text: 'Bir hesabın Yok mu? ',
            children: [
          TextSpan(
            text: ' Kaydol',
            style: TextStyle(color: Colors.blue),
          )
        ]));
  }
}
