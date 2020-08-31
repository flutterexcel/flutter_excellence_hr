import 'package:bloc/bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../../services/authentication_services.dart';
import '../../services/storage_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationService _authenticationService;

  LoginBloc(AuthenticationService authenticationService)
      : assert(authenticationService != null),
        _authenticationService = authenticationService,
        super(null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginInWithEmailButtonPressed) {
      yield* _mapLoginWithEmailToState(event);
    }
    if (event is AppLoad) {
      yield* _mapAppLoadToState(event);
    }

    if (event is UserLogIn) {
      yield* _mapUserLogInToState(event);
    }

    if (event is UserLogOut) {
      yield* _mapUserLogOutToState(event);
    }
  }

  Stream<LoginState> _mapAppLoadToState(AppLoad event) async* {
    yield AuthenticationLoad(); // to display splash screen
    StorageUtil.getInstance();
    try {
      final currentUser = await _authenticationService.getCurrentUser();

      if (currentUser != null) {
        this.add(UserLogIn(user: currentUser.user));
        yield CheckAuthenticated(user: currentUser.user);
      } else {
        yield NotAuthenticated();
      }
    } catch (e) {
      yield NotAuthenticated();
    }
  }

  Stream<LoginState> _mapUserLogInToState(UserLogIn event) async* {
    yield CheckAuthenticated(user: event.user);
  }

  Stream<LoginState> _mapUserLogOutToState(UserLogOut event) async* {
    await _authenticationService.signOut();
    yield NotAuthenticated();
  }

  Stream<LoginState> _mapLoginWithEmailToState(
      LoginInWithEmailButtonPressed event) async* {
    yield LoginLoading();
    try {
      final user = await _authenticationService.signInWithEmailAndPassword(
          event.email, event.password);

      if (user != null) {
        // push new login event

        this.add(UserLogIn(user: user));
        yield LoginSuccess();
        yield LoginInitial();
      } else {
        yield LoginFailure(error: 'Login failed');
        yield NotAuthenticated();
      }
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      yield LoginFailure(error: 'Login failed');
      yield NotAuthenticated();
    } catch (err) {
      yield LoginFailure(error: 'Login failed');
      yield NotAuthenticated();
    }
  }
}
