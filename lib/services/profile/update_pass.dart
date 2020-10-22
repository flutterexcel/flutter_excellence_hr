import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/profile/ProfileDetails.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class UpdatePassword {
  Post _post = Post();
  Future<ProfileDetails> updatePassword(String password) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {
      "action": "update_new_password",
      "token": token,
      "password": password
    };
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {

      return ProfileDetails.fromJson(res);
    });
  }
}
