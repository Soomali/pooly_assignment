import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pooly_test/bloc/auth/auth_bloc.dart';
import 'package:pooly_test/repos/auth/auth_repository.dart';
import 'package:pooly_test/views/logIn/login_page.dart';
import 'package:pooly_test/views/map/map_page.dart';

class MainBloc extends StatelessWidget {
  const MainBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(buildWhen: ((previous, current) {
      return (current is! AuthError && current is! Authenticating);
    }), builder: (context, state) {
      if (state is UnAuthenticated) {
        log('unauthenticated');
        return LoginPage();
      } else if (state is Authenticated) {
        return MapPage();
      } else {
        return Container();
      }
    }, listener: (context, state) {
      if (state is Authenticating) {
        log('authenticating');
      } else if (state is AuthError) {
        log('error: ${state.error}');
      }
    });
  }
}
