// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  Computed<bool> _$hasTokenComputed;

  @override
  bool get hasToken =>
      (_$hasTokenComputed ??= Computed<bool>(() => super.hasToken,
              name: '_AuthControllerBase.hasToken'))
          .value;
  Computed<String> _$tokenComputed;

  @override
  String get token => (_$tokenComputed ??= Computed<String>(() => super.token,
          name: '_AuthControllerBase.token'))
      .value;

  final _$_tokenAtom = Atom(name: '_AuthControllerBase._token');

  @override
  String get _token {
    _$_tokenAtom.reportRead();
    return super._token;
  }

  @override
  set _token(String value) {
    _$_tokenAtom.reportWrite(value, super._token, () {
      super._token = value;
    });
  }

  final _$_expirationDateAtom =
      Atom(name: '_AuthControllerBase._expirationDate');

  @override
  DateTime get _expirationDate {
    _$_expirationDateAtom.reportRead();
    return super._expirationDate;
  }

  @override
  set _expirationDate(DateTime value) {
    _$_expirationDateAtom.reportWrite(value, super._expirationDate, () {
      super._expirationDate = value;
    });
  }

  final _$_logoutTimerAtom = Atom(name: '_AuthControllerBase._logoutTimer');

  @override
  Timer get _logoutTimer {
    _$_logoutTimerAtom.reportRead();
    return super._logoutTimer;
  }

  @override
  set _logoutTimer(Timer value) {
    _$_logoutTimerAtom.reportWrite(value, super._logoutTimer, () {
      super._logoutTimer = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_AuthControllerBase.login');

  @override
  Future<Response<dynamic>> login({String email, String password}) {
    return _$loginAsyncAction
        .run(() => super.login(email: email, password: password));
  }

  final _$tryAutoLoginAsyncAction =
      AsyncAction('_AuthControllerBase.tryAutoLogin');

  @override
  Future<void> tryAutoLogin() {
    return _$tryAutoLoginAsyncAction.run(() => super.tryAutoLogin());
  }

  final _$logoutAsyncAction = AsyncAction('_AuthControllerBase.logout');

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  void _autoLogout() {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction(
        name: '_AuthControllerBase._autoLogout');
    try {
      return super._autoLogout();
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasToken: ${hasToken},
token: ${token}
    ''';
  }
}
