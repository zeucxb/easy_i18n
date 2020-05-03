import 'package:easy_i18n/easy_i18n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class I18nDelegate extends LocalizationsDelegate<EasyI18n> {
  List<Locale> locales;

  I18nDelegate({this.locales}) : assert(locales != null && locales.isNotEmpty);

  @override
  bool isSupported(Locale locale) =>
      locales.firstWhere((supportedLocale) =>
          supportedLocale.languageCode == locale.languageCode) !=
      null;

  @override
  Future<EasyI18n> load(Locale locale) async {
    EasyI18n localizations = new EasyI18n(locale);
    await localizations.load();

    return localizations;
  }

  @override
  bool shouldReload(I18nDelegate old) => old.locales != locales;
}
