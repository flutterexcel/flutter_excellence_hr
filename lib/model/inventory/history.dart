class History {
  String id;
  String inventoryId;
  String updatedByUserId;
  String assignUnassignUserId;
  String comment;
  String updatedAt;
  String commentType;
  String updatedByUser;
  String updatedByUserJobTitle;
  String assignUnassignUserName;
  String assignUnassignJobTitle;

  History(
      {this.id,
      this.inventoryId,
      this.updatedByUserId,
      this.assignUnassignUserId,
      this.comment,
      this.updatedAt,
      this.commentType,
      this.updatedByUser,
      this.updatedByUserJobTitle,
      this.assignUnassignUserName,
      this.assignUnassignJobTitle});

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    inventoryId = json['inventory_id'];
    updatedByUserId = json['updated_by_user_id'];
    assignUnassignUserId = json['assign_unassign_user_id'];
    comment = json['comment'];
    updatedAt = json['updated_at'];
    commentType = json['comment_type'];
    updatedByUser = json['updated_by_user'];
    updatedByUserJobTitle = json['updated_by_user_job_title'];
    assignUnassignUserName = json['assign_unassign_user_name'];
    assignUnassignJobTitle = json['assign_unassign_job_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['inventory_id'] = this.inventoryId;
    data['updated_by_user_id'] = this.updatedByUserId;
    data['assign_unassign_user_id'] = this.assignUnassignUserId;
    data['comment'] = this.comment;
    data['updated_at'] = this.updatedAt;
    data['comment_type'] = this.commentType;
    data['updated_by_user'] = this.updatedByUser;
    data['updated_by_user_job_title'] = this.updatedByUserJobTitle;
    data['assign_unassign_user_name'] = this.assignUnassignUserName;
    data['assign_unassign_job_title'] = this.assignUnassignJobTitle;
    return data;
  }
}
