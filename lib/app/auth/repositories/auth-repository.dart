import 'package:dio/dio.dart';
import 'package:wapp_reports/box.dart';
import 'package:wapp_reports/user.dart';
import 'package:wapp_reports/utils/custom_dio.dart';

class AuthRepository {
  final CustomDio dio;

  AuthRepository({this.dio});

  Future<Response> login({String email, String password}) async {

    Dio _dio = await dio.instance;

    try {
      Response response = await _dio.post(
        "/auth/login",
        data: {
          "email": email,
          "password": password,
        },
      );

      if (response.data["access_token"] != null) {
        Box.saveMap("userData", {
          "token": response.data["access_token"],
          "email": email,
          "expiration": response.data["expires_in"],
        });

        user.token = response.data["access_token"];
        user.email = email;
        user.expirationTime = response.data["expires_in"];
      }

      return response;
    } catch (e) {
      return null;
    }
  }

  Future<bool> logout() async {
    Dio _dio = await dio.instance;

    try {
      await _dio.post(
        "/auth/logout",
        options: Options(
          headers: {
            "Authorization": "Bearer ${user.token}",
          },
        ),
      );

      Box.remove("userData");

      return true;
    } catch (e) {
      return false;
    }
  }

//dispose will be called automatically
  @override
  void dispose() {}
}
