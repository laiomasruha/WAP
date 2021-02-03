import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wapp_reports/settings.dart';

class Tip extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  Tip({this.icon, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 50),
        width: double.infinity,
        height: MediaQuery.of(context).size.height - 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 50.0, color: Settings.darkGreyColor),
            Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 25,
                  color: Settings.darkGreyColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width / 2,
              child: Text(
                subtitle,
                style: TextStyle(
                  color: Settings.darkGreyColor,
                  fontSize: 14.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
