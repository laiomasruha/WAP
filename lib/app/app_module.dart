import 'package:wapp_reports/app/app_load.dart';
import 'package:wapp_reports/app/app_widget.dart';
import 'package:wapp_reports/app/auth/auth_controller.dart';
import 'package:wapp_reports/app/auth/repositories/auth-repository.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_module.dart';
import 'package:wapp_reports/app/modules/new/new_module.dart';
import 'package:wapp_reports/app/modules/report/report_module.dart';
import 'package:wapp_reports/app/modules/reports/reports_module.dart';
import 'package:wapp_reports/app/modules/settings/settings_module.dart';
import 'package:wapp_reports/app/modules/sync/sync_module.dart';
import 'package:wapp_reports/utils/custom_dio.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppLoad()),
        Bind((i) => AppController(loads: i.get<AppLoad>())),
        Bind((i) => AuthController(repository: i.get<AuthRepository>())),
        Bind((i) => AuthRepository(dio: i.get<CustomDio>())),
        Bind((i) => CustomDio()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, module: ReportsModule()),
        Router('/report', module: ReportModule()),
        Router('/settings', module: SettingsModule()),
        Router('/drafts', module: DraftsModule()),
        Router('/sync', module: SyncModule()),
        Router('/new', module: NewModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
