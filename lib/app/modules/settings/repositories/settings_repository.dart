import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:wapp_reports/box.dart';
import 'package:wapp_reports/lists.dart';
import 'package:wapp_reports/settings.dart';
class SettingsRepository extends Disposable {
  //FUNCTIONS

  Future<List<String>> getConfig() async {
    if(await Box.getString(("config")) != null){
      List<String> config = jsonDecode(await Box.getString("config"));
      if(config == [null,null,null,null]){
        await resetList();
      }
    }else{
      await resetList();
    }

    return await jsonDecode(await Box.getString("config"));
  }

  resetList() async{
    List<String> newConfig = [
      Settings.lists[ListType.services.index],
      Settings.lists[ListType.staff.index],
      Settings.lists[ListType.obs.index],
      Settings.lists[ListType.images.index],
    ];
    await Box.saveString("config", jsonEncode(newConfig));
  }

  setList(int index, String listName) async {
    String boxList = await Box.getString("config");

    if (boxList == null) {
      resetList();
    }

    Iterable l = jsonDecode(await Box.getString("config"));
    List<String> config = List<String>.from(l).map((item) => item).toList();
    config.removeAt(index);
    config.insert(index, listName);
    await Box.saveString("config", jsonEncode(config));
    lists.arrayList = config;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
