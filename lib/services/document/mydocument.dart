import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/document/document_list.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class MyDocument {
  Post _post = Post();
  Future<DocumentList> getDocument() async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'salUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {"action": "get_user_document", "token": token};
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);
      return DocumentList.fromJson(res);
    });
  }
}
