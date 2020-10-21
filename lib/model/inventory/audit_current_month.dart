// class AuditCurrentMonthStatus {
//   String year;
//   String month;
//   bool status;

//   AuditCurrentMonthStatus({this.year, this.month, this.status});

//   AuditCurrentMonthStatus.fromJson(Map<String, dynamic> json) {
//     year = json['year'];
//     month = json['month'];
//     status = false;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['year'] = this.year;
//     data['month'] = this.month;
//     data['status'] = this.status;
//     return data;
//   }
// }

class AuditCurrentMonthStatus {
  String year;
  String month;
  var status;

  AuditCurrentMonthStatus({this.year, this.month, this.status});

  AuditCurrentMonthStatus.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    month = json['month'];

    if (json['status'].toString() == 'false') {
      status = false;
    } else {
      status = true;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['year'] = this.year;
    data['month'] = this.month;
    data['status'] = this.status;
    return data;
  }
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['year'] = this.year;
  //   data['month'] = this.month;
  //   if (this.status != null) {
  //     data['status'] = this.status.toJson();
  //   }
  //   return data;
  // }
}

class Status {
  String id;
  String inventoryId;
  String month;
  String year;
  String updatedAt;
  String auditDoneByUserName;
  String auditDoneByUserEmail;
  String auditComment;
  String commentType;

  Status(
      {this.id,
      this.inventoryId,
      this.month,
      this.year,
      this.updatedAt,
      this.auditDoneByUserName,
      this.auditDoneByUserEmail,
      this.auditComment,
      this.commentType});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inventoryId = json['inventory_id'];
    month = json['month'];
    year = json['year'];
    updatedAt = json['updated_at'];
    auditDoneByUserName = json['audit_done_by_user_name'];
    auditDoneByUserEmail = json['audit_done_by_user_email'];
    auditComment = json['audit_comment'];
    commentType = json['comment_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['inventory_id'] = this.inventoryId;
    data['month'] = this.month;
    data['year'] = this.year;
    data['updated_at'] = this.updatedAt;
    data['audit_done_by_user_name'] = this.auditDoneByUserName;
    data['audit_done_by_user_email'] = this.auditDoneByUserEmail;
    data['audit_comment'] = this.auditComment;
    data['comment_type'] = this.commentType;
    return data;
  }
}
