import 'package:flutter/material.dart';

enum ListType { services, staff, obs, images }

class Settings {
  //LOCALHOST
  // static String apiUrl = "http://192.168.0.29/wapp/public/api";
  // static String url = "http://192.168.0.29/wapp/public";

  //PRODUÇÃO
  static String apiUrl = "http://www.app.wapengenharia.com.br/api"; 
  static String url = "https://www.app.wapengenharia.com.br";

  static String whiteColorHex = '#ffffff';
  static String darkBlueColorHex = '#1d5681';
  static String blueColorHex = '#365175';
  static String lightBlueColorHex = '#24a3bf';
  static Color darkBlueColor = Color.fromRGBO(29, 86, 129, 1.0);
  static Color blueColor = Color.fromRGBO(54, 81, 117, 1.0);
  static Color lightBlueColor = Color.fromRGBO(36, 163, 191, 1.0);

  static Color lightGreyColor = Color.fromRGBO(242, 242, 242, 1.0);
  static Color mediumGreyColor = Color.fromRGBO(230, 230, 230, 1.0);
  static Color darkGreyColor = Color.fromRGBO(200, 200, 200, 1.0);

  static String logo = "assets/logo.png";

  static Map<int, String> lists = {
    ListType.services.index: "Serviços",
    ListType.staff.index: "Participantes",
    ListType.obs.index: "Observações",
    ListType.images.index: "Imagens",
  };
}
