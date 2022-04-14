part of 'entities.dart';

abstract class User {
  final DocumentReference id;
  final String name;
  final String surname;
  final int age;
  final String university;
  final String department;
  final String? photoUrl;

  User(
      {required this.id,
      required this.name,
      required this.surname,
      required this.age,
      required this.photoUrl,
      required this.department,
      required this.university});
}
