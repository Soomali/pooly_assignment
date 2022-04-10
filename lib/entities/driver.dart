part of 'entities.dart';

class Driver extends User {
  Driver(
      {required DocumentReference<Object?> id,
      required String name,
      required String surname,
      required int age,
      required String? photoUrl})
      : super(
            id: id, name: name, surname: surname, age: age, photoUrl: photoUrl);
}
