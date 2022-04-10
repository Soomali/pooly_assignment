import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pooly_test/bloc/signUp/signup_bloc.dart';
import '../logIn/login_page.dart';
part 'sign_up_layout.dart';
part 'int_input_area.dart';
part 'sign_up_button.dart';
part 'photo_area.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<SignupBloc>(
        create: (_) => SignupBloc(),
        child: SignUpLayout(),
      ),
    );
  }
}
