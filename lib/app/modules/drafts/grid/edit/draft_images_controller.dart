import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'draft_images_controller.g.dart';

class DraftImagesController = _DraftImagesControllerBase
    with _$DraftImagesController;

abstract class _DraftImagesControllerBase with Store {
  @observable
  int shape = 1;

  @observable
  double thick = 10.0;

  @observable
  Color color = Colors.red;

  @observable
  ObservableList<Map> paths = ObservableList<Map>();

  @action
  void setShape(int i) {
    shape = i;
  }

  @action
  void setThick(double i) {
    thick = i;
  }

  @action
  void setColor(Color c) {
    color = c;
  }

  @action
  void addPath(Map m) {
    paths.add(m);
  }

  @action
  Map removeLastPath() {
    if (paths != []) {
      return paths.removeLast();
    }
    return null;
  }
}
