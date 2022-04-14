import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../entities/entities.dart';

class UserRepository {
  final _firestore = FirebaseFirestore.instance;
  DocumentReference getPassengerRef(String uuid) {
    return _firestore.doc('Passengers/$uuid');
  }

  Future<Passenger?> getPassenger(String uuid) async {
    final value = await getPassengerRef(uuid).get();

    if (value.exists) {
      final data = value.data() as Map<String, dynamic>;
      return Passenger(
          photoUrl: null,
          name: data['name'],
          surname: data['surname'],
          age: data['age'],
          id: value.reference);
    }
    return null;
  }

  Future<Passenger?> getDriver(String uuid) async {
    _firestore.doc('Drivers/$uuid').get().then((value) {
      if (value.exists) {
        return null;
      }
      return null;
    });
  }

  Future<void> createPassenger(SignUpUserData data, String uuid) async {
    _firestore.doc('Passengers/$uuid').set(data.map);
  }
}
