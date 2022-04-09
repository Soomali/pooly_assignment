part of 'entities.dart';

abstract class User {
  final DocumentReference id;
  final String name;
  final String surname;
  final int age;
  final String university;
  final String department;

  User(
      {required this.id,
      required this.name,
      required this.surname,
      required this.age,
      required this.university,
      required this.department});
}
