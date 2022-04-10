part of 'signup_bloc.dart';

enum SurnameInputError { empty }

class SurnameInput extends FormzInput<String, SurnameInputError> {
  SurnameInput.dirty(value) : super.dirty(value);
  SurnameInput.pure() : super.pure('');
  @override
  validator(value) {
    return value.isEmpty ? SurnameInputError.empty : null;
  }
}
