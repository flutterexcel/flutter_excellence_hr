import '../model/user.dart';
import '../services/login.dart';

abstract class AuthenticationService {
  Future<User> getCurrentUser();
  Future<User> signInWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class FakeAuthenticationService extends AuthenticationService {
  @override
  Future<User> getCurrentUser() async {
    return null; // return null for now
  }

  @override
  Future<User> signInWithEmailAndPassword(String email, String password) async {
    final Login api = Login();
    await api.login(email, password).then((User user) {
      print(user.token);
    });

    return User(email, password, user: 'test');
    // if (email.toLowerCase() != 'test@domain.com' || password != 'testpass123') {
    //   throw Exception('Wrong username or password');
    // }
  }

  @override
  Future<void> signOut() {
    return null;
  }
}
