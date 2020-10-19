class DocumentList {
  int error;
  Data data;
  DocumentList({this.error, this.data});
  DocumentList.fromJson(Map<String, dynamic> json) {
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
  List<UserDocumentInfo> userDocumentInfo;
  Data({this.userDocumentInfo});
  Data.fromJson(Map<String, dynamic> json) {
    if (json['user_document_info'] != null) {
      userDocumentInfo = new List<UserDocumentInfo>();
      json['user_document_info'].forEach((v) {
        userDocumentInfo.add(new UserDocumentInfo.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userDocumentInfo != null) {
      data['user_document_info'] =
          this.userDocumentInfo.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDocumentInfo {
  String id;
  String userId;
  String documentType;
  String link1;
  String readStatus;
  //UpdatedBy updatedBy;
  String lastModified;
  String docLink;
  UserDocumentInfo(
      {this.id,
      this.userId,
      this.documentType,
      this.link1,
      this.readStatus,
      //this.updatedBy,
      this.lastModified,
      this.docLink});
  UserDocumentInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_Id'];
    documentType = json['document_type'];
    link1 = json['link_1'];
    readStatus = json['read_status'];
    // updatedBy = json['updated_by'] != null
    //     ? new UpdatedBy.fromJson(json['updated_by'])
    //     : null;
    lastModified = json['last_modified'];
    docLink = json['doc_link'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_Id'] = this.userId;
    data['document_type'] = this.documentType;
    data['link_1'] = this.link1;
    data['read_status'] = this.readStatus;
    // if (this.updatedBy != null) {
    //   data['updated_by'] = this.updatedBy.toJson();
    // }
    data['last_modified'] = this.lastModified;
    data['doc_link'] = this.docLink;
    return data;
  }
}
