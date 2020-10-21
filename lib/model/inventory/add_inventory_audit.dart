import 'package:equatable/equatable.dart';

class AddInventoryAuditModel extends Equatable {
  final String token;
  final String auditCommentType;
  final String auditMessage;
  final int doRefreshToken;
  final int inventoryId;

  const AddInventoryAuditModel(
      {this.auditCommentType,
      this.token,
      this.auditMessage,
      this.doRefreshToken,
      this.inventoryId});

  @override
  List<Object> get props =>
      [auditCommentType, token, auditMessage, doRefreshToken, inventoryId];

  static AddInventoryAuditModel fromJson(dynamic json) {
    return AddInventoryAuditModel(
      auditCommentType: json["data"]["auditCommentType"],
      token: json["data"]["token"],
      auditMessage: json["data"]["auditMessage"],
      doRefreshToken: json["data"]["doRefreshToken"],
      inventoryId: json["data"]["inventorId"],
    );
  }
}
