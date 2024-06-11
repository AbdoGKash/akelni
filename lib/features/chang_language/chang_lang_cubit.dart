import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helper/language/lang_cache_helper.dart';

part 'chang_lang_state.dart';

class ChangLangCubit extends Cubit<ChangLangState> {
  ChangLangCubit() : super(ChangLangInitial());

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    emit(ChageLocaleState(local: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode); // save
    emit(ChageLocaleState(local: Locale(languageCode)));
  }
}
