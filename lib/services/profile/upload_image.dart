import 'dart:async';
import 'dart:convert';
import 'dart:io';
import '../post.dart';
import '../../model/profile/ProfileDetails.dart';
import '../../app_config.dart';
import '../storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';

class UploadImage {
  Post _post = Post();
  Future<ProfileDetails> uploadImage(
      {String doctype, String action, File file}) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'uploadUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
    // get file length
    var length = await file.length();

    // multipart that takes file
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(file.path));

    Map data = {
      "file_upload_action": action,
      "token": token,
      "document_type": doctype,
      "file": multipartFile
    };
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);

      return ProfileDetails.fromJson(res);
    });
  }
}
