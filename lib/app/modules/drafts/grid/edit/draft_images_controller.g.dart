// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_images_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DraftImagesController on _DraftImagesControllerBase, Store {
  final _$shapeAtom = Atom(name: '_DraftImagesControllerBase.shape');

  @override
  int get shape {
    _$shapeAtom.reportRead();
    return super.shape;
  }

  @override
  set shape(int value) {
    _$shapeAtom.reportWrite(value, super.shape, () {
      super.shape = value;
    });
  }

  final _$thickAtom = Atom(name: '_DraftImagesControllerBase.thick');

  @override
  double get thick {
    _$thickAtom.reportRead();
    return super.thick;
  }

  @override
  set thick(double value) {
    _$thickAtom.reportWrite(value, super.thick, () {
      super.thick = value;
    });
  }

  final _$colorAtom = Atom(name: '_DraftImagesControllerBase.color');

  @override
  Color get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  final _$pathsAtom = Atom(name: '_DraftImagesControllerBase.paths');

  @override
  ObservableList<Map<dynamic, dynamic>> get paths {
    _$pathsAtom.reportRead();
    return super.paths;
  }

  @override
  set paths(ObservableList<Map<dynamic, dynamic>> value) {
    _$pathsAtom.reportWrite(value, super.paths, () {
      super.paths = value;
    });
  }

  final _$_DraftImagesControllerBaseActionController =
      ActionController(name: '_DraftImagesControllerBase');

  @override
  void setShape(int i) {
    final _$actionInfo = _$_DraftImagesControllerBaseActionController
        .startAction(name: '_DraftImagesControllerBase.setShape');
    try {
      return super.setShape(i);
    } finally {
      _$_DraftImagesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setThick(double i) {
    final _$actionInfo = _$_DraftImagesControllerBaseActionController
        .startAction(name: '_DraftImagesControllerBase.setThick');
    try {
      return super.setThick(i);
    } finally {
      _$_DraftImagesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setColor(Color c) {
    final _$actionInfo = _$_DraftImagesControllerBaseActionController
        .startAction(name: '_DraftImagesControllerBase.setColor');
    try {
      return super.setColor(c);
    } finally {
      _$_DraftImagesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addPath(Map<dynamic, dynamic> m) {
    final _$actionInfo = _$_DraftImagesControllerBaseActionController
        .startAction(name: '_DraftImagesControllerBase.addPath');
    try {
      return super.addPath(m);
    } finally {
      _$_DraftImagesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<dynamic, dynamic> removeLastPath() {
    final _$actionInfo = _$_DraftImagesControllerBaseActionController
        .startAction(name: '_DraftImagesControllerBase.removeLastPath');
    try {
      return super.removeLastPath();
    } finally {
      _$_DraftImagesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
shape: ${shape},
thick: ${thick},
color: ${color},
paths: ${paths}
    ''';
  }
}
