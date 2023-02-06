import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/core/constants/shared_preferences.dart';
import 'package:flutter_boilerplate/localizations/app_localizations_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  AppLocalizations();
  // final Locale locale;
  static late Map<String, dynamic> localedStrings;

  static final _appLocalizationsDelegate =
      AppLocalizationsDelegate(supportedLocales);
  static List<Locale> supportedLocales = const [
    Locale("en", "US"),
    Locale("tr", "TR")
  ];
  static List<LocalizationsDelegate> localizationsDelegate = [
    _appLocalizationsDelegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static String translate(key) => localedStrings[key];

  static Locale? localeResolutionCallback(
      Locale? locale, Iterable<Locale> supportedLocales) {
    List<String>? appLanguage = SharedPref.prefs.getStringList("appLanguage");
    if (appLanguage != null) {
      return Locale(appLanguage[0], appLanguage[1]);
    }
    if (locale != null) {
      if (supportedLocales.contains(locale)) {
        return locale;
      }
    }
    return const Locale("en", "US");
  }
}
