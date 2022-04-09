part of 'entities.dart';

class SignUpUserData {
  final String email;
  final String password;
  final String name;
  final String surname;
  final int age;
  final String university;
  final String department;

  SignUpUserData(
      {required this.email,
      required this.password,
      required this.name,
      required this.surname,
      required this.age,
      required this.university,
      required this.department});

  Map<String, dynamic> get map {
    return {
      'name': name,
      'surname': surname,
      'age': age,
      'university': university,
      'department': department
    };
  }
}
