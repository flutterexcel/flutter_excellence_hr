import 'dart:convert';

import 'package:flutter_excellence_hr/model/leave/leave_day.dart';
import 'package:flutter_excellence_hr/services/post.dart';

import '../../app_config.dart';
import '../storage_service.dart';

class ApplyLeaveDate {
  Post _post = Post();
  Future<LeaveDate> applyLeaveDate(String startDate, String endDate) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {
      "action": "get_days_between_leaves",
      "end_date": endDate,
      "start_date": startDate,
      "token": token,
    };
    return await _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);
      return LeaveDate.fromJson(res);
    });
  }
}
