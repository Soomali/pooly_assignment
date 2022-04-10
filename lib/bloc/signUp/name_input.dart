part of 'signup_bloc.dart';

enum NameInputError { empty }

class NameInput extends FormzInput<String, NameInputError> {
  NameInput.dirty(value) : super.dirty(value);
  NameInput.pure() : super.pure('');
  @override
  validator(value) {
    return value.isEmpty ? NameInputError.empty : null;
  }
}
