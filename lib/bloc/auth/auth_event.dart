part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LogOutEvent extends AuthEvent {}

class SignUpEvent extends AuthEvent {
  SignUpEvent(this.userData);
  final SignUpUserData userData;
}

class LogInEvent extends AuthEvent {
  LogInEvent(this.user);
  final User user;
}

class LoginRequest extends AuthEvent {
  LoginRequest(this.email, this.password);
  final String email;
  final String password;
}

class ErrorEvent extends AuthEvent {
  ErrorEvent(this.errorCode);
  final String errorCode;
}
