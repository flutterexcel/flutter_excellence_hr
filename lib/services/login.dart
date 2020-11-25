import 'dart:async';
import 'dart:convert';
import 'package:flutter_excellence_hr/globals.dart';
import 'package:flutter_session/flutter_session.dart';

import 'post.dart';
import '../model/user.dart';
import '../app_config.dart';
import 'storage_service.dart';

class Login {
  static final apiKey = null;
  Post _post = Post();
  Future<User> login(String username, String password) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    final loginUrl = prodUrl.baseUrl;

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
        StorageUtil.setUserToken(res["data"]["token"]);
        shareData.setString('usertoken', res["data"]["token"]);
        StorageUtil.setUserId(res["data"]["userid"]);
        shareData.setString('userid', res["data"]["userid"]);
        StorageUtil.setLoggedIn(true);
      }
      print('>>>>>>>>>>>>>>>>>>>>>${shareData.getString('userid')}');
      return User.fromJson(res);
    });
  }
}
