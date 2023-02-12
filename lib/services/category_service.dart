import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/shared_memory.dart';
import '../models/models.dart';

class CategoryService extends ChangeNotifier {
  Future<List<StoryCharacter>> getCategories() async {
    final prefs = await SharedPreferences.getInstance();
    String? dataString = "";
    if (prefs.containsKey(Prefs.categoriesShKey)) {
      dataString = prefs.getString(Prefs.categoriesShKey);
    } else {
      dataString = await _loadFile("assets/categories.json");
      prefs.setString(Prefs.categoriesShKey, dataString);
    }

    var data = json.decode(dataString ?? '');
    var pars = data
        .map<StoryCharacter>((item) => StoryCharacter.fromJSON(item))
        .toList();

    return pars;
  }

  static Future<String> _loadFile(String path) async {
    return rootBundle.loadString(path);
  }
}
