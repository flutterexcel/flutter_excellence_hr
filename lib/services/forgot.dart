import 'dart:async';
import 'dart:convert';
import 'post.dart';
import '../model/user.dart';
import '../app_config.dart';

class Forgot {
  Post _post = Post();
  Future<User> forgot(String username, String password) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    final loginUrl = prodUrl.baseUrl;
    Map data = {"action": "forgot_password", "username": username};
    return _post
        .post(loginUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);

      return User.fromJson(res);
    });
  }
}
