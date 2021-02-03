import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:wapp_reports/app/components/loading.component.dart';
import 'package:wapp_reports/app/components/tip.component.dart';
import 'package:wapp_reports/app/models/report-log-model.dart';
import 'package:wapp_reports/app/modules/report/report_controller.dart';
import 'package:wapp_reports/settings.dart';

class ReportLogPage extends StatelessWidget {
  final String id;

  ReportLogPage({this.id});

  @override
  Widget build(BuildContext context) {
    final ReportController controller = Modular.get<ReportController>();
    controller.getLogs(this.id);

    final formatter = DateFormat('dd/MM/yyyy - H:m');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Settings.darkBlueColor,
        title: Text(
          "Histórico de envios",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) => Loading(
          isLoading: controller.isLoading,
          child: controller.logs.length == 0
              ? Tip(
                  icon: Icons.info,
                  title: "Opss",
                  subtitle: "Não existem registros nesta seção.",
                )
              : ListView.separated(
                  separatorBuilder: (context, int) => Divider(
                    color: Colors.grey,
                  ),
                  shrinkWrap: true,
                  itemCount: controller.logs.length,
                  itemBuilder: (context, index) {
                    ReportLogModel item = controller.logs[index];
                    final date = item.sentAt != null
                        ? DateTime.parse(item.sentAt)
                        : null;
                    var sentAt = (item.sentAt != null
                        ? "Em: " + formatter.format(date)
                        : "Envio Pendente");
                    var icon = (item.sentAt != null
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.hourglass_full,
                            color: Colors.orangeAccent,
                          ));
                    return ListTile(
                      leading: icon,
                      title: Text(
                        item.recipientEmail.toLowerCase(),
                        style: TextStyle(color: Settings.blueColor, fontSize: 16),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          Icon(
                            Icons.subdirectory_arrow_right,
                            color: Settings.darkGreyColor,
                          ),
                          Text(
                            sentAt,
                            style: TextStyle(color: Settings.blueColor, fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
