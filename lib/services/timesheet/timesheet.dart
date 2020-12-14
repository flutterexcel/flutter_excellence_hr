import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/timesheet/timesheet.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class TimeSheetService {
  Post _post = Post();
  Future<TimeSheet> getTimesheet() async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    String fromDate = '2020-12-07';
    final apiUrl = prodUrl.baseUrl;
    Map data = {
      "action": "get_user_timesheet",
      "token": token,
      "from_date": fromDate,
      "user_id": StorageUtil.getUserId()
    };
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      print(apiUrl);
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);
      return TimeSheet.fromJson(res);
    });
  }
}
