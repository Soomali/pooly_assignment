part of 'login_page.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: const TextStyle(color: Colors.black),
            text: 'Bir hesabın Yok mu? ',
            children: [
          TextSpan(
            text: ' Kaydol',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(days: 1),
                    content: Row(
                      children: [
                        TextButton(onPressed: null, child: Text('Sürücü')),
                        TextButton(
                            onPressed: () {
                              context.read<LoginBloc>();
                            },
                            child: Text('Yolcu'))
                      ],
                    )));
              },
            style: const TextStyle(color: Colors.blue),
          )
        ]));
  }
}
