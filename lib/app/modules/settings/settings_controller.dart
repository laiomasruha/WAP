import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:wapp_reports/app/modules/settings/repositories/settings_repository.dart';
import 'package:wapp_reports/lists.dart';

part 'settings_controller.g.dart';

class SettingsController = _SettingsControllerBase with _$SettingsController;

abstract class _SettingsControllerBase with Store {

  @observable
  bool isLoading = false;

  @observable
  ObservableList<String> list = lists.arrayList.asObservable();

  final SettingsRepository repository;

  _SettingsControllerBase({this.repository});

  @action
  Future<void> getConfig() async{
    List<String> config = await repository.getConfig();
    list = config as ObservableList;
    lists.arrayList = config;
  }

  @action
  void save({Map<int, TextEditingController> map}) {
    map.forEach((i, controller) {
      if (controller.text.trim() != "") {
        setList(i, controller.text);
        controller.clear();
      }
    });
  }

  @action
  void setList(int index, String listname) {
    list[index] = listname;
    repository.setList(index, listname);
  }
}
