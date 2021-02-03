import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/app/auth/auth_controller.dart';
import 'package:wapp_reports/app/auth/auth_page.dart';
import 'package:wapp_reports/app/components/progress-indicator.component.dart';
import 'package:wapp_reports/app/modules/reports/reports_page.dart';

class CheckAuthPage extends StatefulWidget {
  @override
  _CheckAuthPageState createState() => _CheckAuthPageState();
}

class _CheckAuthPageState extends State<CheckAuthPage> {
  Future<void> future;
  AuthController controller = Modular.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Scaffold(body: Center(child: GenericProgressIndicator(false)));
        } else {
          return Observer(
            builder: (_) => controller.hasToken
                ? ReportsPage(
                    authController: controller,
                  )
                : AuthPage(
                    authController: controller,
                  ),
          );
        }
      },
    );
  }

  @override
  void initState() {
    future = controller.tryAutoLogin();
    super.initState();
  }
}
