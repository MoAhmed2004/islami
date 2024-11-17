import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// observable
// publisher

// observers
// listeners
// subscribers
class SettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  SettingsProvider() {
    getThemeMode();
    getlang();
  }

  changeTheme(ThemeMode newTheme) {
    if (newTheme == themeMode) return;
    themeMode = newTheme;
    saveTheme(themeMode);
    notifyListeners();
  }

  String language = "en";

  changeLanguage(String newLanguage) {
    if (language == newLanguage) return;
    language = newLanguage;
    saveLanguage(language);
    notifyListeners();
  }

  void saveTheme(ThemeMode theme) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (theme == ThemeMode.light) {
      prefs.setString("theme", "light");
    } else {
      prefs.setString("theme", "dark");
    }
  }

  void getThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String cacheTheme = prefs.getString("theme") ?? "light";

    if (cacheTheme == "light") {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    notifyListeners();
  }

  void saveLanguage(String language) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("language", language);
    if (language == "en") {
      prefs.setString("language", "en");
    }
    else {
      prefs.setString("language", "ar");
    }
  }

    void getlang() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String cachelanguage = prefs.getString("language") ?? "en";
      if (cachelanguage == "en") {
        language = "en";
      }
      else {
        language = "ar";
      }
      notifyListeners();
    }
  }
