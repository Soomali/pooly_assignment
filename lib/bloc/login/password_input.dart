part of 'login_bloc.dart';

enum PasswordInputError { empty }

class PasswordInput extends FormzInput<String, PasswordInputError> {
  PasswordInput.dirty(String value) : super.dirty(value);
  PasswordInput.pure() : super.pure("");
  @override
  PasswordInputError? validator(String value) {
    return value.isEmpty ? PasswordInputError.empty : null;
  }
}
