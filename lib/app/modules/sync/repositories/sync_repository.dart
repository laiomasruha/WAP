import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/app/models/report-image-model.dart';
import 'package:wapp_reports/box.dart';
import 'package:wapp_reports/lists.dart';
import 'package:wapp_reports/user.dart';
import 'package:wapp_reports/utils/custom_dio.dart';

class SyncRepository extends Disposable {
  final CustomDio dio;

  SyncRepository({this.dio});

  Future<Response> store() async {
    final Dio _dio = await dio.instance;
    FormData formData;
    Map<String, dynamic> map = await Box.getMap("draft");
    String emails = jsonEncode(List<String>.from(await Box.getObList("emails")));

    map['lists'] = jsonEncode(lists.arrayList);
    map['emails'] = emails;
    map.remove('id');
    map.remove('user_id');
    map.remove('created_at');
    map.remove('updated_at');

    if (map.containsKey("images")) {
      List<MapEntry<String, MultipartFile>> files = [];
      List<String> subs = [];
      List<dynamic> images = jsonDecode(map["images"]);
      images.forEach((element) {
        ReportImageModel img = ReportImageModel.fromJson(element);
        files.add(MapEntry('files[]', MultipartFile.fromFileSync(img.image,filename: img.sub.isNotEmpty ? img.sub : "WAPNULL")));
        subs.add(img.sub.isNotEmpty ? img.sub : null);
      });
      map["subs"] = subs;

      formData = FormData.fromMap(map);
      formData.files.addAll(files);
      map.remove('images');
    } else {
      formData = FormData.fromMap(map);
    }

    try {
      return await _dio.post(
        "/reports",
        data: formData,
        onSendProgress: (int sent, int total) {
          print("$sent $total");
        },
        options: Options(
          contentType: 'multipart/form-data',
          headers: {
            "Authorization": "Bearer ${user.token}",
          },
          method: 'POST',
        ),
      );
    } catch (e) {
      print("ERRO SYNC STORE");
      print(e);
      return null;
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
