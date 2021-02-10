import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/timesheet/submit_daily_report.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class TimeSheetDailyService {
  Post _post = Post();
  Future getDailyTimesheet({String totalHour, String comment,String date}) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {
      "action": "user_timesheet_entry",
      "token": token,
      "date": date,
      "hours": totalHour,
      "comments": comment,
      "user_id": StorageUtil.getUserId()
    };

    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);
      return SubmitDailyReport.fromJson(res);
    });
  }
}
