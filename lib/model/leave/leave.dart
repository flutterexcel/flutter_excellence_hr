class Leave {
  int error;
  Data data;

  Leave({this.error, this.data});

  Leave.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String message;
  List<Leaves> leaves;

  Data({this.message, this.leaves});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['leaves'] != null) {
      leaves = new List<Leaves>();
      json['leaves'].forEach((v) {
        leaves.add(new Leaves.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.leaves != null) {
      data['leaves'] = this.leaves.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Leaves {
  String id;
  String userId;
  String fromDate;
  String toDate;
  String noOfDays;
  String reason;
  String status;
  String appliedOn;
  String dayStatus;
  String leaveType;
  String lateReason;
  String docRequire;
  String docLink;
  String comment;
  String extraDay;
  String hrComment;
  String hrApproved;
  String rejectedReason;
  String rhDates;
  String rhNames;

  Leaves(
      {this.id,
      this.userId,
      this.fromDate,
      this.toDate,
      this.noOfDays,
      this.reason,
      this.status,
      this.appliedOn,
      this.dayStatus,
      this.leaveType,
      this.lateReason,
      this.docRequire,
      this.docLink,
      this.comment,
      this.extraDay,
      this.hrComment,
      this.hrApproved,
      this.rejectedReason,
      this.rhDates,
      this.rhNames});

  Leaves.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_Id'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    noOfDays = json['no_of_days'];
    reason = json['reason'];
    status = json['status'];
    appliedOn = json['applied_on'];
    dayStatus = json['day_status'];
    leaveType = json['leave_type'];
    lateReason = json['late_reason'];
    docRequire = json['doc_require'];
    docLink = json['doc_link'];
    comment = json['comment'];
    extraDay = json['extra_day'];
    hrComment = json['hr_comment'];
    hrApproved = json['hr_approved'];
    rejectedReason = json['rejected_reason'];
    rhDates = json['rh_dates'];
    rhNames = json['rh_names'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_Id'] = this.userId;
    data['from_date'] = this.fromDate;
    data['to_date'] = this.toDate;
    data['no_of_days'] = this.noOfDays;
    data['reason'] = this.reason;
    data['status'] = this.status;
    data['applied_on'] = this.appliedOn;
    data['day_status'] = this.dayStatus;
    data['leave_type'] = this.leaveType;
    data['late_reason'] = this.lateReason;
    data['doc_require'] = this.docRequire;
    data['doc_link'] = this.docLink;
    data['comment'] = this.comment;
    data['extra_day'] = this.extraDay;
    data['hr_comment'] = this.hrComment;
    data['hr_approved'] = this.hrApproved;
    data['rejected_reason'] = this.rejectedReason;
    data['rh_dates'] = this.rhDates;
    data['rh_names'] = this.rhNames;
    return data;
  }
}
