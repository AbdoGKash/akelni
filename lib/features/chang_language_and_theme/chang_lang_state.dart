part of 'chang_lang_cubit.dart';

sealed class ChangeLanguageAndThemeState {
  const ChangeLanguageAndThemeState();
}

final class ChangeLanguageAndTheme extends ChangeLanguageAndThemeState {}

class ChageLocaleState extends ChangeLanguageAndThemeState {
  final Locale local;

  ChageLocaleState({required this.local});
}

class InitialTheme extends ChangeLanguageAndThemeState {}

class LightTheme extends ChangeLanguageAndThemeState {}

class DarkTheme extends ChangeLanguageAndThemeState {}
