import 'dart:async';
import 'dart:convert';
import 'package:flutter_excellence_hr/screens/weekly_timesheet/weekly_timesheet.dart';

import '../post.dart';
import '../../model/timesheet/timesheet.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class TimeSheetService {
  Post _post = Post();
  Future<TimeSheet> getTimesheet({String fromDate}) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
   // String fromDate = '2020-11-30';
    final apiUrl = prodUrl.baseUrl;
    Map data = {
      "action": "get_user_timesheet",
      "token": token,
      "from_date": fromDate,
      "user_id": StorageUtil.getUserId()
    };
    //print("The from date")
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);
      return TimeSheet.fromJson(res);
    });
  }
}
