import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/inventory/inventory.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class Inventory {
  Post _post = Post();
  Future<InventoryDetails> inventory() async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {"action": "get_my_inventories", "token": token};
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) {
        throw new Exception(res["data"]["message"]);
      }

      return InventoryDetails.fromJson(res);
    });
  }
}
