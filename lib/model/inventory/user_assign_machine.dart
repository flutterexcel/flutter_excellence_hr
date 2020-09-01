class UserAssignMachine {
  String id;
  String machineType;
  String machineName;
  String machinePrice;
  String serialNumber;
  String dateOfPurchase;
  String macAddress;
  String operatingSystem;
  String status;
  String comments;
  String warrantyEndDate;
  String billNumber;
  String warrantyComment;
  String repairComment;
  String warrantyYears;
  String approvalStatus;
  String isUnassignRequest;
  String ownershipChangeReqByUser;
  String userId;
  String assignDate;
  String name;
  String workEmail;

  UserAssignMachine({
    this.id,
    this.machineType,
    this.machineName,
    this.machinePrice,
    this.serialNumber,
    this.dateOfPurchase,
    this.macAddress,
    this.operatingSystem,
    this.status,
    this.comments,
    this.warrantyEndDate,
    this.billNumber,
    this.warrantyComment,
    this.repairComment,
    this.warrantyYears,
    this.approvalStatus,
    this.isUnassignRequest,
    this.ownershipChangeReqByUser,
    this.userId,
    this.assignDate,
    this.name,
    this.workEmail,
  });

  UserAssignMachine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    machineType = json['machine_type'];
    machineName = json['machine_name'];
    machinePrice = json['machine_price'];
    serialNumber = json['serial_number'];
    dateOfPurchase = json['date_of_purchase'];
    macAddress = json['mac_address'];
    operatingSystem = json['operating_system'];
    status = json['status'];
    comments = json['comments'];
    warrantyEndDate = json['warranty_end_date'];
    billNumber = json['bill_number'];
    warrantyComment = json['warranty_comment'];
    repairComment = json['repair_comment'];
    warrantyYears = json['warranty_years'];
    approvalStatus = json['approval_status'];
    isUnassignRequest = json['is_unassign_request'];
    ownershipChangeReqByUser = json['ownership_change_req_by_user'];
    userId = json['user_Id'];
    assignDate = json['assign_date'];
    name = json['name'];
    workEmail = json['work_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['machine_type'] = this.machineType;
    data['machine_name'] = this.machineName;
    data['machine_price'] = this.machinePrice;
    data['serial_number'] = this.serialNumber;
    data['date_of_purchase'] = this.dateOfPurchase;
    data['mac_address'] = this.macAddress;
    data['operating_system'] = this.operatingSystem;
    data['status'] = this.status;
    data['comments'] = this.comments;
    data['warranty_end_date'] = this.warrantyEndDate;
    data['bill_number'] = this.billNumber;
    data['warranty_comment'] = this.warrantyComment;
    data['repair_comment'] = this.repairComment;
    data['warranty_years'] = this.warrantyYears;
    data['approval_status'] = this.approvalStatus;
    data['is_unassign_request'] = this.isUnassignRequest;
    data['ownership_change_req_by_user'] = this.ownershipChangeReqByUser;
    data['user_Id'] = this.userId;
    data['assign_date'] = this.assignDate;
    data['name'] = this.name;
    data['work_email'] = this.workEmail;

    return data;
  }
}
