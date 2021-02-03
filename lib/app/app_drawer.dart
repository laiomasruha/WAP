import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/app/auth/auth_controller.dart';
import 'package:wapp_reports/settings.dart';
import 'package:wapp_reports/user.dart';

class AppDrawer extends StatelessWidget {
  final AuthController controller;

  AppDrawer({this.controller});

  @override
  Widget build(BuildContext context) {
    Widget _buildAppDrawer() {
      return Column(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                    color: Settings.blueColor,
                    height: MediaQuery.of(context).padding.top),
                Container(color: Settings.darkBlueColor, height: 8),
                Container(color: Settings.lightBlueColor, height: 5),
                Container(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  width: (MediaQuery.of(context).size.width * 0.50),
                  child: Image.asset("assets/logo.png"),
                ),
                Divider(height: 0),
                Container(
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    leading: Icon(
                      Icons.person,
                    ),
                    title: Text(
                      user.email ?? "",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Divider(height: 0),
                Container(
                  child: InkWell(
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      leading: Icon(
                        Icons.settings,
                      ),
                      title: Text(
                        "CONFIGURAÇÕES",
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Modular.to.popAndPushNamed('/settings');
                      },
                    ),
                  ),
                ),
                Divider(height: 0),
              ],
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.only(bottom: 50),
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.10),
            child: FlatButton(
              onPressed: () {
                Modular.to.pop();
                controller.logout();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.exit_to_app,
                    size: 18,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("SAIR"),
                ],
              ),
              color: Colors.redAccent,
            ),
          ),
        ],
      );
    }

    return Drawer(
      child: Stack(
        children: <Widget>[_buildAppDrawer()],
      ),
    );
  }
}
