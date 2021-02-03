// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReportsController on _ReportsControllerBase, Store {
  final _$currentStateAtom = Atom(name: '_ReportsControllerBase.currentState');

  @override
  String get currentState {
    _$currentStateAtom.reportRead();
    return super.currentState;
  }

  @override
  set currentState(String value) {
    _$currentStateAtom.reportWrite(value, super.currentState, () {
      super.currentState = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ReportsControllerBase.isLoading');

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

  final _$reportsAtom = Atom(name: '_ReportsControllerBase.reports');

  @override
  ObservableList<ReportModel> get reports {
    _$reportsAtom.reportRead();
    return super.reports;
  }

  @override
  set reports(ObservableList<ReportModel> value) {
    _$reportsAtom.reportWrite(value, super.reports, () {
      super.reports = value;
    });
  }

  final _$getReportsAsyncAction =
      AsyncAction('_ReportsControllerBase.getReports');

  @override
  Future<void> getReports() {
    return _$getReportsAsyncAction.run(() => super.getReports());
  }

  final _$_ReportsControllerBaseActionController =
      ActionController(name: '_ReportsControllerBase');

  @override
  void changeState(String state) {
    final _$actionInfo = _$_ReportsControllerBaseActionController.startAction(
        name: '_ReportsControllerBase.changeState');
    try {
      return super.changeState(state);
    } finally {
      _$_ReportsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReports(List<ReportModel> list) {
    final _$actionInfo = _$_ReportsControllerBaseActionController.startAction(
        name: '_ReportsControllerBase.setReports');
    try {
      return super.setReports(list);
    } finally {
      _$_ReportsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearReports() {
    final _$actionInfo = _$_ReportsControllerBaseActionController.startAction(
        name: '_ReportsControllerBase.clearReports');
    try {
      return super.clearReports();
    } finally {
      _$_ReportsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentState: ${currentState},
isLoading: ${isLoading},
reports: ${reports}
    ''';
  }
}
