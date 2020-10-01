import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../../model/user.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({this.error});

  @override
  List<Object> get props => [error];
}

class CheckAuthenticated extends LoginState {
  final User user;

  CheckAuthenticated({@required this.user});

  @override
  List<Object> get props => [user];
}

class AuthenticationLoad extends LoginState {}
