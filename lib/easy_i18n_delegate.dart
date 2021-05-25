import 'package:easy_i18n/i18n_delegete.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class EasyI18nDelegate {
  final List<Locale> supportedLocales;
  late List<LocalizationsDelegate> localizationsDelegates;

  EasyI18nDelegate({required this.supportedLocales})
      : assert(supportedLocales.isNotEmpty) {
    localizationsDelegates = [
      I18nDelegate(locales: supportedLocales),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      DefaultCupertinoLocalizations.delegate,
    ];
  }

  final Locale Function(Locale, Iterable<Locale>) localeResolutionCallback =
      (Locale locale, Iterable<Locale> supportedLocales) {
    for (Locale supportedLocale in supportedLocales) {
      if (supportedLocale == locale) {
        return supportedLocale;
      }
    }

    for (Locale supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return supportedLocale;
      }
    }

    return supportedLocales.first;
  };
}
