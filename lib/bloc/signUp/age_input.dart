part of 'signup_bloc.dart';

enum AgeInputError { underAge }

class AgeInput extends FormzInput<int, AgeInputError> {
  AgeInput.dirty(value) : super.dirty(value);
  AgeInput.pure() : super.pure(18);
  @override
  validator(value) {
    return value < 18 ? AgeInputError.underAge : null;
  }
}
