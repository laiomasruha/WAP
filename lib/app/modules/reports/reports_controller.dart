import 'package:mobx/mobx.dart';
import 'package:wapp_reports/app/models/report-model.dart';
import 'package:wapp_reports/app/modules/reports/repositories/reports-repository.dart';

part 'reports_controller.g.dart';

class ReportsController = _ReportsControllerBase with _$ReportsController;

abstract class _ReportsControllerBase with Store {
  final ReportsRepository repository;

  _ReportsControllerBase({this.repository});

  @observable
  String currentState = "initial";

  @observable
  bool isLoading = false;

  @observable
  ObservableList<ReportModel> reports = ObservableList<ReportModel>();

  @action
  void changeState(String state) {
    currentState = state;
  }

  @action
  Future<void> getReports() async {
    setReports(await repository.loadReports());
  }

  @action
  void setReports(List<ReportModel> list) {
    if (list != null) {
      reports = list.asObservable();
    } else {
      reports = ObservableList<ReportModel>();
    }
  }

  @action
  void clearReports() {
    reports.clear();
  }
}
