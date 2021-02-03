import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:wapp_reports/app/modules/new/repositories/new_repository.dart';

part 'new_controller.g.dart';

class NewController = _NewControllerBase with _$NewController;

abstract class _NewControllerBase with Store {
  final NewRepository repository;

  _NewControllerBase({this.repository});

  @action
  Future<Response> register({String name, String email, String password, String document}) {
    return repository.create(email: email, password: password, document: document, name: name);
  }
}
