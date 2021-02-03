// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsController on _SettingsControllerBase, Store {
  final _$isLoadingAtom = Atom(name: '_SettingsControllerBase.isLoading');

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

  final _$listAtom = Atom(name: '_SettingsControllerBase.list');

  @override
  ObservableList<String> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<String> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$getConfigAsyncAction =
      AsyncAction('_SettingsControllerBase.getConfig');

  @override
  Future<void> getConfig() {
    return _$getConfigAsyncAction.run(() => super.getConfig());
  }

  final _$_SettingsControllerBaseActionController =
      ActionController(name: '_SettingsControllerBase');

  @override
  void save({Map<int, TextEditingController> map}) {
    final _$actionInfo = _$_SettingsControllerBaseActionController.startAction(
        name: '_SettingsControllerBase.save');
    try {
      return super.save(map: map);
    } finally {
      _$_SettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setList(int index, String listname) {
    final _$actionInfo = _$_SettingsControllerBaseActionController.startAction(
        name: '_SettingsControllerBase.setList');
    try {
      return super.setList(index, listname);
    } finally {
      _$_SettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
list: ${list}
    ''';
  }
}
