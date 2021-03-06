part of 'entities.dart';

class SignUpUserData {
  final String email;
  final String password;
  final String name;
  final String surname;
  final String department;
  final String university;
  final int age;
  final Uint8List? photo;
  SignUpUserData(
      {required this.email,
      required this.password,
      required this.name,
      required this.surname,
      required this.age,
      this.department = '',
      this.university = '',
      this.photo});

  Map<String, dynamic> get map {
    return {
      'name': name,
      'surname': surname,
      'age': age,
      'department': department,
      'university': university
    };
  }
}
