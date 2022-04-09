part of 'login_bloc.dart';

enum EmailInputError { empty }

class EmailInput extends FormzInput<String, EmailInputError> {
  EmailInput.dirty(String value) : super.dirty(value);
  EmailInput.pure() : super.pure("");
  @override
  EmailInputError? validator(String value) {
    return value.isEmpty && !pure ? EmailInputError.empty : null;
  }
}
