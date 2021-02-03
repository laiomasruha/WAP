import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/app/modules/drafts/components/custom-date-picker.cupertino.component.dart';
import 'package:wapp_reports/app/modules/drafts/components/custom-date-picker.material.component.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';
import 'package:wapp_reports/settings.dart';

class DraftDatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DraftsController controller = Modular.get<DraftsController>();

    return Card(
      elevation: 3,
      child: Column(
        children: <Widget>[
          Container(
            color: Settings.mediumGreyColor,
            child: Platform.isIOS
                ? CupertinoCustomDatePicker(controller: controller)
                : MaterialCustomDatePicker(controller: controller),
          ),
        ],
      ),
    );
  }
}
