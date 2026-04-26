import 'package:flutter/material.dart';

import '../utils/PreferenceUtils.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    // Optionally load initial state from preferences
    _loadThemeFromPrefs();
  }

  void _loadThemeFromPrefs() {
    _isDarkMode = PreferenceUtils.getBooleanTheme("is_dark_mode"); // Default for now
    notifyListeners();
  }

  void toggleTheme(bool value) {
    _isDarkMode = value;
    // Save to prefs for persistence
    PreferenceUtils.saveBooleanTheme('is_dark_mode', value);
    notifyListeners();
  }
}