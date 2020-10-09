import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/leave/get_rh.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class GetRh {
  Post _post = Post();
  Future<GetRhLeaves> getRh() async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    var currDt = DateTime.now();
    Map data = {
      "action": "get_my_rh_leaves",
      "token": token,
      "year": currDt.year.toString(),
      "user_id": StorageUtil.getUserId()
    };
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]['message']);

      return GetRhLeaves.fromJson(res);
    });
  }
}
