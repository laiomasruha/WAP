import 'dart:io';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wapp_reports/app/models/report-image-model.dart';
import 'package:wapp_reports/app/models/report-model.dart';
import 'package:wapp_reports/box.dart';
import 'package:wapp_reports/settings.dart';
import 'package:wapp_reports/utils/custom_dio.dart';

class DraftsRepository {
  final CustomDio dio;

  DraftsRepository({this.dio}); //DRAFT

  Future<ReportModel> loadDraft() async {
    Map<String, dynamic> draft = await Box.getMap('draft');
    return ReportModel.fromJson(draft);
  }

  void setDraft(ReportModel draft) async {
    await Box.saveMap('draft', draft.toJson());
  }

  void resetDraft() async {
    ReportModel draft = ReportModel(
      title: "",
      services: List<String>(),
      staff: List<String>(),
      obs: List<String>(),
      images: List<ReportImageModel>(),
      reportDate: DateTime.now().toString(),
    );
    await Box.saveMap("draft", draft.toJson());

    Directory appDocDir = await getApplicationDocumentsDirectory();
    for (var aux in appDocDir.listSync()) {
      if (aux.path.endsWith(".jpg") || aux.path.endsWith(".jpeg")) {
        File(aux.path).delete();
      }
    }
  }

  void setTitle(String title) async {
    ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
    draft.title = title.trim().toUpperCase();
    await Box.saveMap("draft", draft.toJson());
  }

  void setPickedDate(DateTime pickedDate) async {
    ReportModel draft = await loadDraft();
    draft.reportDate = pickedDate.toString();
    await Box.saveMap("draft", draft.toJson());
  }

  void add(dynamic item, ListType type) async {
    switch (type) {
      case ListType.services:
        ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
        draft.services.add(item);
        await Box.saveMap("draft", draft.toJson());
        break;
      case ListType.staff:
        ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
        draft.staff.add(item);
        await Box.saveMap("draft", draft.toJson());
        break;
      case ListType.obs:
        ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
        draft.obs.add(item);
        await Box.saveMap("draft", draft.toJson());
        break;
      case ListType.images:
        ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
        draft.images.add(item);
        await Box.saveMap("draft", draft.toJson());
        break;
    }
  }

  void insert(int index, item, ListType type) async {
    switch (type) {
      case ListType.services:
        ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
        draft.services.insert(index, item);
        await Box.saveMap("draft", draft.toJson());
        break;
      case ListType.staff:
        ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
        draft.staff.insert(index, item);
        await Box.saveMap("draft", draft.toJson());
        break;
      case ListType.obs:
        ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
        draft.obs.insert(index, item);
        await Box.saveMap("draft", draft.toJson());
        break;
      case ListType.images:
        ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
        draft.images.insert(index, item);
        await Box.saveMap("draft", draft.toJson());
        break;
    }
  }

  void remove(int index, ListType type) async {
    switch (type) {
      case ListType.services:
        ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
        draft.services.removeAt(index);
        await Box.saveMap("draft", draft.toJson());
        break;
      case ListType.staff:
        ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
        draft.staff.removeAt(index);
        await Box.saveMap("draft", draft.toJson());
        break;
      case ListType.obs:
        ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
        draft.obs.removeAt(index);
        await Box.saveMap("draft", draft.toJson());
        break;
      case ListType.images:
        ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
        draft.images.removeAt(index);
        await Box.saveMap("draft", draft.toJson());
        break;
    }
  }

  addImage(ReportImageModel image) async {
    ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
    draft.images.add(image);
    await Box.saveMap("draft", draft.toJson());
  }

  addImages(List<ReportImageModel> images) async {
    ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
    for (var image in images) {
      draft.images.add(image);
    }
    await Box.saveMap("draft", draft.toJson());
  }

  removeImage(int id) async {
    ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
    draft.images.removeAt(id);
    await Box.saveMap("draft", draft.toJson());
  }

  updateImage(int id, ReportImageModel image) async {
    ReportModel draft = ReportModel.fromJson(await Box.getMap('draft'));
    draft.images[id] = image;
    await Box.saveMap("draft", draft.toJson());
  }

  //SEND EMAILS

  void setEmailList(ObservableList<String> list) async {
    await Box.saveObList('emails', list);
  }

  void resetEmailList() async {
    await Box.remove('emails');
  }

//dispose will be called automatically
  @override
  void dispose() {}
}
