import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:emergencyBhaktapur/localization/demo_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).getTranslatedValue(key);
}

// language  code
const String ENGLISH = 'en';
const String NEPALI = 'nep';

const String LANGUAGE_CODE = "languageCode";

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LANGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temp;
  switch (languageCode) {
    case 'en':
      print("english");
      _temp = Locale(languageCode, 'US');
      print(_temp);

      break;
    case 'ne':
      _temp = Locale(languageCode, 'NP');
      print(_temp);

      break;
    default:
      _temp = Locale(languageCode, 'US');
  }

  return _temp;
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LANGUAGE_CODE) ?? ENGLISH;
  return _locale(languageCode);
}
