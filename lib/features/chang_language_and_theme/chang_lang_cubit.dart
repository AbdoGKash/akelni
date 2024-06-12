import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/helper/language/lang_cache_helper.dart';
import '../../core/helper/theme_enum.dart';

part 'chang_lang_state.dart';

class ChangeLanguageAndThemeCubit extends Cubit<ChangeLanguageAndThemeState> {
  ChangeLanguageAndThemeCubit() : super(ChangeLanguageAndTheme());

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    emit(ChageLocaleState(local: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode); // save
    emit(ChageLocaleState(local: Locale(languageCode)));
  }

  changeTheme(ThemeState themeState) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    switch (themeState) {
      case ThemeState.initialTheme:
        if (sharedPreferences.getString('THEME') != null) {
          if (sharedPreferences.getString('THEME') == 'light') {
            emit(LightTheme());
          } else {
            emit(DarkTheme());
          }
        }
        break;
      case ThemeState.lightTheme:
        sharedPreferences.setString('THEME', 'light');
        emit(LightTheme());
        break;
      case ThemeState.darkTheme:
        sharedPreferences.setString('THEME', 'dark');
        emit(DarkTheme());
        break;
      default:
    }
  }
}
