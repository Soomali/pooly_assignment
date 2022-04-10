part of 'signup_bloc.dart';

@immutable
abstract class SignupState {
  EmailInput get email;
  NameInput get name;
  SurnameInput get surname;
  AgeInput get age;
  Uint8List? get photo;
}

class SignupInitial extends SignupState {
  @override
  final email = EmailInput.pure();
  @override
  final name = NameInput.pure();
  @override
  final surname = SurnameInput.pure();
  @override
  final age = AgeInput.pure();
  @override
  final photo = null;
}

class EmailChangedState extends SignupState {
  @override
  final EmailInput email;
  @override
  final NameInput name;
  @override
  final SurnameInput surname;
  @override
  final AgeInput age;
  @override
  final Uint8List? photo;
  EmailChangedState(String email, this.name, this.surname, this.age, this.photo)
      : email = EmailInput.dirty(email);
}

class NameChangedState extends SignupState {
  @override
  final EmailInput email;
  @override
  final NameInput name;
  @override
  final SurnameInput surname;
  @override
  final AgeInput age;
  @override
  final Uint8List? photo;
  NameChangedState(this.email, String name, this.surname, this.age, this.photo)
      : name = NameInput.dirty(name);
}

class SurnameChangedState extends SignupState {
  @override
  final EmailInput email;
  @override
  final NameInput name;
  @override
  final SurnameInput surname;
  @override
  final AgeInput age;
  @override
  final Uint8List? photo;
  SurnameChangedState(
      this.email, this.name, String surname, this.age, this.photo)
      : surname = SurnameInput.dirty(surname);
}

class AgeChangedState extends SignupState {
  @override
  final EmailInput email;
  @override
  final NameInput name;
  @override
  final SurnameInput surname;
  @override
  final AgeInput age;
  @override
  final Uint8List? photo;
  AgeChangedState(this.email, this.name, this.surname, int age, this.photo)
      : age = AgeInput.dirty(age);
}

class PhotoChangedState extends SignupState {
  @override
  final EmailInput email;
  @override
  final NameInput name;
  @override
  final SurnameInput surname;
  @override
  final AgeInput age;
  @override
  final Uint8List? photo;
  PhotoChangedState(this.email, this.name, this.surname, this.age, this.photo);
}

class PhotoSelectState extends PhotoChangedState {
  PhotoSelectState(EmailInput email, NameInput name, SurnameInput surname,
      AgeInput age, Uint8List? photo)
      : super(email, name, surname, age, photo);
}

class SignupInProgress extends SignupState {
  @override
  final EmailInput email;
  @override
  final NameInput name;
  @override
  final SurnameInput surname;
  @override
  final AgeInput age;
  @override
  final Uint8List? photo;
  SignupInProgress(this.email, this.name, this.surname, this.age, this.photo);
}

class SignUpFail extends SignupState {
  @override
  final EmailInput email;
  @override
  final NameInput name;
  @override
  final SurnameInput surname;
  @override
  final AgeInput age;
  @override
  final Uint8List? photo;
  SignUpFail(this.email, this.name, this.surname, this.age, this.photo);
}
