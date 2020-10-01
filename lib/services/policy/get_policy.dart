import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/policy/policy_document.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class GetPolicy {
  Post _post = Post();
  Future<PolicyDocument> getPolicy() async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {"action": "get_user_policy_document", "token": token};
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]['message']);

      return PolicyDocument.fromJson(res);
    });
  }
}
