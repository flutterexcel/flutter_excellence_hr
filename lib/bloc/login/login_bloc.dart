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
    print("object");
    try {
      final currentUser = await _authenticationService.getCurrentUser();

      if (currentUser != null) {
        this.add(UserLogIn(user: currentUser.user));
        yield CheckAuthenticated(user: currentUser.user);
      } else {
        yield LoginFailure();
      }
    } catch (e) {
      yield LoginFailure();
    }
  }

  Stream<LoginState> _mapUserLogInToState(UserLogIn event) async* {
    yield CheckAuthenticated(user: event.user);
  }

  Stream<LoginState> _mapUserLogOutToState(UserLogOut event) async* {
    await _authenticationService.signOut();
    yield LoginFailure();
  }

  Stream<LoginState> _mapLoginWithEmailToState(
      LoginInWithEmailButtonPressed event) async* {
    
    //yield LoginLoading();
    try {
      print("LOgin succes");
      final user = await _authenticationService.signInWithEmailAndPassword(
          event.email, event.password);
    print("try");
      if (user != null) {
        // push new login event

        this.add(UserLogIn(user: user));
        yield LoginSuccess();
      } else {
        yield LoginFailure(error: 'Login failed');
      }
      // ignore: unused_catch_clause
    } on Exception catch (e) {
      print("catch 1");
      yield LoginFailure(error: 'Login failed');
    } catch (err) {
      print("catch 2"+err);
      yield LoginFailure(error: 'Login failed');
    }
  }
}
