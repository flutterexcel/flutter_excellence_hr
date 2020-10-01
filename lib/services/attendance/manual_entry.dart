import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class ManualAttendance {
  Post _post = Post();
  Future manualEntry(
      String entry, String exit, String reason, String date) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {
      "action": "add_manual_attendance",
      "token": token,
      "entry_time": entry,
      "exit_time": exit,
      "reason": reason,
      "date": date,
      "userid": StorageUtil.getUserId()
    };
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);
      return res;
    });
  }
}
