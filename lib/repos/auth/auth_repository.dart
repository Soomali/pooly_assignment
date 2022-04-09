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

  void _transform(data, sink) async {
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

  Future<void> SignUp(entities.SignUpUserData data) async {
    try {} on FirebaseAuthException catch (e) {
      _errorStream.add(e.code);
    }
  }
}
