class RhStats {
  int error;
  Data data;

  RhStats({this.error, this.data});

  RhStats.fromJson(Map<String, dynamic> json) {
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
  int rhCanBeTaken;
  int rhCanBeTakenThisQuarter;
  int rhApproved;
  List<String> rhApprovedNames;
  int rhRejected;
  List<String> rhRejectedNames;
  int rhLeft;
  int rhCompensationUsed;
  List<String> rhCompensationUsedNames;
  int rhCompensationPending;

  Data(
      {this.rhCanBeTaken,
      this.rhCanBeTakenThisQuarter,
      this.rhApproved,
      this.rhApprovedNames,
      this.rhRejected,
      this.rhRejectedNames,
      this.rhLeft,
      this.rhCompensationUsed,
      this.rhCompensationUsedNames,
      this.rhCompensationPending});

  Data.fromJson(Map<String, dynamic> json) {
    rhCanBeTaken = json['rh_can_be_taken'];
    rhCanBeTakenThisQuarter = json['rh_can_be_taken_this_quarter'];
    rhApproved = json['rh_approved'];
    rhApprovedNames = json['rh_approved_names'].cast<String>();
    rhRejected = json['rh_rejected'];
    rhRejectedNames = json['rh_rejected_names'].cast<String>();
    // if (json['rh_rejected_names'] != null) {
    //   rhRejectedNames = new List<Null>();
    //   json['rh_rejected_names'].forEach((v) {
    //     rhRejectedNames.add(new Null.fromJson(v));
    //   });
    // }
    rhLeft = json['rh_left'];
    rhCompensationUsed = json['rh_compensation_used'];
    rhCompensationUsedNames = json['rh_compensation_used_names'].cast<String>();
    rhCompensationPending = json['rh_compensation_pending'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rh_can_be_taken'] = this.rhCanBeTaken;
    data['rh_can_be_taken_this_quarter'] = this.rhCanBeTakenThisQuarter;
    data['rh_approved'] = this.rhApproved;
    data['rh_approved_names'] = this.rhApprovedNames;
    data['rh_rejected'] = this.rhRejected;
    data['rhRejectedNames'] = this.rhRejectedNames;
    // if (this.rhRejectedNames != null) {
    //   data['rh_rejected_names'] =
    //       this.rhRejectedNames.map((v) => v.toJson()).toList();
    // }
    data['rh_left'] = this.rhLeft;
    data['rh_compensation_used'] = this.rhCompensationUsed;
    data['rh_compensation_used_names'] = this.rhCompensationUsedNames;
    data['rh_compensation_pending'] = this.rhCompensationPending;
    return data;
  }
}
