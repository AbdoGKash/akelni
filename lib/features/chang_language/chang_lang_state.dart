part of 'chang_lang_cubit.dart';

sealed class ChangLangState {
  const ChangLangState();
}

final class ChangLangInitial extends ChangLangState {}

class ChageLocaleState extends ChangLangState {
  final Locale local;

  ChageLocaleState({required this.local});
}
