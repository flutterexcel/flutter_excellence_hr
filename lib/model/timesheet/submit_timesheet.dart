class SubmitTimeSheet {
  int error;
  String message;

  SubmitTimeSheet({this.error, this.message});

  SubmitTimeSheet.fromJson(Map<String, dynamic> json) {
    error = json['error'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    data['message'] = this.message;
    return data;
  }
}
