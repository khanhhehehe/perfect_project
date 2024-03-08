import 'package:flutter/material.dart';

class LanguageApp {
  final String localeName;
  final Locale locale;

  const LanguageApp({required this.localeName, required this.locale});
}

class Languages {
  static const LanguageApp vi = LanguageApp(
      localeName: 'vi', locale: Locale.fromSubtags(languageCode: 'vi'));
  static const LanguageApp en = LanguageApp(
      localeName: 'en', locale: Locale.fromSubtags(languageCode: 'en'));
}
