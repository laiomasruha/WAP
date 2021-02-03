import 'package:mobx/mobx.dart';
import 'package:wapp_reports/app/app_load.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final AppLoad loads;

  _AppControllerBase({this.loads}) {
    loads.loadSharedPreferences();
  }
}
