import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/profile/ProfileDetails.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class UploadImage {
  Post _post = Post();
  Future<ProfileDetails> uploadImage(String type, String action) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {
      "file_upload_action": action,
      "token": token,
      "document_type": type,
      "":
    };
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);

      return ProfileDetails.fromJson(res);
    });
  }
}
