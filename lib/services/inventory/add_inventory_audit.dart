import 'dart:async';
import 'dart:convert';
import 'package:flutter_excellence_hr/model/inventory/inventory_success.dart';
import '../post.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class AddInventoryAudit {
  Post _post = Post();
  Future<InventorySuccess> addinventory(
      String auditCommentType, String auditMessage, String inventoryId) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'apiUrl');
    final auditUrl = prodUrl.baseUrl;
    StorageUtil.getInstance();
    final apiKey = StorageUtil.getUserToken();
    Map data = {
      "token": apiKey,
      "action": "add_inventory_audit",
      "audit_comment_type": auditCommentType,
      "audit_message": auditMessage,
      "do_refresh_token": 1,
      "inventory_id": inventoryId
    };
    return _post
        .post(auditUrl, body: json.encode(data))
        .then((dynamic res) async {
      //if (res["error"] >= 1) throw new Exception(res["data"]["message"]);
      if (res["error"] == 0) {
        //StorageUtil.setUserToken(res["data"]["token"]);
      }
      return InventorySuccess.fromJson(res);
    });
  }
}
