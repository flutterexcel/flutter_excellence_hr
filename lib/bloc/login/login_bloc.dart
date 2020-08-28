import 'package:bloc/bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
//import '../authentication/authentication.dart';
import '../../services/authentication_services.dart';

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
    try {
      final currentUser = await _authenticationService.getCurrentUser();

      if (currentUser != null) {
        yield CheckAuthenticated(user: currentUser);
      } else {
        yield NotAuthenticated();
      }
    } catch (e) {
      //yield NotAuthenticated();
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
    print("login loading");
    yield LoginLoading();
    try {
      final user = await _authenticationService.signInWithEmailAndPassword(
          event.email, event.password);

      if (user != null) {
        // push new login event

        this.add(UserLogIn(user: user));
        // yield LoginSuccess();
        // yield LoginInitial();
      } else {
        yield LoginFailure(error: 'Something very weird just happened');
      }
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      yield LoginFailure(error: null);
    } catch (err) {
      yield LoginFailure(error: err.message ?? 'An unknown error occured');
    }
  }
}
