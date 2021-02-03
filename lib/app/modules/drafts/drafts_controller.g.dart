// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drafts_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DraftsController on _DraftsControllerBase, Store {
  Computed<String> _$reportDateComputed;

  @override
  String get reportDate =>
      (_$reportDateComputed ??= Computed<String>(() => super.reportDate,
              name: '_DraftsControllerBase.reportDate'))
          .value;
  Computed<String> _$reportTitleComputed;

  @override
  String get reportTitle =>
      (_$reportTitleComputed ??= Computed<String>(() => super.reportTitle,
              name: '_DraftsControllerBase.reportTitle'))
          .value;

  final _$currentStateAtom = Atom(name: '_DraftsControllerBase.currentState');

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

  final _$isLoadingAtom = Atom(name: '_DraftsControllerBase.isLoading');

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

  final _$isEditingAtom = Atom(name: '_DraftsControllerBase.isEditing');

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

  final _$isOrderingAtom = Atom(name: '_DraftsControllerBase.isOrdering');

  @override
  bool get isOrdering {
    _$isOrderingAtom.reportRead();
    return super.isOrdering;
  }

  @override
  set isOrdering(bool value) {
    _$isOrderingAtom.reportWrite(value, super.isOrdering, () {
      super.isOrdering = value;
    });
  }

  final _$indexOrderingAtom = Atom(name: '_DraftsControllerBase.indexOrdering');

  @override
  int get indexOrdering {
    _$indexOrderingAtom.reportRead();
    return super.indexOrdering;
  }

  @override
  set indexOrdering(int value) {
    _$indexOrderingAtom.reportWrite(value, super.indexOrdering, () {
      super.indexOrdering = value;
    });
  }

  final _$indexUploadingAtom =
      Atom(name: '_DraftsControllerBase.indexUploading');

  @override
  int get indexUploading {
    _$indexUploadingAtom.reportRead();
    return super.indexUploading;
  }

  @override
  set indexUploading(int value) {
    _$indexUploadingAtom.reportWrite(value, super.indexUploading, () {
      super.indexUploading = value;
    });
  }

  final _$indexTotalUploadingAtom =
      Atom(name: '_DraftsControllerBase.indexTotalUploading');

  @override
  int get indexTotalUploading {
    _$indexTotalUploadingAtom.reportRead();
    return super.indexTotalUploading;
  }

  @override
  set indexTotalUploading(int value) {
    _$indexTotalUploadingAtom.reportWrite(value, super.indexTotalUploading, () {
      super.indexTotalUploading = value;
    });
  }

  final _$draftAtom = Atom(name: '_DraftsControllerBase.draft');

  @override
  ReportModel get draft {
    _$draftAtom.reportRead();
    return super.draft;
  }

  @override
  set draft(ReportModel value) {
    _$draftAtom.reportWrite(value, super.draft, () {
      super.draft = value;
    });
  }

  final _$emailsAtom = Atom(name: '_DraftsControllerBase.emails');

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

  final _$_DraftsControllerBaseActionController =
      ActionController(name: '_DraftsControllerBase');

  @override
  void changeState(String state) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.changeState');
    try {
      return super.changeState(state);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEditing(bool option) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.setEditing');
    try {
      return super.setEditing(option);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int getLength(ListType type) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.getLength');
    try {
      return super.getLength(type);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String title) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.setTitle');
    try {
      return super.setTitle(title);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic get(int index, ListType type) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.get');
    try {
      return super.get(index, type);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getList(ListType type) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.getList');
    try {
      return super.getList(type);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(dynamic item, ListType type) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.add');
    try {
      return super.add(item, type);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void update(int index, dynamic item, ListType type) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.update');
    try {
      return super.update(index, item, type);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void insert(int index, dynamic item, ListType type) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.insert');
    try {
      return super.insert(index, item, type);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(int index, ListType type) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.remove');
    try {
      return super.remove(index, type);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addImage(ReportImageModel item) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.addImage');
    try {
      return super.addImage(item);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addImages({List<ReportImageModel> images}) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.addImages');
    try {
      return super.addImages(images: images);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeImage(int id) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.removeImage');
    try {
      return super.removeImage(id);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateImage(int id, ReportImageModel item) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.updateImage');
    try {
      return super.updateImage(id, item);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(DateTime pickedDate) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.setDate');
    try {
      return super.setDate(pickedDate);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDraft(ReportModel item) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.setDraft');
    try {
      return super.setDraft(item);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetDraft() {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.resetDraft');
    try {
      return super.resetDraft();
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addEmail(String item) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.addEmail');
    try {
      return super.addEmail(item);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeEmail(int index) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.removeEmail');
    try {
      return super.removeEmail(index);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmailList(ObservableList<String> list) {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.setEmailList');
    try {
      return super.setEmailList(list);
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetEmailList() {
    final _$actionInfo = _$_DraftsControllerBaseActionController.startAction(
        name: '_DraftsControllerBase.resetEmailList');
    try {
      return super.resetEmailList();
    } finally {
      _$_DraftsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentState: ${currentState},
isLoading: ${isLoading},
isEditing: ${isEditing},
isOrdering: ${isOrdering},
indexOrdering: ${indexOrdering},
indexUploading: ${indexUploading},
indexTotalUploading: ${indexTotalUploading},
draft: ${draft},
emails: ${emails},
reportDate: ${reportDate},
reportTitle: ${reportTitle}
    ''';
  }
}
