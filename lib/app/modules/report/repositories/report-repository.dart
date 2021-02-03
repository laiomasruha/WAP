import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:wapp_reports/app/models/report-image-model.dart';
import 'package:wapp_reports/app/models/report-model.dart';
import 'package:wapp_reports/box.dart';
import 'package:wapp_reports/user.dart';
import 'package:wapp_reports/utils/custom_dio.dart';

class ReportRepository {
  final CustomDio dio;

  ReportRepository({this.dio}); //FUNCTIONS

  Future<List<String>> getEmails() async {
    return jsonDecode(await Box.getString("queue"));
  }

  void resetDraft() async {
    ReportModel draft = ReportModel(
      title: null,
      reportDate: DateTime.now().toString(),
      services: List<String>(),
      staff: List<String>(),
      obs: List<String>(),
      images: List<ReportImageModel>(),
    );
    await Box.saveMap("draft", draft.toJson());
  }

  Future<bool> copyToRpx(ReportModel report) async {
    resetDraft();
    ReportModel draft = ReportModel.fromJson(report.toJson());
    draft.title = report.title;
    draft.services = report.services;
    draft.staff = report.staff;
    draft.obs = report.obs;
    await Box.saveMap("draft", draft.toJson());
    return true;
  }

  //SEND EMAILS

  void setEmailList(ObservableList<String> list) async {
    await Box.saveObList('queue', list);
  }

  void resetEmailList() async {
    await Box.remove('queue');
  }

  Future<Response> getLogs(String id) async {
    Dio _dio = await dio.instance;

    try {
      var response = await _dio.get(
        "/reports/log/$id",
        options: Options(
          headers: {
            "Authorization": "Bearer ${user.token}",
          },
        ),
      );

      return response;
    } catch (e) {
      print("ERRO GET LOG");
      print(e);
      return null;
    }
  }

  //Store Emails to Email's Queue
  Future<Response> queue({String id}) async {
    final Dio _dio = await dio.instance;

    FormData formData;

    Map<String, dynamic> map = new Map<String, dynamic>();

    String queue = jsonEncode(List<String>.from(await Box.getObList("queue")));

    map['report_id'] = id;
    map['queue'] = queue;

    formData = FormData.fromMap(map);

    try {
      return await _dio.post(
        "/reports/queue",
        data: formData,
        onSendProgress: (int sent, int total) {
          print("$sent $total");
        },
        options: Options(
          headers: {
            "Authorization": "Bearer ${user.token}",
          },
        ),
      );
    } catch (e) {
      print("ERRO QUEUE STORE");
      print(e);
      return null;
    }
  }
}
