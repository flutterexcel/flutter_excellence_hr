import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/timesheet/timesheetupdated.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class TimeSheetUpdateService {
  Post _post = Post();
  Future<TimeSheetUpdated> getDailyTimesheetUpdated() async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    String fromDate = '2020-12-14';
    String comment = ' * worked on HRMS app resolve some issues.↵ * try to deploy flutter sensor app on IOS plattform.↵ * learn design patterns and stream in flutter.';
    final apiUrl = prodUrl.baseUrl;
    Map data = {
      "action": "user_timesheet_entry",
      "applied_on": '2020-12-21',
      "token": token,
      "comments":comment,
      "date": fromDate,
      "fileId": 2069,
      "user_id": StorageUtil.getUserId()
    };

    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);
      return TimeSheetUpdated.fromJson(res);
    });
  }
}