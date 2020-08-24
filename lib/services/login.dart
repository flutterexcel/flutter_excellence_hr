import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'post.dart';
import '../model/user.dart';

class Login {
  static final baseUrl = "https://apistaginghr.excellencetechnologies.in";
  static final loginUrl = baseUrl + "/attendance/API_HR/api.php";
  static final apiKey = null;
  Post _post = Post();
  Future<User> login(String username, String password) {
    //print(username + "" + password);
    Map data = {
      "token": apiKey,
      "action": "login",
      "username": username,
      "password": password
    };
    return _post
        .post(loginUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);
      if (res["error"] == 0) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', res["data"]["token"]);
        prefs.setString('userid', res["data"]["userid"]);
      }
      return User.map(res);
    });
  }
}
