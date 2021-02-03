import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:wapp_reports/app/modules/sync/repositories/sync_repository.dart';

part 'sync_controller.g.dart';

class SyncController = _SyncControllerBase with _$SyncController;

abstract class _SyncControllerBase with Store {
  final SyncRepository repository;

  _SyncControllerBase({this.repository});

  @observable
  int value = 0;

  @action
  Future<Response> sync() async{
    return await repository.store();
  }
}
