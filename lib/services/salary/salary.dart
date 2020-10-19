import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/salary/my_salary.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class SalaryService {
  Post _post = Post();
  Future<Salary> getSalary() async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'salUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {"action": "get_user_salary_info", "token": token};
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);
      return Salary.fromJson(res);
    });
  }
}
