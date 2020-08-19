import 'package:emergencyBhaktapur/Component/Phone_card.dart';
import 'package:emergencyBhaktapur/classes/language.dart';
import 'package:emergencyBhaktapur/localization/localization_constants.dart';
import 'package:emergencyBhaktapur/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:emergencyBhaktapur/Component/Custom_Drawer.dart';

class FireBrigade extends StatefulWidget {
  @override
  _FireBrigadeState createState() => _FireBrigadeState();
}

class _FireBrigadeState extends State<FireBrigade> {
  FSBStatus drawerStatus;

  void _changeLanguage(Language language) async {
    Locale _temp = await setLocale(language.languageCode);
    EmergencyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 30,
          child: Text(getTranslated(context, 'tab_fire')),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: DropdownButton(
                  underline: SizedBox(),
                  icon: Icon(
                    Icons.language,
                    color: Colors.white,
                  ),
                  items: Language.languageList()
                      .map<DropdownMenuItem<Language>>((lang) =>
                          DropdownMenuItem(
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
                  })),
        ],
        leading: IconButton(
            icon: Icon(
              MaterialCommunityIcons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
                    ? FSBStatus.FSB_CLOSE
                    : FSBStatus.FSB_OPEN;
              });
            }),
        automaticallyImplyLeading: false,
      ),
      body: FoldableSidebarBuilder(
        drawerBackgroundColor: Colors.white,
        status: drawerStatus,
        drawer: CustomDrawer(
          closeDrawer: () {
            setState(() {
              drawerStatus = FSBStatus.FSB_CLOSE;
            });
          },
        ),
        screenContents: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width - 20,
            margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                PhoneCard(
                  title: "Fire Brigade",
                  contact: "101",
                ),
                PhoneCard(
                  title: "Bhaktapur",
                  contact: "01-6610649",
                ),
                PhoneCard(
                  title: "Kathmandu",
                  contact: "01-4221177",
                ),
                PhoneCard(
                  title: "Lalitpur",
                  contact: "01-5521111",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
