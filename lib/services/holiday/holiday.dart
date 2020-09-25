import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/holiday/holiday.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class GetHoliday {
  Post _post = Post();
  Future<Holiday> getHoliday({String year}) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {"action": "get_holidays_list", "token": token, "year": year};
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]['message']);

      return Holiday.fromJson(res);
    });
  }
}
