import 'package:dio/dio.dart';
import 'package:wapp_reports/settings.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio(BaseOptions(
      baseUrl: Settings.apiUrl,
    ));
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );
  }

  Future<Dio> get instance async => _dio;

  _onRequest(RequestOptions options) {}

  _onResponse(Response e) {}

  _onError(DioError e) {}
}
