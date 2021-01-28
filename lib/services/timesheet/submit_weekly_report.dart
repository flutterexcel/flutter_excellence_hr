import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/timesheet/submit_timesheet.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class TimeSheetWeeklyService {
  Post _post = Post();
  Future sentWeeklyTimesheet({String date}) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {
      "action": "submit_timesheet",
      "token": token,
      "from_date": date,
      "user_id": StorageUtil.getUserId()
    };    
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      return SubmitTimeSheet.fromJson(res);
    });
  }
}
