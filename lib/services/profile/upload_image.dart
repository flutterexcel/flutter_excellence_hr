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
  Future<UploadImg> uploadImage(
      {String doctype, String action, File file}) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'uploadUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;

    Map data = {
      "file_upload_action": action,
      "token": token,
      "document_type": doctype
    };

    Uri uri = Uri.parse(apiUrl);
    var fileStream =
        new http.ByteStream(DelegatingStream.typed(file.openRead()));
    var length = await file.length();
    print(uri);
    var postUris = Uri.parse(
        "http://dynamic.hr.excellencetechnologies.in/dynamic_hr/HrApi/backend/attendance/API_HR/generic-file-upload.php");

    var request = new http.MultipartRequest("POST", uri);
//add your fields here

    var multipartFile = new http.MultipartFile('link_1', fileStream, length,
        filename: basename(file.path));
    request.files.add(multipartFile);
    Map<String, String> headers = {
      "file_upload_action": action,
      "token": token,
      "document_type": doctype
    };
    request.fields.addAll(headers);

    request
        .send()
        .then((result) async {
          http.Response.fromStream(result).then((response) {
            if (response.statusCode == 200) {
              print("Uploaded! ");
              print('response.body ' + response.body);
            }

            return response.body;
          });
        })
        .catchError((err) => print('error : ' + err.toString()))
        .whenComplete(() {});

    print('rrrrr');

    var postUri = Uri.parse(
        "http://dynamic.hr.excellencetechnologies.in/dynamic_hr/HrApi/backend/attendance/API_HR/generic-file-upload.php");
    var request1 = new http.MultipartRequest("POST", postUri);

    request1.fields['file_upload_action'] = action;
    request1.fields['token'] = token;
    request1.fields['document_type'] = doctype;

    request1.files
        .add(await http.MultipartFile.fromPath('link_1', file.absolute.path));
    print(request1.toString());
    request1
        .send()
        .then((result) async {
          http.Response.fromStream(result).then((response) {
            if (response.statusCode == 200) {
              print("Uploaded! rrrr");
              print('response.body ' + response.body);
            }
            return response.body;
          });
        })
        .catchError((err) => print('error : ' + err.toString()))
        .whenComplete(() {});
    //do whatever you want with the response
    // return _post
    //     .post(apiUrl, body: json.encode(data))
    //     .then((dynamic res) async {
    //   if (res["error"] >= 1) throw new Exception(res["data"]["message"]);

    //   return ProfileDetails.fromJson(res);
    // });
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
