part of 'login_bloc.dart';

enum EmailInputError { empty, invalid }

final _emailRegexp = RegExp('^[A-Za-z0-9._%+-]+@[A-Za-z]([A-Za-z])*.edu.tr\$');

class EmailInput extends FormzInput<String, EmailInputError> {
  EmailInput.dirty(String value) : super.dirty(value);
  EmailInput.pure() : super.pure("");
  @override
  EmailInputError? validator(String value) {
    return value.isEmpty
        ? EmailInputError.empty
        : _emailRegexp.hasMatch(value)
            ? null
            : EmailInputError.invalid;
  }
}
