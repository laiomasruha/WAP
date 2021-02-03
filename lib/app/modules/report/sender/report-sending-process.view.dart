import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:wapp_reports/settings.dart';

class ReportSendingProcessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () {
          return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Aguarde"),
                content:
                    Text("Não saia desta tela até o fim da sincronização."),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Ok"),
                  ),
                ],
              );
            },
          );
        },
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Center(
              child: Text(
                "Aguarde",
                style: TextStyle(
                  color: Settings.darkGreyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: FlareActor(
                "animations/docs.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                isPaused: false,
                animation: 'Animations',
              ),
            ),
            Text(
              "Enviando Emails",
              style: TextStyle(
                color: Settings.blueColor,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
