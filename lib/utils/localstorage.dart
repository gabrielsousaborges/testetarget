import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static getStorageList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<dynamic> _dados = [].asObservable();
    String? storage = prefs.getString(key);
    if (storage != null) {
      _dados = jsonDecode(storage);
    }
    return _dados;
  }

  static setStorageList(String key, List<dynamic> dados) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, jsonEncode(dados));
  }
}
