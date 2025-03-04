



import 'dart:convert';

import 'package:chaqchuq/app/model/bag.dart';
import 'package:shared_preferences/shared_preferences.dart';


class StorageService {
    late final SharedPreferences _prefs;
    Future<StorageService> init() async {
        _prefs = await SharedPreferences.getInstance();
        return this;
    }

    Future <bool> setBool(String key, bool value) async {
        return await _prefs.setBool(key, value);
    }
    bool getBool(String key) {
        return  _prefs.getBool(key)?? false;
    }
    Future <bool> setString(String key, String value) async {
        return await _prefs.setString(key, value);
    }

    String getString(String key) {
        return _prefs.getString(key) ?? "light";
    }
    
    Future<void> saveBagList(List<BagModel> bagList) async {
        List<String> jsonList = bagList.map((bag) => jsonEncode(bag.toJson())).toList();
        await _prefs.setStringList('bagList', jsonList);
    }

    
    Future<List<BagModel>> getBagList() async {
        List<String>? jsonList = _prefs.getStringList('bagList');

        if (jsonList == null) return [];
        return jsonList.map((json) => BagModel.fromJson(jsonDecode(json))).toList();
    }
}