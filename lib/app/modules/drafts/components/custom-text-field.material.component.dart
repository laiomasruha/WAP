import 'package:flutter/material.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';

class MaterialCustomListTextField extends StatelessWidget {
  final TextEditingController textController;
  final DraftsController controller;

  MaterialCustomListTextField({this.textController, this.controller});

  @override
  Widget build(BuildContext context) {
    void _isEditing(bool option) {
      controller.setEditing(option);
    }

    return TextFormField(
      autocorrect: true,
      autofocus: true,
      controller: textController,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      minLines: 1,
      maxLines: 5,
      onChanged: (text) =>
          text.length > 0 ? _isEditing(true) : _isEditing(false),
      decoration: InputDecoration(
        hintText: "Digite...",
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
    );
  }
}
