import 'dart:async';

import 'package:flutter/material.dart';

/// This class is generated by the flappy_translator package
/// Please do not change anything manually in this file, instead re-generate it when changes are available
class I18n {
  String get add => _getText("add");

  String get cancel => _getText("cancel");

  String get date => _getText("date");

  String get no => _getText("no");

  String get ok => _getText("ok");

  String get users => _getText("users");

  String get welcome => _getText("welcome");

  String get yes => _getText("yes");

  String get appTitle => _getText("appTitle");

  static Map<String, String> _localizedValues;

  static Map<String, String> _enValues = {
    "add": "Add",
    "cancel": "Cancel",
    "date": "Date",
    "no": "No",
    "ok": "OK",
    "users": "Users",
    "welcome": "Welcome",
    "yes": "Yes",
    "appTitle": "Eloff Street Notes",
  };

  static Map<String, String> _nlValues = {
    "add": "Toevoegen",
    "cancel": "Annuleren",
    "date": "Datum",
    "no": "Nee",
    "ok": "OK",
    "users": "Gebruikers",
    "welcome": "Welkom",
    "yes": "Ja",
    "appTitle": "Eloff Street Notes",
  };

  static Map<String, Map<String, String>> _allValues = {
    "en": _enValues,
    "nl": _nlValues,
  };

  I18n(Locale locale) {
    this._locale = locale;
    _localizedValues = null;
  }

  Locale _locale;

  static I18n of(BuildContext context) {
    return Localizations.of<I18n>(context, I18n);
  }

  String _getText(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  Locale get currentLocale => _locale;

  String get currentLanguage => _locale.languageCode;

  static Future<I18n> load(Locale locale) async {
    final translations = I18n(locale);
    _localizedValues = _allValues[locale.toString()];
    return translations;
  }
}

class I18nDelegate extends LocalizationsDelegate<I18n> {
  const I18nDelegate();

  static final Set<Locale> supportedLocals = {
    Locale('en'),
    Locale('nl'),
  };

  @override
  bool isSupported(Locale locale) => supportedLocals.contains(locale);

  @override
  Future<I18n> load(Locale locale) => I18n.load(locale);

  @override
  bool shouldReload(I18nDelegate old) => false;
}
