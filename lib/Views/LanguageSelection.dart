import 'package:emergencyBhaktapur/Views/Home.dart';
import 'package:emergencyBhaktapur/classes/language.dart';
import 'package:emergencyBhaktapur/localization/localization_constants.dart';
import 'package:emergencyBhaktapur/main.dart';
import 'package:flutter/material.dart';

class LanguageSelection extends StatefulWidget {
  @override
  _LanguageSelectionState createState() => _LanguageSelectionState();
}

class _LanguageSelectionState extends State<LanguageSelection> {
  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.languageCode);
    EmergencyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language Selection"),
      ),
      body: Center(
        child: DropdownButton(
            underline: SizedBox(
              child: Text("Select Language"),
            ),
            icon: Icon(
              Icons.language,
              color: Colors.white,
            ),
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                      value: lang,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            lang.name,
                            style: TextStyle(fontSize: 30.0),
                          ),
                          Text(lang.flag),
                        ],
                      ),
                    ))
                .toList(),
            onChanged: (Language language) {
              _changeLanguage(language);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            }),
      ),
    );
  }
}
