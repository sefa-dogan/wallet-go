import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/localizations/app_localizations.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  AppLocalizationsDelegate(this._supportedLocales);
  final List<Locale> _supportedLocales;

  @override
  bool isSupported(Locale locale) {
    var result = _supportedLocales.contains(locale);
    return result;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    var jsonStrings = await rootBundle.loadString(
        'assets/languages/${locale.languageCode}_${locale.countryCode}.json');
    AppLocalizations.localedStrings = json.decode(jsonStrings);
    return AppLocalizations();
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
