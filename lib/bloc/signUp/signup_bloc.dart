import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:pooly_test/bloc/auth/auth_bloc.dart';
import '../login/login_bloc.dart';
part 'signup_event.dart';
part 'signup_state.dart';
part 'name_input.dart';
part 'surname_input.dart';
part 'age_input.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<AgeChanged>(_onAgeChangedEvent);
    on<NameChanged>(_onNameChangedEvent);
    on<SurnameChanged>(_onSurnameChangedEvent);
    on<PhotoChanged>(_onPhotoChangedEvent);
    on<PhotoSelect>(_onPhotoSelectEvent);
    on<EmailChanged>(_onMailChangedEvent);
    on<PasswordChanged>(_onPasswordChangedEvent);
  }

  void _onAgeChangedEvent(AgeChanged event, Emitter emit) {
    emit(AgeChangedState(state.email, state.name, state.surname, event.age,
        state.photo, state.password));
  }

  void _onNameChangedEvent(NameChanged event, Emitter emit) {
    emit(NameChangedState(state.email, event.name, state.surname, state.age,
        state.photo, state.password));
  }

  void _onMailChangedEvent(EmailChanged event, Emitter emit) {
    emit(EmailChangedState(event.email, state.name, state.surname, state.age,
        state.photo, state.password));
  }

  void _onSurnameChangedEvent(SurnameChanged event, Emitter emit) {
    emit(SurnameChangedState(state.email, state.name, event.surname, state.age,
        state.photo, state.password));
  }

  void _onPhotoChangedEvent(PhotoChanged event, Emitter emit) {
    emit(PhotoChangedState(state.email, state.name, state.surname, state.age,
        event.photoData, state.password));
  }

  void _onPhotoSelectEvent(PhotoSelect event, Emitter emit) {
    emit(PhotoSelectState(state.email, state.name, state.surname, state.age,
        state.photo, state.password));
  }

  void _onPasswordChangedEvent(PasswordChanged event, Emitter emit) {
    emit(PasswordChangedState(state.email, state.name, state.surname, state.age,
        state.photo, event.password));
  }
}
