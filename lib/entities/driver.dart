part of 'entities.dart';

class Driver extends User {
  Driver(
      {required DocumentReference<Object?> id,
      required String name,
      required String surname,
      required int age,
      required String university,
      required String department})
      : super(
            id: id,
            name: name,
            surname: surname,
            age: age,
            university: university,
            department: department);
}
