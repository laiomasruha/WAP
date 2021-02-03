import 'repositories/settings_repository.dart';
import 'settings_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'settings_page.dart';

class SettingsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => SettingsController(repository: i.get<SettingsRepository>()),
        ),
        Bind((i) => SettingsRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => SettingsPage()),
      ];

  static Inject get to => Inject<SettingsModule>.of();
}
