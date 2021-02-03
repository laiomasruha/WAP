import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';
import 'package:wapp_reports/app/modules/drafts/grid/image_grid.dart';
import 'package:wapp_reports/lists.dart';
import 'package:wapp_reports/settings.dart';

class DraftGridCard extends StatelessWidget {
  final DraftsController controller;

  DraftGridCard({@required this.controller});

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
                lists.arrayList[ListType.images.index],
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
                Modular.link.pushNamed('/images', arguments: controller);
              },
            ),
          ),
          Observer(
            builder: (_) => controller.draft.images.length > 0
                ? GridView.builder(
                    itemCount: controller.draft.images != null
                        ? controller.draft.images.length
                        : 0,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: 4, bottom: 4),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5,
                    ),
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.only(bottom: 4, right: 4),
                        title: Container(
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(0),
                          child: Stack(
                            fit: StackFit.expand,
                            alignment: Alignment.bottomRight,
                            children: <Widget>[
                              ImageGrid(
                                path: controller.draft.images[index].thumb,
                              ),
                              controller.draft.images[index].sub != ""
                                  ? Icon(
                                      Icons.comment,
                                      color: Colors.white,
                                    )
                                  : Icon(
                                      Icons.comment,
                                      color: Colors.transparent,
                                    ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
