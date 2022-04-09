import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../entities/entities.dart';

class UserRepository {
  final _firestore = FirebaseFirestore.instance;
  Future<Passenger?> getPassenger(String uuid) async {
    _firestore.doc('Passengers/$uuid').get().then((value) {
      if (value.exists) {
        //TODO chagne this to return passenger;
        return null;
      }
      return null;
    });
  }

  Future<Passenger?> getDriver(String uuid) async {
    _firestore.doc('Drivers/$uuid').get().then((value) {
      if (value.exists) {
        //TODO chagne this to return passenger;
        return null;
      }
      return null;
    });
  }

  Future<void> createPassenger(SignUpUserData data, String uuid) async {
    _firestore.doc('Passengers/$uuid').set(data.map);
  }
}
