import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_app/models/user.dart';
import 'package:user_app/utilities/constants.dart';

class LocalStorageService {
  Future<List<User>> read() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? listString = sharedPreferences.getStringList(listKey);
    List<User> list = [];

    if (listString!.isNotEmpty) {
      list = listString.map((e) => User.fromJson(jsonDecode(e))).toList();
    } else {
      throw Exception(failedToLoadUserMsg);
    }
    return list;
  }

  save(List<User> list) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> usrList = list.map((item) => item.toJson()).toList();

    prefs.setStringList(listKey, usrList);
  }

  remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
