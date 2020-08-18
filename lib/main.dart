import 'dart:async';
import 'package:emergencyBhaktapur/localization/demo_localization.dart';
import 'package:emergencyBhaktapur/routes/custom_router.dart';
import 'package:emergencyBhaktapur/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Views/Home.dart';
import 'package:emergencyBhaktapur/Views/Home.dart';

void main() {
  runApp(EmergencyApp());
}

class EmergencyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _EmergencyAppState state =
        context.findAncestorStateOfType<_EmergencyAppState>();
    state.setLocale(locale);
  }

  @override
  _EmergencyAppState createState() => _EmergencyAppState();
}

class _EmergencyAppState extends State<EmergencyApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergency Bhaktapur',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      locale: _locale,
      darkTheme: ThemeData.dark(),
      onGenerateRoute: CustomRouter.allRoutes,
      initialRoute: homeRoute,
      localizationsDelegates: [
        DemoLocalization.delegate,
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en", "US"),
        Locale("ne", "NP"),
      ],
      localeResolutionCallback: (deviceLocale, supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale.languageCode &&
              locale.countryCode == deviceLocale.countryCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}
