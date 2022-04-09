part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  Authenticated(this.user);
  final User user;
}

class Authenticating extends AuthState {}

class UnAuthenticated extends AuthState {}

class AuthError extends AuthState {
  AuthError(this.error);
  final String error;
}
