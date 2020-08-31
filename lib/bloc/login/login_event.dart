import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../../model/user.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
  @override
  List<Object> get props => [];
}

class LoginInWithEmailButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginInWithEmailButtonPressed(
      {@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];
}

// Fired just after the app is launched
class AppLoad extends LoginEvent {}

// Fired when a user has successfully logged in
class UserLogIn extends LoginEvent {
  final User user;

  UserLogIn({@required this.user});

  @override
  List<Object> get props => [user];
}

// Fired when the user has logged out
class UserLogOut extends LoginEvent {}
