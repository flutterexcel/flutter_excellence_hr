class UserProfileDetail {
  String name;
  String jobtitle;
  String workEmail;
  bool slackProfile;
  String roleName;
  String gender;
  String userId;

  UserProfileDetail(
      {this.name,
      this.jobtitle,
      this.workEmail,
      this.slackProfile,
      this.roleName,
      this.gender,
      this.userId});

  UserProfileDetail.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    jobtitle = json['jobtitle'];
    workEmail = json['work_email'];
    slackProfile = json['slack_profile'];
    roleName = json['role_name'];
    gender = json['gender'];
    userId = json['user_Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = this.name;
    data['jobtitle'] = this.jobtitle;
    data['work_email'] = this.workEmail;
    data['slack_profile'] = this.slackProfile;
    data['role_name'] = this.roleName;
    data['gender'] = this.gender;
    data['user_Id'] = this.userId;
    return data;
  }
}
