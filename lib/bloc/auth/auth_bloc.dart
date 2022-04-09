import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pooly_test/bloc/login/login_bloc.dart';
import 'package:pooly_test/entities/entities.dart';
import 'package:pooly_test/repos/auth/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._repository) : super(UnAuthenticated()) {
    on<ErrorEvent>(_onErrorEvent);
    on<LoginRequest>(_onLogInRequest);
    on<LogInEvent>(_onLogInEvent);
    on<LogOutEvent>(_onLogOutEvent);
  }
  final AuthRepository _repository;
  late final _selfSubscription = _repository.self.listen((event) {
    if (event == null) {
      add(LogOutEvent());
    } else {
      add(LogInEvent(event));
    }
  });

  late final _errorSubscription = _repository.errorStream.listen((event) {
    add(ErrorEvent(event));
  });

  void _onLogInRequest(LoginRequest event, Emitter emit) {
    emit(Authenticating());
    _repository.signIn(event.email, event.password);
  }

  void _onErrorEvent(ErrorEvent event, Emitter emit) {
    emit(AuthError(event.errorCode));
  }

  void _onLogOutEvent(LogOutEvent event, Emitter emit) {
    _repository.signOut();
    emit(UnAuthenticated());
  }

  void _onLogInEvent(LogInEvent event, Emitter emit) {
    emit(Authenticated(event.user));
  }
}
