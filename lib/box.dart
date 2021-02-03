import 'dart:convert';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Box {
  static Future<void> saveString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key) ? await prefs.get(key) : null;
  }

  static Future<void> saveObList(String key, ObservableList value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, jsonEncode(value));
  }

  static Future<ObservableList> getObList(String key) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(key)) {
      ObservableList<String> lista = ObservableList<String>();
      List<String> box = List<String>.from(jsonDecode(await prefs.get(key)));
      for (var i = 0; i < box.length; i++) {
        lista.add(box[i]);
      }
      return lista;
    }
    return null;
  }

  static Future<void> saveMap(String key, Map<String, dynamic> value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, json.encode(value));
  }

  static Future<Map<String, dynamic>> getMap(String key) async {
    try {
      Map<String, dynamic> map = json.decode(await getString(key));
      return map;
    } catch (_) {
      return null;
    }
  }

  static Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }
}
