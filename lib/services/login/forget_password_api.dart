import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/profile/ProfileDetails.dart';
import '../../app_config.dart';

class UpdateForgetPassword {
  Post _post = Post();
  Future<ProfileDetails> updateForgetPassword(String username) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    final apiUrl = prodUrl.baseUrl;
    Map data = {"action": "forgot_password", "username": username};
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      return ProfileDetails.fromJson(res);
    });
  }
}
