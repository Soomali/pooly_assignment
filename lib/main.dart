import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_place/google_place.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';
import 'package:pooly_test/entities/entities.dart';
import 'package:pooly_test/repos/auth/auth_repository.dart';
import 'package:pooly_test/repos/map/map_repo.dart';
import 'package:pooly_test/repos/user/user_repository.dart';
import 'package:pooly_test/views/mainBloc/main_bloc.dart';

import 'bloc/auth/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final UserRepository userRep = UserRepository();
  final AuthRepository authRep = AuthRepository(userRep);
  runApp(MyApp(
    authRepository: authRep,
    userRepository: userRep,
  ));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  final UserRepository userRepository;
  const MyApp(
      {Key? key, required this.authRepository, required this.userRepository})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authRepository,
      child: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(authRepository),
        child: RepositoryProvider.value(
          value: userRepository,
          child: MaterialApp(
            darkTheme: ThemeData(
                colorScheme: ColorScheme(
                    brightness: Brightness.dark,
                    primary: Colors.blue,
                    onPrimary: Colors.grey.shade900,
                    secondary: Colors.lightGreen.shade100,
                    onSecondary: Colors.black,
                    error: Colors.red,
                    onError: Colors.red,
                    background: Colors.black,
                    onBackground: Colors.black,
                    surface: Colors.grey.shade800,
                    onSurface: Colors.blue),
                textButtonTheme: TextButtonThemeData(
                    style: ButtonStyle(backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.grey.shade900;
                  } else {
                    return Colors.blue;
                  }
                }), foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.disabled)) {
                    return Colors.grey;
                  } else {
                    return Colors.white;
                  }
                })))),
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MainBloc(),
          ),
        ),
      ),
    );
  }
}
