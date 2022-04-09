import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:pooly_test/bloc/auth/auth_bloc.dart';

import '../../bloc/login/login_bloc.dart';
part 'login_layout.dart';
part 'login_input.dart';
part 'logo.dart';
part 'sign_in_button.dart';
part 'sign_up.dart';
part 'login_area.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: SafeArea(
        child: Scaffold(body: LoginLayout()),
      ),
    );
  }
}
