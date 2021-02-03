import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:wapp_reports/app/models/report-log-model.dart';
import 'package:wapp_reports/app/models/report-model.dart';
import 'package:wapp_reports/app/modules/report/repositories/report-repository.dart';
import 'package:wapp_reports/box.dart';

part 'report_controller.g.dart';

class ReportController = _ReportControllerBase with _$ReportController;

abstract class _ReportControllerBase with Store {
  final ReportRepository repository;

  _ReportControllerBase({this.repository}) {
    Box.getObList("queue").then((list) =>
        list != null ? emails = list : emails = ObservableList<String>());
  }

  @observable
  bool isLoading = false;

  @observable
  bool isEditing = false;

  @observable
  ObservableList<ReportLogModel> logs = ObservableList<ReportLogModel>();

  @observable
  ObservableList<String> emails = ObservableList<String>();

  @action
  void setEditing(bool option) {
    isEditing = option;
  }

  @action
  void setLoading(bool option) {
    isLoading = option;
  }

  @action
  getLogs(String id) async {
    isLoading = true;
    Response response = await repository.getLogs(id);

    if(response.data["log"] != null) {
      List<ReportLogModel> list = (response.data["log"] as List)
          .map((course) => ReportLogModel.fromJson(course))
          .toList();

      logs = list.asObservable();
    }
    isLoading = false;
  }

  @action
  void getEmails() {
    isLoading = true;
    repository.getEmails().then((list) {
      resetEmailList();
      emails.addAll(list);
    });
    isLoading = false;
  }

  @action
  void addEmail(String item) {
    emails.add(item);
    repository.setEmailList(emails);
  }

  @action
  void removeEmail(int index) {
    emails.removeAt(index);
    repository.setEmailList(emails);
  }

  @action
  void setEmailList(ObservableList<String> list) {
    emails.addAll(list);
    repository.setEmailList(list);
  }

  @action
  void resetEmailList() {
    emails.clear();
    repository.resetEmailList();
  }

  @action
  void clearLogs() {
    logs.clear();
  }

  @action
  Future<Response> queue({String id}) async {
    return await repository.queue(id: id);
  }

  @action
  Future<bool> copyToRpx(ReportModel report) {
    return repository.copyToRpx(report);
  }
}
