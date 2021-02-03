import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:wapp_reports/app/models/report-image-model.dart';
import 'package:wapp_reports/app/models/report-model.dart';
import 'package:wapp_reports/app/modules/drafts/repositories/drafts_repository.dart';
import 'package:wapp_reports/box.dart';
import 'package:wapp_reports/settings.dart';

part 'drafts_controller.g.dart';

class DraftsController = _DraftsControllerBase with _$DraftsController;

abstract class _DraftsControllerBase with Store {
  final DraftsRepository repository;

  _DraftsControllerBase({this.repository}) {
    Box.getMap("draft").then((value) => draft = ReportModel.fromJson(value));
    Box.getObList("emails").then((list) =>
        list != null ? emails = list : emails = ObservableList<String>());
  }

  @observable
  String currentState = "initial";

  @observable
  bool isLoading = false;

  @observable
  bool isEditing = false;

  @observable
  bool isOrdering = false;

  @observable
  int indexOrdering = 0;

  @observable
  int indexUploading = 0;

  @observable
  int indexTotalUploading = 0;

  @observable
  ReportModel draft = ReportModel(
    title: "",
    reportDate: DateTime.now().toString(),
    services: List<String>(),
    staff: List<String>(),
    obs: List<String>(),
    images: List<ReportImageModel>(),
  );

  @observable
  ObservableList<String> emails = ObservableList<String>();

  @computed
  String get reportDate =>
      DateFormat('dd/MM/yyyy').format(DateTime.parse('${draft.reportDate}'));

  @computed
  String get reportTitle => draft.title != "" ? draft.title : "(Sem título)";

  @action
  void changeState(String state) {
    currentState = state;
  }

  @action
  void setEditing(bool option) {
    isEditing = option;
  }

  @action
  int getLength(ListType type) {
    List list = getList(type);
    return list.length;
  }

  @action
  void setTitle(String title) {
    draft.title = title;
    setDraft(draft);
    repository.setTitle(title);
  }

  @action
  dynamic get(int index, ListType type) {
    switch (type) {
      case ListType.services:
        return draft.services.elementAt(index);
        break;
      case ListType.staff:
        return draft.staff.elementAt(index);
        break;
      case ListType.obs:
        return draft.obs.elementAt(index);
        break;
      case ListType.images:
        return draft.images.elementAt(index);
        break;
    }
  }

  @action
  dynamic getList(ListType type) {
    switch (type) {
      case ListType.services:
        return draft.services;
      case ListType.staff:
        return draft.staff;
      case ListType.obs:
        return draft.obs;
      case ListType.images:
        return draft.images;
    }
  }

  @action
  void add(dynamic item, ListType type) {
    switch (type) {
      case ListType.services:
        repository.add(item, ListType.services);
        draft.services.add(item);
        setDraft(draft);
        break;
      case ListType.staff:
        repository.add(item, ListType.staff);
        draft.staff.add(item);
        setDraft(draft);
        break;
      case ListType.obs:
        repository.add(item, ListType.obs);
        draft.obs.add(item);
        setDraft(draft);
        break;
      case ListType.images:
        repository.add(item, ListType.images);
        draft.images.add(item);
        setDraft(draft);
        break;
    }
  }

  @action
  void update(int index, dynamic item, ListType type) {
    switch (type) {
      case ListType.services:
        repository.insert(index, item, ListType.services);
        draft.services[index] = item;
        setDraft(draft);
        break;
      case ListType.staff:
        repository.insert(index, item, ListType.staff);
        draft.staff[index] = item;
        setDraft(draft);
        break;
      case ListType.obs:
        repository.insert(index, item, ListType.obs);
        draft.obs[index] = item;
        setDraft(draft);
        break;
      case ListType.images:
        repository.insert(index, item, ListType.images);
        draft.images[index] = item;
        setDraft(draft);
        break;
    }
  }

  @action
  void insert(int index, dynamic item, ListType type) {
    switch (type) {
      case ListType.services:
        repository.insert(index, item, ListType.services);
        draft.services.insert(index, item);
        setDraft(draft);
        break;
      case ListType.staff:
        repository.insert(index, item, ListType.staff);
        draft.staff.insert(index, item);
        setDraft(draft);
        break;
      case ListType.obs:
        repository.insert(index, item, ListType.obs);
        draft.obs.insert(index, item);
        setDraft(draft);
        break;
      case ListType.images:
        repository.insert(index, item, ListType.images);
        draft.images.insert(index, item);
        setDraft(draft);
        break;
    }
  }

  @action
  void remove(int index, ListType type) {
    switch (type) {
      case ListType.services:
        repository.remove(index, ListType.services);
        draft.services.removeAt(index);
        setDraft(draft);
        break;
      case ListType.staff:
        repository.remove(index, ListType.staff);
        draft.staff.removeAt(index);
        setDraft(draft);
        break;
      case ListType.obs:
        repository.remove(index, ListType.obs);
        draft.obs.removeAt(index);
        setDraft(draft);
        break;
      case ListType.images:
        repository.remove(index, ListType.images);
        draft.images.removeAt(index);
        setDraft(draft);
        break;
    }
  }

  @action
  void addImage(ReportImageModel item) {
    isLoading = true;
    repository.addImage(item);
    draft.images.add(item);
    setDraft(draft);
    isLoading = false;
  }

  @action
  void addImages({List<ReportImageModel> images}) {
    isLoading = true;
    repository.addImages(images);
    List<ReportImageModel> list = <ReportImageModel>[];
    for (var image in images) {
      list.add(image);
    }
    draft.images = list;
    setDraft(draft);
    isLoading = false;
  }

  @action
  void removeImage(int id) {
    isLoading = true;
    repository.removeImage(id);
    draft.images.removeAt(id);
    setDraft(draft);
    isLoading = false;
  }

  @action
  void updateImage(int id, ReportImageModel item) {
    isLoading = true;
    draft.images.removeAt(id);
    draft.images.insert(id, item);
    setDraft(draft);
    isLoading = false;
  }

  @action
  void setDate(DateTime pickedDate) {
    repository.setPickedDate(pickedDate);
    draft.reportDate = pickedDate.toString();
    setDraft(draft);
  }

  @action
  void setDraft(ReportModel item) {
    draft = item;
    repository.setDraft(item);
  }

  @action
  void resetDraft() {
    ReportModel item = ReportModel(
      title: "",
      services: List<String>(),
      staff: List<String>(),
      obs: List<String>(),
      images: List<ReportImageModel>(),
      reportDate: DateTime.now().toString(),
    );
    setDraft(item);
    repository.resetDraft();
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
}
