import 'dart:convert';

import 'package:flutter_excellence_hr/app_config.dart';
import 'package:flutter_excellence_hr/model/leave/apply_list_rh.dart';
import 'package:flutter_excellence_hr/services/post.dart';
import 'package:flutter_excellence_hr/services/storage_service.dart';

class ApplyRh {
  Post _post = Post();
  Future<ApplyListRh> applyRhLeave(
    String fromDate,
    String reason,
    String toDate
  ) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {
      "action": "apply_leave",
      "day_status": "",
      "from_date": fromDate,
      "leave_type": "Restricted",
      "no_of_days": 1,
      "reason": reason,
      "to_date": toDate,
      "token": token,
    };
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      return ApplyListRh.fromJson(res);
    });
  }
}
