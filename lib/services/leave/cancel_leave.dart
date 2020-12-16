import 'dart:convert';

import 'package:flutter_excellence_hr/app_config.dart';
import 'package:flutter_excellence_hr/model/leave/cancel_leave.dart';
import 'package:flutter_excellence_hr/services/post.dart';
import 'package:flutter_excellence_hr/services/storage_service.dart';

class CancelMyLeave {
  Post _post = Post();
  Future<CancelLeave> cancelMyLeave(String date) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    var userId = StorageUtil.getUserId();
    final apiUrl = prodUrl.baseUrl;
    Map data = {
      "action": "cancel_applied_leave",
      "token": token,
      "date": date,
      "user_id": userId
    };
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      
      return CancelLeave.fromJson(res);
    });
  }
}
