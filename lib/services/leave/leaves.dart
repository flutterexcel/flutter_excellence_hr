import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/leave/leave.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class GetLeaves {
  Post _post = Post();
  Future<Leave> getLeaves() async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {"action": "get_my_leaves", "token": token};
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]['message']);

      return Leave.fromJson(res);
    });
  }
}
