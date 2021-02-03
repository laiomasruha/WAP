import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';
import 'package:wapp_reports/settings.dart';

class DraftSetTitle extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DraftsController controller = Modular.get<DraftsController>();
    _controller.text = controller.draft.title != null ? controller.draft.title : null;

    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Settings.darkBlueColor,
          automaticallyImplyLeading: true,
          title: Text(
            "Título",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.white,
                size: 24,
              ),
              onPressed: () {
                if (_controller.text.trim().length > 0) {
                  controller.setTitle(_controller.text.trim().toUpperCase());
                  Modular.link.pop();
                }
              },
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.text,
            autofocus: true,
            autocorrect: true,
            maxLines: 5,
//            textInputAction: TextInputAction.newline,
            decoration: new InputDecoration(
                hintText: "Informe um título...", border: InputBorder.none),
          ),
        ),
      ),
    );
  }
}
