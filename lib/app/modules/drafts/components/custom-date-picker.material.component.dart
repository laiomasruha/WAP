import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';
import 'package:wapp_reports/settings.dart';

class MaterialCustomDatePicker extends StatelessWidget {
  final DraftsController controller;

  MaterialCustomDatePicker({this.controller});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Observer(
        builder: (_) => Row(
          children: [
            Icon(
              Icons.event,
              color: Settings.darkBlueColor,
              size: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "${controller.reportDate}",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Settings.darkBlueColor),
            ),
          ],
        ),
      ),
      trailing: CircleAvatar(
        backgroundColor: Settings.darkGreyColor,
        child: Icon(
          Icons.edit,
          color: Settings.mediumGreyColor,
          size: 20,
        ),
      ),
      onTap: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.parse(controller.draft.reportDate),
          firstDate: DateTime(DateTime.now().year - 10),
          lastDate: DateTime(DateTime.now().year + 1),
        );

        if (pickedDate != null) {
          controller.setDate(pickedDate);
        }
      },
    );
  }
}
