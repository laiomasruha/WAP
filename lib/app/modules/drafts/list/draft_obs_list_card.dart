import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';
import 'package:wapp_reports/lists.dart';
import 'package:wapp_reports/settings.dart';

class DraftObsListCard extends StatelessWidget {
  final DraftsController controller;

  DraftObsListCard({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Column(
        children: <Widget>[
          Container(
            color: Settings.mediumGreyColor,
            child: ListTile(
              title: Text(
                lists.arrayList[ListType.obs.index],
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
                String hash = ListType.obs.toString().split(".")[1];
                Modular.link.pushNamed("/$hash", arguments: controller);
              },
            ),
          ),
          Observer(
            builder: (_) => ListView.builder(
              itemCount: controller.draft.obs.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text("${controller.draft.obs[index]}"),
                  leading: Icon(Icons.subdirectory_arrow_right),
                );
              },
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
  }
}
