import 'package:flutter_excellence_hr/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';
import '../services/login.dart';
import 'storage_service.dart';
import 'package:flutter_excellence_hr/services/login/google_login.dart';

abstract class AuthenticationService {
  Future<User> getCurrentUser();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
  Future<User> signInWithGoogleAndPassword(String token);
}

class LoginAuthenticationService extends AuthenticationService {
  @override
  Future<User> getCurrentUser() async {
    StorageUtil.getInstance();
    bool islogin = StorageUtil.getLoggedIn();
    if (islogin) {
      return User(
          user: StorageUtil.getUserId(), token: StorageUtil.getUserToken());
    }
    return null; // return null for now
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final Login api = Login();
    User user = await api.login(email, password);
    return User(user: user.user, token: user.token, message: user.message);
  }

  Future<User> signInWithGoogleAndPassword(String token) async {
    final LoginGoogle api = LoginGoogle();

    User user = await api.loginGoogle(token);

    return User(user: user.user, token: user.token, message: user.message);
  }

  @override
  Future<void> signOut() {
    StorageUtil.clear(true);
    
    //return null;
  }
}
