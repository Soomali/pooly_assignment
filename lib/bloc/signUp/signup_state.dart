part of 'signup_bloc.dart';

@immutable
abstract class SignupState {
  EmailInput get email;
  NameInput get name;
  SurnameInput get surname;
  AgeInput get age;
  PasswordInput get password;
  NameInput get department;
  NameInput get university;
  Uint8List? get photo;
}

class SignupInitial extends SignupState {
  @override
  final email = EmailInput.pure();
  @override
  final password = PasswordInput.pure();
  @override
  final name = NameInput.pure();
  @override
  final surname = SurnameInput.pure();
  @override
  final age = AgeInput.pure();
  @override
  final photo = null;

  @override
  final university = NameInput.pure();

  @override
  final department = NameInput.pure();
}

class EmailChangedState extends SignupState {
  @override
  final EmailInput email;
  @override
  final NameInput name;
  @override
  final PasswordInput password;
  @override
  final SurnameInput surname;
  @override
  final AgeInput age;
  @override
  final Uint8List? photo;
  @override
  final NameInput university;
  @override
  final NameInput department;
  EmailChangedState(String email, this.name, this.surname, this.age, this.photo,
      this.password, this.university, this.department)
      : email = EmailInput.dirty(email);
}

class NameChangedState extends SignupState {
  @override
  final PasswordInput password;
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
  @override
  final NameInput university;
  @override
  final NameInput department;
  NameChangedState(this.email, String name, this.surname, this.age, this.photo,
      this.password, this.university, this.department)
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
  @override
  final PasswordInput password;
  @override
  final NameInput university;
  @override
  final NameInput department;
  SurnameChangedState(this.email, this.name, String surname, this.age,
      this.photo, this.password, this.university, this.department)
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
  @override
  final PasswordInput password;
  @override
  final NameInput university;
  @override
  final NameInput department;
  AgeChangedState(this.email, this.name, this.surname, int age, this.photo,
      this.password, this.university, this.department)
      : age = AgeInput.dirty(age);
}

class PhotoChangedState extends SignupState {
  @override
  final PasswordInput password;
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
  @override
  final NameInput university;
  @override
  final NameInput department;
  PhotoChangedState(this.email, this.name, this.surname, this.age, this.photo,
      this.password, this.university, this.department);
}

class PhotoSelectState extends PhotoChangedState {
  PhotoSelectState(
      EmailInput email,
      NameInput name,
      SurnameInput surname,
      AgeInput age,
      Uint8List? photo,
      PasswordInput password,
      NameInput university,
      NameInput department)
      : super(
            email, name, surname, age, photo, password, university, department);
}

class SignupInProgress extends SignupState {
  @override
  final PasswordInput password;
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
  @override
  final NameInput university;
  @override
  final NameInput department;
  SignupInProgress(this.email, this.name, this.surname, this.age, this.photo,
      this.password, this.university, this.department);
}

class SignUpFail extends SignupState {
  @override
  final PasswordInput password;
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
  @override
  final NameInput university;
  @override
  final NameInput department;
  SignUpFail(this.email, this.name, this.surname, this.age, this.photo,
      this.password, this.university, this.department);
}

class PasswordChangedState extends SignupState {
  @override
  final PasswordInput password;
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
  @override
  final NameInput university;
  @override
  final NameInput department;
  PasswordChangedState(this.email, this.name, this.surname, this.age,
      this.photo, String password, this.university, this.department)
      : password = PasswordInput.dirty(password);
}

class DepartmentChangedState extends SignupState {
  @override
  final EmailInput email;
  @override
  final NameInput name;
  @override
  final PasswordInput password;
  @override
  final SurnameInput surname;
  @override
  final AgeInput age;
  @override
  final Uint8List? photo;
  @override
  final NameInput university;
  @override
  final NameInput department;
  DepartmentChangedState(this.email, this.name, this.surname, this.age,
      this.photo, this.password, this.university, String department)
      : department = NameInput.dirty(department);
}

class UniversityChangedState extends SignupState {
  @override
  final EmailInput email;
  @override
  final NameInput name;
  @override
  final PasswordInput password;
  @override
  final SurnameInput surname;
  @override
  final AgeInput age;
  @override
  final Uint8List? photo;
  @override
  final NameInput university;
  @override
  final NameInput department;
  UniversityChangedState(this.email, this.name, this.surname, this.age,
      this.photo, this.password, String university, this.department)
      : university = NameInput.dirty(university);
}
