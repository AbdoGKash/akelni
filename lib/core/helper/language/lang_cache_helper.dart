import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String languageCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("LOCALE", languageCode);
  }

// return by defualt "en"
  Future<String> getCachedLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPreferences.getString("LOCALE");
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return "en";
    }
  }
}

////////// theme //////////////

// class ThemeCacheHelper {
//   Future<void> cacheTheme(ThemeData themeData) async {
//     final sharedPreferences = await SharedPreferences.getInstance();
//     sharedPreferences.setString("THEME", themeData);
//   }
// }

// Future<ThemeData> getCachedTheme() async {
//   final sharedPreferences = await SharedPreferences.getInstance();
//   final cachedTheme = sharedPreferences.getString("THEME");
//   if (cachedTheme != null) {
//     return cachedTheme;
//   }
//   return ThemeData.light();
// }
