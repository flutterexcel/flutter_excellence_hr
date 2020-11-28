import 'package:bloc/bloc.dart';
import 'package:flutter_excellence_hr/model/user.dart';
import 'package:flutter_excellence_hr/services/inventory/get_inventory.dart';
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
    if (event is LoginInWithGoogleButtonPressed) {
      yield* _mapLoginWithGoogleToState(event);
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
    // yield AuthenticationLoad(); // to display splash screen

    User currentUser;
    try {
      await Inventory().inventory();
      await _authenticationService.getCurrentUser().then((value) {
        currentUser = value;
      });
      if (currentUser != null) {
        this.add(UserLogIn(user: currentUser));
        yield LoginSuccess();
      } else {
        yield LoginFailure(error: 'Login failed');
      }
    } catch (e) {
      yield LoginFailure(error: 'Login failed');
    }
  }

  Stream<LoginState> _mapUserLogInToState(UserLogIn event) async* {
    if (event.user.token == StorageUtil.getUserToken()) {
      yield CheckAuthenticated(user: event.user);
    } else {
      yield LoginFailure();
    }
  }

  Stream<LoginState> _mapUserLogOutToState(UserLogOut event) async* {
    await _authenticationService.signOut();
    yield LoginFailure();
  }

  Stream<LoginState> _mapLoginWithEmailToState(
      LoginInWithEmailButtonPressed event) async* {
    //StorageUtil.clear(true);
    User user;
    try {
      await _authenticationService
          .signInWithEmailAndPassword(event.email, event.password)
          .then((value) {
        if (value.token != null) {
          user = value;
        }
      });

      if (user.token != null) {
        this.add(UserLogIn(user: user));
        yield LoginSuccess();
      } else {
        yield LoginFailure(error: 'Login failed');
      }
    } catch (err) {
      yield LoginFailure(error: 'Login failed');
    }
  }

  Stream<LoginState> _mapLoginWithGoogleToState(
      LoginInWithGoogleButtonPressed event) async* {
    //StorageUtil.clear(true);
    try {
      final user = await _authenticationService
          .signInWithGoogleAndPassword(event.googleToken);
      if (user != null) {
        // push new login event
        this.add(UserLogIn(user: user));
        yield LoginSuccess();
      } else {
        yield LoginFailure(error: 'Login failed');
      }
    } catch (err) {
      yield LoginFailure(error: 'Login failed');
    }
  }
}
