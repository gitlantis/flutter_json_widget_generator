import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/shared_memory.dart';
import '../models/story_character.dart';

class SharedPrefs extends ChangeNotifier {
  static var _sharedPrefs;
  static var _jsonFile;
  bool get darkMode => getDarkMode();

  set darkMode(bool darkMode) {
    setDarkMode(darkMode);
  }
  // factory SharedPrefs() => SharedPrefs._internal();
  // SharedPrefs._internal();

  init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
      _jsonFile = await _loadFile("assets/categories.json");
    }
  }

  bool getDarkMode() {
    var state = _sharedPrefs.getBool(Prefs.themeShKey) ?? false;
    return state;
  }

  void setDarkMode(bool value) {
    _sharedPrefs.setBool(Prefs.themeShKey, value);
    notifyListeners();
  }

  set categories(String value) {
    _sharedPrefs.setString(Prefs.categoriesShKey, value);
    notifyListeners();
  }

  List<StoryCharacter> getCategories() {
    var data = json.decode(_jsonFile ?? '');
    var pars = data
        .map<StoryCharacter>((item) => StoryCharacter.fromJSON(item))
        .toList();

    return pars;
  }

  static Future<String> _loadFile(String path) async {
    return rootBundle.loadString(path);
  }
}
