import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pooly_test/bloc/auth/auth_bloc.dart';
import 'package:pooly_test/bloc/signUp/signup_bloc.dart';
import 'package:pooly_test/entities/entities.dart';
import '../../repos/signUp/sign_up_repository.dart';
import '../logIn/login_page.dart';
part 'sign_up_layout.dart';
part 'sign_up_button.dart';
part 'age_widget.dart';
part 'photo_area.dart';
part 'name_area.dart';

class SignUpPage extends StatelessWidget {
  // final AuthBloc authBloc;
  const SignUpPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RepositoryProvider(
        create: (context) => SignUpRepository(),
        child: SignUpBlocWidget(),
      ),
    );
  }
}

class SignUpBlocWidget extends StatelessWidget {
  const SignUpBlocWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupBloc>(
      create: (_) =>
          SignupBloc(RepositoryProvider.of<SignUpRepository>(context)),
      child: SignUpLayout(),
    );
  }
}
