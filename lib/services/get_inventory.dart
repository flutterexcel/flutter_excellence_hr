import 'dart:async';
import 'dart:convert';
import 'post.dart';
import '../model/user.dart';
import '../app_config.dart';
import 'storage_service.dart';

class Inventory {
  Post _post = Post();
  Future<User> inventory(String username, String password) async {
    final prodUrl = await AppConfig.forEnvironment('prod');
    var token = StorageUtil.getString('token');
    final loginUrl = prodUrl.baseUrl + "/attendance/API_HR/api.php";
    Map data = {"action": "get_my_inventories", "token": token};
    return _post
        .post(loginUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);

      return User.fromJson(res);
    });
  }
}
