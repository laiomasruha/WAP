// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReportController on _ReportControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_ReportControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$isEditingAtom = Atom(name: '_ReportControllerBase.isEditing');

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  final _$logsAtom = Atom(name: '_ReportControllerBase.logs');

  @override
  ObservableList<ReportLogModel> get logs {
    _$logsAtom.reportRead();
    return super.logs;
  }

  @override
  set logs(ObservableList<ReportLogModel> value) {
    _$logsAtom.reportWrite(value, super.logs, () {
      super.logs = value;
    });
  }

  final _$emailsAtom = Atom(name: '_ReportControllerBase.emails');

  @override
  ObservableList<String> get emails {
    _$emailsAtom.reportRead();
    return super.emails;
  }

  @override
  set emails(ObservableList<String> value) {
    _$emailsAtom.reportWrite(value, super.emails, () {
      super.emails = value;
    });
  }

  final _$getLogsAsyncAction = AsyncAction('_ReportControllerBase.getLogs');

  @override
  Future getLogs(String id) {
    return _$getLogsAsyncAction.run(() => super.getLogs(id));
  }

  final _$queueAsyncAction = AsyncAction('_ReportControllerBase.queue');

  @override
  Future<Response<dynamic>> queue({String id}) {
    return _$queueAsyncAction.run(() => super.queue(id: id));
  }

  final _$_ReportControllerBaseActionController =
      ActionController(name: '_ReportControllerBase');

  @override
  void setEditing(bool option) {
    final _$actionInfo = _$_ReportControllerBaseActionController.startAction(
        name: '_ReportControllerBase.setEditing');
    try {
      return super.setEditing(option);
    } finally {
      _$_ReportControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool option) {
    final _$actionInfo = _$_ReportControllerBaseActionController.startAction(
        name: '_ReportControllerBase.setLoading');
    try {
      return super.setLoading(option);
    } finally {
      _$_ReportControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getEmails() {
    final _$actionInfo = _$_ReportControllerBaseActionController.startAction(
        name: '_ReportControllerBase.getEmails');
    try {
      return super.getEmails();
    } finally {
      _$_ReportControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addEmail(String item) {
    final _$actionInfo = _$_ReportControllerBaseActionController.startAction(
        name: '_ReportControllerBase.addEmail');
    try {
      return super.addEmail(item);
    } finally {
      _$_ReportControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeEmail(int index) {
    final _$actionInfo = _$_ReportControllerBaseActionController.startAction(
        name: '_ReportControllerBase.removeEmail');
    try {
      return super.removeEmail(index);
    } finally {
      _$_ReportControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmailList(ObservableList<String> list) {
    final _$actionInfo = _$_ReportControllerBaseActionController.startAction(
        name: '_ReportControllerBase.setEmailList');
    try {
      return super.setEmailList(list);
    } finally {
      _$_ReportControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetEmailList() {
    final _$actionInfo = _$_ReportControllerBaseActionController.startAction(
        name: '_ReportControllerBase.resetEmailList');
    try {
      return super.resetEmailList();
    } finally {
      _$_ReportControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearLogs() {
    final _$actionInfo = _$_ReportControllerBaseActionController.startAction(
        name: '_ReportControllerBase.clearLogs');
    try {
      return super.clearLogs();
    } finally {
      _$_ReportControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<bool> copyToRpx(ReportModel report) {
    final _$actionInfo = _$_ReportControllerBaseActionController.startAction(
        name: '_ReportControllerBase.copyToRpx');
    try {
      return super.copyToRpx(report);
    } finally {
      _$_ReportControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isEditing: ${isEditing},
logs: ${logs},
emails: ${emails}
    ''';
  }
}
