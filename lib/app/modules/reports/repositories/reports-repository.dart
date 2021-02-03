import 'package:dio/dio.dart';
import 'package:wapp_reports/app/models/report-model.dart';
import 'package:wapp_reports/user.dart';
import 'package:wapp_reports/utils/custom_dio.dart';

class ReportsRepository {
  final CustomDio dio;

  ReportsRepository({this.dio});

  Future<List<ReportModel>> loadReports() async {
    Dio _dio = await dio.instance;

    try {
      var response = await _dio.get(
        "/reports",
        options: Options(
          headers: {
            "Authorization": "Bearer ${user.token}",
          },
        ),
      );
      
      if (response.data != null) {
        return (response.data as List)
            .map((course) => ReportModel.fromJson(course))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      print("ERRO GET REPORTS");
      print(e);
      return null;
    }
  }

//dispose will be called automatically
  @override
  void dispose() {}
}
