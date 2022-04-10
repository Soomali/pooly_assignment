import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:pooly_test/bloc/auth/auth_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'email_input.dart';
part 'password_input.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<PasswordChanged>(_onPasswordChanged);
    on<EmailChanged>(_onEmailChanged);
    on<SignupRequest>(_onSignUpRequest);
  }
  void _onPasswordChanged(PasswordChanged event, Emitter emit) {
    emit(PasswordInputChanged(event.password, state.email));
  }

  void _onEmailChanged(EmailChanged event, Emitter emit) {
    emit(EmailInputChanged(event.email, state.password));
  }

  void _onSignUpRequest(SignupRequest event, Emitter emit) {
    emit(SignupRequestState(state.password, state.email));
  }
}
