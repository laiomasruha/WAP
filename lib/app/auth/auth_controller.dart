import 'dart:async';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:wapp_reports/app/auth/repositories/auth-repository.dart';
import 'package:wapp_reports/box.dart';
import 'package:wapp_reports/user.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final AuthRepository repository;

  _AuthControllerBase({this.repository});

  @observable
  String _token = "";

  @observable
  DateTime _expirationDate;

  @observable
  Timer _logoutTimer = Timer(Duration(seconds: 0), () {});

  @computed
  bool get hasToken => token != null;

  @computed
  DateTime get expiration => _expirationDate;

  @computed
  String get token {
    if (_token != null &&
        _expirationDate != null &&
        _expirationDate.isAfter(DateTime.now())) {
      return _token;
    } else {
      return null;
    }
  }

  @action
  Future<Response> login({String email, String password}) async {
    final Response response =
        await repository.login(email: email, password: password);
    if (response.data['access_token'] != null) {
      final Map<String, dynamic> userData = await Box.getMap("userData");

      if (userData != null) {
        _token = userData["token"];
        _expirationDate =
            DateTime.now().add(Duration(seconds: userData["expiration"]));
        _autoLogout();
      }
    }

    if(response == null){
      await logout();
    }

    return response;
  }

  @action
  Future<void> tryAutoLogin() async {
    if (hasToken) {
      return Future.value();
    }
    final userData = await Box.getMap('userData');
    if (userData == null) {
      return Future.value();
    }
    final expirationDate =
        DateTime.now().add(Duration(seconds: userData["expiration"]));
    if (expirationDate.isBefore(DateTime.now())) {
      return Future.value();
    }

    _token = userData["token"];
    _expirationDate =
        DateTime.now().add(Duration(seconds: userData["expiration"]));
    user.token = userData["token"];
    user.email = userData["email"];

    _autoLogout();
  }

  @action
  Future<void> logout() async {
    user.token = null;
    user.email = null;
    user.expirationTime = null;
    _token = null;
    _expirationDate = null;
    if (_logoutTimer != null) {
      _logoutTimer.cancel();
      _logoutTimer = null;
    }
    await Box.remove("userData");
  }

  @action
  void _autoLogout() {
    if (_logoutTimer != null) {
      _logoutTimer.cancel();
    }
    final timeToLogout = _expirationDate.difference(DateTime.now()).inSeconds;
    _logoutTimer = Timer(Duration(seconds: timeToLogout), logout);
  }
}
