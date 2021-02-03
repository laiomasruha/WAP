import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/app/modules/report/log/report-log.dart';
import 'package:wapp_reports/app/modules/report/report_controller.dart';
import 'package:wapp_reports/app/modules/report/report_page.dart';
import 'package:wapp_reports/app/modules/report/repositories/report-repository.dart';
import 'package:wapp_reports/app/modules/report/sender/report_sender_list.dart';
import 'package:wapp_reports/utils/custom_dio.dart';

class ReportModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ReportController(repository: i.get<ReportRepository>())),
        Bind((i) => ReportRepository(dio: i.get<CustomDio>())),
        Bind((i) => CustomDio()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute,
            child: (_, args) => ReportPage(item: args.data)),
        Router("/report-sender", child: (_, args) => ReportSenderList(id: args.data)),
        Router("/report-log", child: (_, args) => ReportLogPage(id: args.data)),
      ];

  static Inject get to => Inject<ReportModule>.of();
}
