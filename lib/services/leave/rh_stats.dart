import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/leave/rh_stats.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class GetRhStats {
  Post _post = Post();
  Future<RhStats> getRhStats() async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    var currDt = DateTime.now();
    Map data = {
      "action": "get_user_rh_stats",
      "token": token,
      "year": currDt.year.toString(),
      "user_id": StorageUtil.getUserId()
    };
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]['message']);

      return RhStats.fromJson(res);
    });
  }
}
