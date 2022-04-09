part of 'entities.dart';

abstract class User extends SignUpUserData {
  final DocumentReference id;

  User(
      {required this.id,
      required String name,
      required String surname,
      required int age,
      required String university,
      required String department})
      : super(
            name: name,
            surname: surname,
            age: age,
            university: university,
            department: department);
}
