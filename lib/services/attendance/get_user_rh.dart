import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/attendance/user_rh.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class GetUserRh {
  Post _post = Post();
  Future<UserRh> getRh(String year) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {
      "action": "user_rh_list_for_compensation",
      "token": token,
      "year": year,
      "user_id": StorageUtil.getUserId()
    };
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]['message']);

      return UserRh.fromJson(res);
    });
  }
}
