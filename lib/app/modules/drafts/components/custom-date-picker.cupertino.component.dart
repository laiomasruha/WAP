import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:wapp_reports/app/modules/drafts/drafts_controller.dart';
import 'package:wapp_reports/settings.dart';

class CupertinoCustomDatePicker extends StatelessWidget {
  final DraftsController controller;

  CupertinoCustomDatePicker({this.controller});

  _changeDate(DateTime pickedDate) {
    if (pickedDate != null) {
      controller.setDate(pickedDate);
    }
  }

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
        showModalBottomSheet(
          context: context,
          builder: (BuildContext builder) {
            return Container(
              height: MediaQuery.of(context).copyWith().size.height / 3,
              child: CupertinoDatePicker(
                initialDateTime: DateTime.parse(controller.draft.reportDate),
                maximumDate: DateTime(DateTime.now().year + 1),
                minimumDate: DateTime(DateTime.now().year - 10),
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (picked) => _changeDate(picked),
              ),
            );
          },
        );
      },
    );
  }
}
