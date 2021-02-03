import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:wapp_reports/app/app_drawer.dart';
import 'package:wapp_reports/app/auth/auth_controller.dart';
import 'package:wapp_reports/app/components/loading.component.dart';
import 'package:wapp_reports/app/components/progress-indicator.component.dart';
import 'package:wapp_reports/app/components/tip.component.dart';
import 'package:wapp_reports/app/models/report-model.dart';
import 'package:wapp_reports/app/modules/reports/reports-search.dart';
import 'package:wapp_reports/app/modules/reports/reports_controller.dart';
import 'package:wapp_reports/settings.dart';

class ReportsPage extends StatefulWidget {
  final String title;
  final AuthController authController;

  const ReportsPage({Key key, this.title = "Relatórios", this.authController}) : super(key: key);

  @override
  _ReportsPageState createState() => _ReportsPageState();
}

class _ReportsPageState extends State<ReportsPage> {
  final formatter = DateFormat('dd/MM/yyyy');
  final ReportsController controller = Modular.get<ReportsController>();
  AuthController authController = Modular.get<AuthController>();
  Future<void> future;

  @override
  void initState() {
    future = controller.getReports();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: (context),
                  delegate: ReportsSearch(controller.reports));
            },
          )
        ],
      ),
      drawer: AppDrawer(controller: widget.authController),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Modular.to.pushNamed("/drafts"),
        child: Icon(
          Icons.add,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshReports(context),
        child: SafeArea(
          child: FutureBuilder(
            future: future,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(child: GenericProgressIndicator(false));
              }

              return Observer(
                builder: (_) => Loading(
                  isLoading: controller.isLoading,
                  child: controller.reports.length <= 0
                      ? Tip(
                          title: "Opsss",
                          icon: Icons.info,
                          subtitle:
                              "Não existem relatórios gerados. Clique no botão abaixo para adicionar um novo relatório.",
                        )
                      : ListView.builder(
                          itemCount: controller.reports.length,
                          itemBuilder: (context, index) {
                            ReportModel item = controller.reports[index];
                            final date = DateTime.parse(item.reportDate);
                            return ListTile(
                              leading: Icon(
                                Icons.description,
                                size: 40,
                                color: Settings.darkGreyColor,
                              ),
                              title: Text(item.title),
                              subtitle: Text(formatter.format(date)),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                size: 15,
                              ),
                              onTap: () {
                                imageCache.clear();
                                Modular.to.pushNamed("/report", arguments: item);
                              },
                            );
                          },
                        ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _refreshReports(BuildContext context) {
    if(!authController.hasToken){
      authController.logout();
    }
    return controller.getReports();
  }
}
