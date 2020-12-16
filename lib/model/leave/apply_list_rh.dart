class ApplyListRh {
  int error;
  Data data;

  ApplyListRh({this.error, this.data});

  ApplyListRh.fromJson(Map<String, dynamic> json) {
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
  int leaveId;

  Data({this.message, this.leaveId});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    leaveId = json['leave_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['leave_id'] = this.leaveId;
    return data;
  }
}
