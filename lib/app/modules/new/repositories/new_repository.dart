import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/utils/custom_dio.dart';

class NewRepository extends Disposable {
  final CustomDio dio;

  NewRepository({this.dio});

  Future<Response> create({String email, String password, String document, String name}) async {
    Dio _dio = await dio.instance;

    try {
      var response = await _dio.post(
        "/register",
        data: {
          "email": email,
          "password": password,
          "document": document,
          "name": name,
        },
      );
      print(response);
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
