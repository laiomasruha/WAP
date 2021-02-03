import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class ReportSendingErrorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 2,
              child: FlareActor(
                "animations/error.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                isPaused: false,
                animation: 'action',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: <Widget>[
                  Text(
                      "Email(s) não enviado(s). Toque para tentar novamente."),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
