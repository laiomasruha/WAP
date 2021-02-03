import 'dart:io' show Platform;
import 'package:flutter/widgets.dart';
import 'package:wapp_reports/app/modules/drafts/components/custom-text-field.cupertino.component.dart';
import 'package:wapp_reports/app/modules/drafts/components/custom-text-field.material.component.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';

class GenericCustomListTextField extends StatelessWidget {
  final TextEditingController textController;
  final DraftsController controller;

  GenericCustomListTextField({this.textController, this.controller});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoCustomListTextField(
            textController: textController, controller: controller)
        : MaterialCustomListTextField(
            textController: textController, controller: controller);
  }
}
