import 'package:wapp_reports/app/auth/auth_controller.dart';
import 'package:wapp_reports/app/auth/repositories/auth-repository.dart';
import 'package:wapp_reports/utils/custom_dio.dart';

import 'sync_controller.dart';
import 'repositories/sync_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'sync_page.dart';

class SyncModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SyncController(repository: i.get<SyncRepository>())),
        Bind((i) => SyncRepository(dio: i.get<CustomDio>())),
        Bind((i) => AuthController(repository: i.get<AuthRepository>())),
        Bind((i) => AuthRepository(dio: i.get<CustomDio>())),
        Bind((i) => CustomDio()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SyncPage()),
      ];

  static Inject get to => Inject<SyncModule>.of();
}
