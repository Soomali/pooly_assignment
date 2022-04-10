part of 'login_bloc.dart';

@immutable
abstract class LoginState {
  EmailInput get email;
  PasswordInput get password;
}

class LoginInitial extends LoginState {
  @override
  final email = EmailInput.pure();
  @override
  final password = PasswordInput.pure();
}

class EmailInputChanged extends LoginState {
  @override
  final EmailInput email;
  @override
  final PasswordInput password;

  EmailInputChanged(String email, this.password)
      : email = EmailInput.dirty(email);
}

class PasswordInputChanged extends LoginState {
  @override
  final EmailInput email;
  @override
  final PasswordInput password;

  PasswordInputChanged(String password, this.email)
      : password = PasswordInput.dirty(password);
}

class SignupRequestState extends LoginState {
  @override
  final EmailInput email;
  @override
  final PasswordInput password;

  SignupRequestState(this.password, this.email);
}
