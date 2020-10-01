import 'package:equatable/equatable.dart';

class User extends Equatable {
  final user;
  final String token;
  final String message;

  const User({this.user, this.token, this.message});

  @override
  List<Object> get props => [user, token, message];

  static User fromJson(dynamic json) {
    return User(
      user: json["data"]["userid"],
      token: json["data"]["token"],
      message: json["data"]["message"],
    );
  }

  @override
  String toString() => 'User { user: $user }';
}
