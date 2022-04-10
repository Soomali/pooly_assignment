import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:pooly_test/repos/user/user_repository.dart';
import '../../entities/entities.dart' as entities;

class AuthRepository {
  AuthRepository(this._userRepository);

  final UserRepository _userRepository;
  final _auth = FirebaseAuth.instance;

  final StreamController<String> _errorStream = StreamController();
  Stream<String> get errorStream => _errorStream.stream;

  Stream<entities.User?> get self =>
      _auth.authStateChanges().transform<entities.User?>(
          StreamTransformer.fromHandlers(handleData: _transform));

  void _transform(User? data, EventSink sink) async {
    if (data == null) {
      sink.add(null);
    } else {
      final uuid = data.uid;
      final passengerFuture = _userRepository.getPassenger(uuid);
      final driverFuture = _userRepository.getDriver(uuid);
      final results =
          await Future.wait<entities.User?>([passengerFuture, driverFuture]);
      sink.add(results.firstWhere((element) => element != null));
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      _errorStream.add(e.code);
    }
  }

  Future<String?> signUp(entities.SignUpUserData data) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
          email: data.email, password: data.password);
      _userRepository.createPassenger(data, credential.user!.uid);
      return credential.user!.uid;
    } on FirebaseAuthException catch (e) {
      _errorStream.add(e.code);
    }
  }

  Future<void> signOut() => _auth.signOut();
}
