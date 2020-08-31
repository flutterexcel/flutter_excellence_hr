import '../model/user.dart';
import '../services/login.dart';
import 'storage_service.dart';

abstract class AuthenticationService {
  Future<User> getCurrentUser();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class LoginAuthenticationService extends AuthenticationService {
  @override
  Future<User> getCurrentUser() async {
    final islogin = StorageUtil.getLoggedIn();
    if (islogin) {
      return User(user: StorageUtil.getUserId());
    }
    return null; // return null for now
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final Login api = Login();
    User user = await api.login(email, password);
    return User(user: user.user, token: user.token, message: user.message);
  }

  @override
  Future<void> signOut() {
    return null;
  }
}
