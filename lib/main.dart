import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pooly_test/repos/auth/auth_repository.dart';
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
  ));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;
  const MyApp({Key? key, required this.authRepository}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authRepository,
      child: BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(authRepository),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(authRepository),
            child: MainBloc(),
          ),
        ),
      ),
    );
  }
}
