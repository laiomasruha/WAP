import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';
import 'package:wapp_reports/settings.dart';

class DraftTitleCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DraftsController controller = Modular.get<DraftsController>();

    return Card(
      elevation: 3,
      child: Column(
        children: <Widget>[
          Container(
            color: Settings.mediumGreyColor,
            child: ListTile(
              title: Text(
                "Título",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Settings.darkBlueColor),
              ),
              trailing: CircleAvatar(
                backgroundColor: Settings.darkGreyColor,
                child: Icon(
                  Icons.edit,
                  color: Settings.mediumGreyColor,
                  size: 20,
                ),
              ),
              onTap: () {
                Modular.link.pushNamed('/title');
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.subdirectory_arrow_right),
            title: Observer(
              builder: (_) => Text(controller.reportTitle),
            ),
          ),
        ],
      ),
    );
  }
}
