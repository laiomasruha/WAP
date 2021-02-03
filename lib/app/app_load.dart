import 'dart:convert';

import 'package:wapp_reports/app/models/report-image-model.dart';
import 'package:wapp_reports/app/models/report-model.dart';
import 'package:wapp_reports/box.dart';
import 'package:wapp_reports/lists.dart';

class AppLoad {
  void loadSharedPreferences() async {
    try {
      var check = await Box.getMap("draft");
      if (check == null) {
        ReportModel draft = ReportModel(
          title: "",
          reportDate: DateTime.now().toString(),
          services: [],
          staff: [],
          obs: [],
          images: <ReportImageModel>[],
        );
        await Box.saveMap("draft", draft.toJson());
      }

      Iterable l = jsonDecode(await Box.getString("config"));
      List<String> config = List<String>.from(l).map((item) => item).toList();
      lists.arrayList = config;
    } catch (e) {
      print(e);
    }
  }

  void checkLogin() async {
    try {
      throw Exception();
    } catch (e) {
      print(e);
    }
  }
}
