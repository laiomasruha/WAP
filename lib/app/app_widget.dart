import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wapp_reports/app/app_controller.dart';
import 'package:wapp_reports/app/app_theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Modular.get<AppController>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('pt', 'BR'),
      ],
      navigatorKey: Modular.navigatorKey,
      title: 'WAPP Relatórios',
      theme: CustomTheme().mainTheme,
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
