import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/app/auth/auth_controller.dart';
import 'package:wapp_reports/app/components/progress-indicator.component.dart';
import 'package:wapp_reports/settings.dart';
import 'sync_controller.dart';

class SyncPage extends StatefulWidget {
  final String title;

  const SyncPage({Key key, this.title = "Sync"}) : super(key: key);

  @override
  _SyncPageState createState() => _SyncPageState();
}

class _SyncPageState extends ModularState<SyncPage, SyncController> {
  final SyncController controller = Modular.get<SyncController>();
  Future<void> future;

  @override
  void initState() {
    future = controller.sync();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.NO_HEADER,
            title: 'Atenção',
            desc: 'Aguarde o fim da sincronização. Não saia desta tela.',
            btnOkText: "Ok",
            btnOkOnPress: () => null,
            btnOkColor: Settings.darkBlueColor,
          )..show();
          return;
        },
        child: FutureBuilder(
          future: future,
          builder: (ctx, snapshot) {
            print(snapshot.data);
            print(snapshot.connectionState);
            print(snapshot.error);
            if (snapshot.connectionState == ConnectionState.done) {
              Response response = snapshot.data;

              if (response.data["status"] == "Token is Expired") {
                final AuthController controller = Modular.get<AuthController>();
                controller.logout();
              }

              if (response.data["error"] == false) {
                return _synced();
              }
              if (response.data["error"] == true) {
                return _nonSynced();
              }
              if (response.data == null) {
                return _synced();
              }
            }
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GenericProgressIndicator(false),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Sincronizando"),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _synced() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.check_circle_outline,
            color: Settings.darkBlueColor,
            size: 50,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Sincronizado!",
            style: TextStyle(fontSize: 20, color: Settings.darkBlueColor),
          ),
          SizedBox(height: 30),
          RaisedButton(
            onPressed: () => Modular.to.pop(),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            color: Settings.darkBlueColor,
            child: Text(
              "Voltar",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _nonSynced() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Icons.error_outline,
            color: Settings.darkBlueColor,
            size: 50,
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "Opsss!",
            style: TextStyle(fontSize: 20, color: Settings.darkBlueColor),
          ),
          SizedBox(height: 30),
          RaisedButton(
            onPressed: () => controller.sync(),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            color: Settings.blueColor,
            child: Text(
              "Tentar novamente",
              style: TextStyle(color: Colors.white),
            ),
          ),
          RaisedButton(
            onPressed: () => Modular.to.pop(),
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            color: Settings.darkBlueColor,
            child: Text(
              "Voltar",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
