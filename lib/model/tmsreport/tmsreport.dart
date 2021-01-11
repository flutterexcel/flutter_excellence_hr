class TMSReport {
  int error;
  Data data;

  TMSReport({this.error, this.data});

  TMSReport.fromJson(Map<String, dynamic> json) {
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
  String sId;
  String createdAt;
  String highlight;
  Null highlightTaskReason;
  String report;
  bool taskCompleted;
  String taskNotCompletedReason;
  String type;
  String user;
  String username;

  Data(
      {this.sId,
      this.createdAt,
      this.highlight,
      this.highlightTaskReason,
      this.report,
      this.taskCompleted,
      this.taskNotCompletedReason,
      this.type,
      this.user,
      this.username});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdAt = json['created_at'];
    highlight = json['highlight'];
    highlightTaskReason = json['highlight_task_reason'];
    report = json['report'];
    taskCompleted = json['task_completed'];
    taskNotCompletedReason = json['task_not_completed_reason'];
    type = json['type'];
    user = json['user'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['created_at'] = this.createdAt;
    data['highlight'] = this.highlight;
    data['highlight_task_reason'] = this.highlightTaskReason;
    data['report'] = this.report;
    data['task_completed'] = this.taskCompleted;
    data['task_not_completed_reason'] = this.taskNotCompletedReason;
    data['type'] = this.type;
    data['user'] = this.user;
    data['username'] = this.username;
    return data;
  }
}
