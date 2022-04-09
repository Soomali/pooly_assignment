part of 'entities.dart';

class SignUpUserData {
  final String name;
  final String surname;
  final int age;
  final String university;
  final String department;

  SignUpUserData(
      {required this.name,
      required this.surname,
      required this.age,
      required this.university,
      required this.department});
}
