// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewController on _NewControllerBase, Store {
  final _$_NewControllerBaseActionController =
      ActionController(name: '_NewControllerBase');

  @override
  Future<Response<dynamic>> register(
      {String name, String email, String password, String document}) {
    final _$actionInfo = _$_NewControllerBaseActionController.startAction(
        name: '_NewControllerBase.register');
    try {
      return super.register(
          name: name, email: email, password: password, document: document);
    } finally {
      _$_NewControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
