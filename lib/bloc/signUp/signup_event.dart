part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}

class EmailChanged extends SignupEvent {
  final String email;
  EmailChanged(this.email);
}

class NameChanged extends SignupEvent {
  final String name;
  NameChanged(this.name);
}

class SurnameChanged extends SignupEvent {
  final String surname;
  SurnameChanged(this.surname);
}

class PasswordChanged extends SignupEvent {
  final String password;
  PasswordChanged(this.password);
}

class AgeChanged extends SignupEvent {
  final int age;
  AgeChanged(String age) : age = age.isEmpty ? 0 : int.parse(age);
}

class PhotoChanged extends SignupEvent {
  final Uint8List? photoData;
  PhotoChanged(this.photoData);
}

class PhotoSelect extends SignupEvent {
  final ImageSource source;
  PhotoSelect({this.source = ImageSource.gallery});
}

class SignUpSubmitted extends SignupEvent {}
