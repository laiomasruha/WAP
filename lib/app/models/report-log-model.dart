class ReportLogModel {
  int id;
  String reportId;
  String recipientEmail;
  String attachment;
  String sentAt;
  String hash;
  String createdAt;
  String updatedAt;

  ReportLogModel(
      {this.id,
      this.reportId,
      this.recipientEmail,
      this.attachment,
      this.sentAt,
      this.hash,
      this.createdAt,
      this.updatedAt});

  ReportLogModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reportId = json['rpxId'];
    recipientEmail = json['recipient_email'];
    attachment = json['attachment'];
    sentAt = json['sent_at'];
    hash = json['hash'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'reportId': this.reportId,
      'recipient_email': this.recipientEmail,
      'attachment': this.attachment,
      'sent_at': this.sentAt,
      'hash': this.hash,
      'created_at': this.createdAt,
      'updated_at': this.updatedAt,
    };
  }
}
