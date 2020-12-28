import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/tmsreport/tmsreport.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class TMSReportService {
  Post _post = Post();
  Future<TMSReport> getTMSComment() async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    String date = "2020-12-04";
    final apiUrl = prodUrl.baseUrl;
    Map data = {
      "action": "get_user_tms_report",
      "date": date,
      "token": token,
      "username": StorageUtil.getUserName()
    };
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);
      return TMSReport.fromJson(res);
    });
  }
}
