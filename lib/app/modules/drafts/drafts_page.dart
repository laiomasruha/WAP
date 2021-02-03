import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:wapp_reports/app/modules/drafts/components/drafts-options-menu-button.component.dart';
import 'package:wapp_reports/app/modules/drafts/date/draft_date_picker.dart';
import 'package:wapp_reports/app/modules/drafts/grid/draft_grid_card.dart';
import 'package:wapp_reports/app/modules/drafts/list/draft_obs_list_card.dart';
import 'package:wapp_reports/app/modules/drafts/list/draft_service_list_card.dart';
import 'package:wapp_reports/app/modules/drafts/list/draft_staff_list_card.dart';
import 'package:wapp_reports/app/modules/drafts/title/draft_title_card.dart';
import 'drafts_controller.dart';

class DraftsPage extends StatefulWidget {
  final String title;

  const DraftsPage({Key key, this.title = "Novo Relatório"}) : super(key: key);

  @override
  _DraftsPageState createState() => _DraftsPageState();
}

class _DraftsPageState extends ModularState<DraftsPage, DraftsController> {
  final TextEditingController tc = TextEditingController();
  final formatter = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final DraftsController controller = Modular.get<DraftsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[DraftsOptionsMenuButton()],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(3),
            child: Column(
              children: <Widget>[
                DraftTitleCard(),
                DraftDatePicker(),
                DraftServiceListCard(controller: controller),
                DraftStaffListCard(controller: controller),
                DraftObsListCard(controller: controller),
                DraftGridCard(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
