import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/inventory/add_inventory_audit.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class AddInventoryAudit {
  static final apiKey = null;
  Post _post = Post();
  Future<AddInventoryAuditModel> addinventory(String auditCommentType,
      String auditMessage, int doRefreshToken, int inventoryId) async {
    final prodUrl = await AppConfig.forEnvironment('prod');
    final loginUrl = prodUrl.baseUrl + "/attendance/API_HR/api.php";

    Map data = {
      "token": apiKey,
      "action": "add_inventory_audit",
      "audit_comment_type": auditCommentType,
      "audit_message": auditMessage,
      "do_refresh_token": doRefreshToken,
      "inventory_id": inventoryId
    };
    return _post
        .post(loginUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);
      if (res["error"] == 0) {
        StorageUtil.setUserToken(res["data"]["token"]);
      }
      return AddInventoryAuditModel.fromJson(res);
    });
  }
}
