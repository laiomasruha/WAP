import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wapp_reports/settings.dart';

class GenericProgressIndicator extends StatelessWidget {
  final bool _isWhite;

  GenericProgressIndicator(this._isWhite);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoActivityIndicator()
        : CircularProgressIndicator(
            valueColor: _isWhite == true
                ? AlwaysStoppedAnimation<Color>(Colors.white)
                : AlwaysStoppedAnimation<Color>(Settings.darkBlueColor),
          );
  }
}
