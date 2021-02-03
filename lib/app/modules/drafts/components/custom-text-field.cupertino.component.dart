import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';

class CupertinoCustomListTextField extends StatelessWidget {
  final TextEditingController textController;
  final DraftsController controller;

  CupertinoCustomListTextField({this.textController, this.controller});

  @override
  Widget build(BuildContext context) {
    void _isEditing(bool option) {
      controller.setEditing(option);
    }

    return CupertinoTextField(
      autocorrect: true,
      autofocus: true,
      controller: textController,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      minLines: 1,
      maxLines: 5,
      placeholder: "Digite...",
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
          border: Border.all(width: 0, style: BorderStyle.none),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
      onChanged: (text) =>
          text.length > 0 ? _isEditing(true) : _isEditing(false),
    );
  }
}
