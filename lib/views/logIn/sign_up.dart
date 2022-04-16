part of 'login_page.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
            text: 'Bir hesabın yok mu? ',
            children: [
          TextSpan(
            text: ' Kaydol',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(days: 1),
                    content: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: null, child: Text('Sürücü')),
                        SizedBox(
                          width: 24,
                        ),
                        TextButton(
                            onPressed: () {
                              context.read<LoginBloc>().add(SignupRequest());
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
