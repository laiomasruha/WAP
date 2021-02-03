import 'dart:convert';

import 'package:wapp_reports/app/models/report-image-model.dart';

class ReportModel {
  String id;
  String userId;
  String title;
  String reportDate;
  List<String> services;
  List<String> staff;
  List<String> obs;
  List<ReportImageModel> images;
  String createdAt;
  String updatedAt;

  ReportModel({
    this.id,
    this.userId,
    this.title,
    this.reportDate,
    this.services,
    this.staff,
    this.obs,
    this.images,
    this.createdAt,
    this.updatedAt,
  });

  ReportModel.fromJson(Map<String, dynamic> json) {
    List<String> _list = [];
    id = json['id'].toString();
    userId = json['user_id'].toString();
    title = json['title'].toString();
    reportDate = json['report_date'].toString();
    if (json['services'] != null) {
      jsonDecode(json["services"]).forEach((item) => _list.add(item));
      services = _list;
    }
    if (json['staff'] != null) {
      _list = [];
      jsonDecode(json["staff"]).forEach((item) => _list.add(item));
      staff = _list;
    }
    if (json['obs'] != null) {
      _list = [];
      jsonDecode(json["obs"]).forEach((item) => _list.add(item));
      obs = _list;
    }
    if (json['images'] != null) {
      images = new List<ReportImageModel>();
      jsonDecode(json["images"]).forEach((v) {
        images.add(new ReportImageModel.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'user_id': this.userId,
      'title': this.title,
      'report_date': this.reportDate,
      'services': jsonEncode(this.services),
      'staff': jsonEncode(this.staff),
      'obs': jsonEncode(this.obs),
      'images': jsonEncode(this.images),
      'created_at': this.createdAt,
      'updated_at': this.updatedAt,
    };
  }
}
