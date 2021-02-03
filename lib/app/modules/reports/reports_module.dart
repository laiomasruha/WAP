import 'package:wapp_reports/app/auth/auth_controller.dart';
import 'package:wapp_reports/app/auth/repositories/auth-repository.dart';
import 'package:wapp_reports/app/modules/reports/check_auth.dart';
import 'package:wapp_reports/app/modules/reports/repositories/reports-repository.dart';
import 'package:wapp_reports/utils/custom_dio.dart';

import 'reports_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ReportsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ReportsController(repository: i.get<ReportsRepository>())),
        Bind((i) => ReportsRepository(dio: i.get<CustomDio>())),
        Bind((i) => AuthController(repository: i.get<AuthRepository>())),
        Bind((i) => AuthRepository(dio: i.get<CustomDio>())),
        Bind((i) => CustomDio()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CheckAuthPage()),
      ];

  static Inject get to => Inject<ReportsModule>.of();
}
