library easy_i18n;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
export 'easy_i18n_delegate.dart';

class EasyI18n {
  EasyI18n(this.locale);

  static EasyI18n of(BuildContext context) {
    return Localizations.of<EasyI18n>(context, EasyI18n)!;
  }

  final Locale locale;
  late Map<String, dynamic> _sentences;

  Future<bool> load([Map<String, dynamic>? sentences]) async {
    if (sentences != null) {
      _sentences = sentences;
      return true;
    }

    try {
      String data = await rootBundle
          .loadString('resources/lang/${this.locale.languageCode}.json');
      this._sentences = json.decode(data);

      return true;
    } catch (_) {
      return false;
    }
  }

  String trans(String key, [List<String>? subKeys]) {
    var item = this._sentences[key] ?? '';

    if (item is Map && (subKeys != null && subKeys.isNotEmpty)) {
      subKeys.forEach(
        (String subKey) => item = item[subKey] ?? '',
      );
    }

    return item.toString();
  }

  String populate(String sentence, Map<String, String> values) {
    values.forEach(
      (key, value) => sentence = sentence.replaceAll('\$$key', value),
    );

    return sentence;
  }
}
