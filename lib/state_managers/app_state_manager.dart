import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/shared_memory.dart';
import '../models/models.dart';

class StoryTellerTab {
  static const int generate = 0;
  static const int history = 1;
  static const int favorite = 2;
  static const int singelStory = 3;
}

class AppStateManager extends ChangeNotifier {
  final prefs = SharedPreferences.getInstance();
  bool _onboardingComplete = false;
  int _selectedTab = StoryTellerTab.generate;
  bool _darkMode = false;

  bool get isOnboardingComplete => _onboardingComplete;
  int get getSelectedTab => _selectedTab;
  bool get darkMode => _darkMode;

  set darkMode(bool darkMode) {
    _darkMode = darkMode;
    notifyListeners();
  }

  void saveThemeState() async {}

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  void goToGenerate() {
    _selectedTab = StoryTellerTab.generate;
    notifyListeners();
  }

  void goToHistory() {
    _selectedTab = StoryTellerTab.history;
    notifyListeners();
  }

  void goToFavorite() {
    _selectedTab = StoryTellerTab.favorite;
    notifyListeners();
  }
}
