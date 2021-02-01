import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkTheme;

  ThemeNotifier() {
    _isDarkTheme = false;
  }

  bool get isDarkTheme => this._isDarkTheme;

  ThemeMode currentTheme() =>
      this._isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void switchTheme(bool isDark){
    this._isDarkTheme = isDark;
    notifyListeners();
  }
}
