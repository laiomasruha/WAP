import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class ReportSendingSuccessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then(
      (c) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      },
    );
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 2,
          child: FlareActor(
            "animations/check.flr",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            isPaused: false,
            animation: 'Untitled',
          ),
        ),
      ),
    );
  }
}
