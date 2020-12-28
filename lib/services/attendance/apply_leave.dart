import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class ApplyLeave {
  Post _post = Post();
  Future applyLeave(
      {String fromDate,
      String toDate,
      String reason,
      String leaveType,
      String noOfDays,
      String lateReason,
      List rhDates}) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {
      "action": "apply_leave",
      "token": token,
      "from_date": fromDate,
      "to_date": toDate,
      'reason':reason,
      "late_reason": lateReason,
      "leave_type": leaveType,
      "no_of_days": noOfDays,
      "day_status": "",
      "doc_link": "",
      "rh_dates": rhDates,
      "userid": StorageUtil.getUserId()
    };
    return await _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);
      return res;
    });
  }
}