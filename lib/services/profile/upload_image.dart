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
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';

class UploadImage {
  Future<http.Response> uploadImage(
      {String doctype, String action, File file, String leaveId = ''}) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'uploadUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Uri uri = Uri.parse(apiUrl);
    var fileStream =
        new http.ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();
    var request = new http.MultipartRequest("POST", uri);
    String mimeType = mime(basename(file.path));
    String mimee = mimeType.split('/')[0];
    String type = mimeType.split('/')[1];
    var multipartFile = new http.MultipartFile('link_1', fileStream, length,
        filename: basename(file.path), contentType: MediaType(mimee, type));
    request.files.add(multipartFile);
    Map<String, String> headers = {
      "file_upload_action": action,
      "token": token,
      "leaveid": leaveId,
      "document_type": doctype,
      "user_id": StorageUtil.getUserId()
    };
    request.fields.addAll(headers);

    return await request.send().then((result) async {
      return await http.Response.fromStream(result);
    });
  }
}

class UploadImg {
  int error;
  String message;

  UploadImg({this.error, this.message});

  UploadImg.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}
