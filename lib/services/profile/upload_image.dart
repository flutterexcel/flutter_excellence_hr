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

    Map data = {
      "file_upload_action": action,
      "token": token,
      "document_type": doctype
    };
    Map<String, String> headers = {
      "file_upload_action": action,
      "token": token,
      "document_type": doctype
    };
    Uri uri = Uri.parse(apiUrl);
    var fileStream =
        new http.ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();
    print(uri);
    var request = new http.MultipartRequest("POST", uri);
//add your fields here
    request.fields.addAll(headers);

    var multipartFile = new http.MultipartFile('link_1', fileStream, length,
        filename: basename(file.path));
    request.files.add(multipartFile);
    var response = await request.send();
    print('rrrrr');
    print(response);
    //do whatever you want with the response
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);

      return ProfileDetails.fromJson(res);
    });
  }
}
