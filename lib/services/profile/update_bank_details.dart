import 'dart:async';
import 'dart:convert';
import '../post.dart';
import '../../model/profile/ProfileDetails.dart';
import '../../app_config.dart';
import '../storage_service.dart';

class UpdateBankDetails {
  Post _post = Post();
  Future<ProfileDetails> updateBankDetails(String accountNo, String bankAddress,
      String bankName, String ifsc) async {
    final prodUrl = await AppConfig.forEnvironment('prod', 'salUrl');
    var token = StorageUtil.getUserToken();
    final apiUrl = prodUrl.baseUrl;
    Map data = {
      "action": "update_user_bank_detail",
      "token": token,
      "bank_account_no": accountNo,
      "bank_address": bankAddress,
      "bank_name": bankName,
      "ifsc": ifsc
    };
    return _post
        .post(apiUrl, body: json.encode(data))
        .then((dynamic res) async {
      if (res["error"] >= 1) throw new Exception(res["data"]["message"]);

      return ProfileDetails.fromJson(res);
    });
  }
}
