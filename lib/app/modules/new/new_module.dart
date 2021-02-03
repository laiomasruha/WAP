

import 'package:wapp_reports/utils/custom_dio.dart';

import 'repositories/new_repository.dart';
import 'new_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'new_page.dart';

class NewModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => NewController(repository: i.get<NewRepository>()),
        ),
        Bind((i) => NewRepository(dio: i.get<CustomDio>())),
        Bind((i) => CustomDio()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => NewPage()),
      ];

  static Inject get to => Inject<NewModule>.of();
}
