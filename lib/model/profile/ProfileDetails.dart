class ProfileDetails {
  int error;
  Data data;

  ProfileDetails({this.error, this.data});

  ProfileDetails.fromJson(Map<String, dynamic> json) {
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
  UserProfileDetail userProfileDetail;
  UserBankDetail userBankDetail;
  List<UserAssignMachine> userAssignMachine;

  Data({this.userProfileDetail, this.userBankDetail, this.userAssignMachine});

  Data.fromJson(Map<String, dynamic> json) {
    userProfileDetail = json['user_profile_detail'] != null
        ? new UserProfileDetail.fromJson(json['user_profile_detail'])
        : null;
    userBankDetail = json['user_bank_detail'] != null
        ? new UserBankDetail.fromJson(json['user_bank_detail'])
        : null;
    if (json['user_assign_machine'] != null) {
      userAssignMachine = new List<UserAssignMachine>();
      json['user_assign_machine'].forEach((v) {
        userAssignMachine.add(new UserAssignMachine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userProfileDetail != null) {
      data['user_profile_detail'] = this.userProfileDetail.toJson();
    }
    if (this.userBankDetail != null) {
      data['user_bank_detail'] = this.userBankDetail.toJson();
    }
    if (this.userAssignMachine != null) {
      data['user_assign_machine'] =
          this.userAssignMachine.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserProfileDetail {
  String status;
  String username;
  String type;
  String id;
  String name;
  String jobtitle;
  String dateofjoining;
  String userId;
  String dob;
  String gender;
  String maritalStatus;
  String address1;
  String address2;
  String city;
  String state;
  String zipPostal;
  String country;
  String homePh;
  String mobilePh;
  String workEmail;
  String otherEmail;
  String image;
  String bankAccountNum;
  String specialInstructions;
  String panCardNum;
  String permanentAddress;
  String currentAddress;
  String emergencyPh1;
  String emergencyPh2;
  String bloodGroup;
  String medicalCondition;
  String updatedOn;
  String slackId;
  String policyDocument;
  String team;
  String trainingCompletionDate;
  Null terminationDate;
  String trainingMonth;
  String slackMsg;
  String signature;
  String metaData;
  String profileImage;

  UserProfileDetail(
      {this.status,
      this.username,
      this.type,
      this.id,
      this.name,
      this.jobtitle,
      this.dateofjoining,
      this.userId,
      this.dob,
      this.gender,
      this.maritalStatus,
      this.address1,
      this.address2,
      this.city,
      this.state,
      this.zipPostal,
      this.country,
      this.homePh,
      this.mobilePh,
      this.workEmail,
      this.otherEmail,
      this.image,
      this.bankAccountNum,
      this.specialInstructions,
      this.panCardNum,
      this.permanentAddress,
      this.currentAddress,
      this.emergencyPh1,
      this.emergencyPh2,
      this.bloodGroup,
      this.medicalCondition,
      this.updatedOn,
      this.slackId,
      this.policyDocument,
      this.team,
      this.trainingCompletionDate,
      this.terminationDate,
      this.trainingMonth,
      this.slackMsg,
      this.signature,
      this.metaData,
      this.profileImage});

  UserProfileDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    username = json['username'];
    type = json['type'];
    id = json['id'];
    name = json['name'];
    jobtitle = json['jobtitle'];
    dateofjoining = json['dateofjoining'];
    userId = json['user_Id'];
    dob = json['dob'];
    gender = json['gender'];
    maritalStatus = json['marital_status'];
    address1 = json['address1'];
    address2 = json['address2'];
    city = json['city'];
    state = json['state'];
    zipPostal = json['zip_postal'];
    country = json['country'];
    homePh = json['home_ph'];
    mobilePh = json['mobile_ph'];
    workEmail = json['work_email'];
    otherEmail = json['other_email'];
    image = json['image'];
    bankAccountNum = json['bank_account_num'];
    specialInstructions = json['special_instructions'];
    panCardNum = json['pan_card_num'];
    permanentAddress = json['permanent_address'];
    currentAddress = json['current_address'];
    emergencyPh1 = json['emergency_ph1'];
    emergencyPh2 = json['emergency_ph2'];
    bloodGroup = json['blood_group'];
    medicalCondition = json['medical_condition'];
    updatedOn = json['updated_on'];
    slackId = json['slack_id'];
    policyDocument = json['policy_document'];
    team = json['team'];
    trainingCompletionDate = json['training_completion_date'];
    terminationDate = json['termination_date'];
    trainingMonth = json['training_month'];
    slackMsg = json['slack_msg'];
    signature = json['signature'];
    metaData = json['meta_data'];
    profileImage = json['profileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['username'] = this.username;
    data['type'] = this.type;
    data['id'] = this.id;
    data['name'] = this.name;
    data['jobtitle'] = this.jobtitle;
    data['dateofjoining'] = this.dateofjoining;
    data['user_Id'] = this.userId;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['marital_status'] = this.maritalStatus;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip_postal'] = this.zipPostal;
    data['country'] = this.country;
    data['home_ph'] = this.homePh;
    data['mobile_ph'] = this.mobilePh;
    data['work_email'] = this.workEmail;
    data['other_email'] = this.otherEmail;
    data['image'] = this.image;
    data['bank_account_num'] = this.bankAccountNum;
    data['special_instructions'] = this.specialInstructions;
    data['pan_card_num'] = this.panCardNum;
    data['permanent_address'] = this.permanentAddress;
    data['current_address'] = this.currentAddress;
    data['emergency_ph1'] = this.emergencyPh1;
    data['emergency_ph2'] = this.emergencyPh2;
    data['blood_group'] = this.bloodGroup;
    data['medical_condition'] = this.medicalCondition;
    data['updated_on'] = this.updatedOn;
    data['slack_id'] = this.slackId;
    data['policy_document'] = this.policyDocument;
    data['team'] = this.team;
    data['training_completion_date'] = this.trainingCompletionDate;
    data['termination_date'] = this.terminationDate;
    data['training_month'] = this.trainingMonth;
    data['slack_msg'] = this.slackMsg;
    data['signature'] = this.signature;
    data['meta_data'] = this.metaData;
    data['profileImage'] = this.profileImage;
    return data;
  }
}

class UserBankDetail {
  String id;
  String userId;
  String bankName;
  String bankAddress;
  String bankAccountNo;
  String ifsc;

  UserBankDetail(
      {this.id,
      this.userId,
      this.bankName,
      this.bankAddress,
      this.bankAccountNo,
      this.ifsc});

  UserBankDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_Id'];
    bankName = json['bank_name'];
    bankAddress = json['bank_address'];
    bankAccountNo = json['bank_account_no'];
    ifsc = json['ifsc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_Id'] = this.userId;
    data['bank_name'] = this.bankName;
    data['bank_address'] = this.bankAddress;
    data['bank_account_no'] = this.bankAccountNo;
    data['ifsc'] = this.ifsc;
    return data;
  }
}

class UserAssignMachine {
  String id;
  String machineType;
  String machineName;
  String macAddress;
  String serialNumber;
  String billNumber;
  String userId;
  String assignDate;

  UserAssignMachine(
      {this.id,
      this.machineType,
      this.machineName,
      this.macAddress,
      this.serialNumber,
      this.billNumber,
      this.userId,
      this.assignDate});

  UserAssignMachine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    machineType = json['machine_type'];
    machineName = json['machine_name'];
    macAddress = json['mac_address'];
    serialNumber = json['serial_number'];
    billNumber = json['bill_number'];
    userId = json['user_Id'];
    assignDate = json['assign_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['machine_type'] = this.machineType;
    data['machine_name'] = this.machineName;
    data['mac_address'] = this.macAddress;
    data['serial_number'] = this.serialNumber;
    data['bill_number'] = this.billNumber;
    data['user_Id'] = this.userId;
    data['assign_date'] = this.assignDate;
    return data;
  }
}
