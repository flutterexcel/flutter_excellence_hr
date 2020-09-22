import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/attendance/month_attendance.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class GetAttendance {
  Post _post = Post();
  Future<MonthAttendance> getAttendance(
      String month, String year, String userid) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {
      "action": "month_attendance",
      "token": token,
      "month": month,
      "year": year,
      "userid": userid
    };
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]['message']);

      return MonthAttendance.fromJson(res);
    });
  }
}
