import 'package:emergencyBhaktapur/Component/Phone_card.dart';
import 'package:emergencyBhaktapur/classes/language.dart';
import 'package:emergencyBhaktapur/localization/localization_constants.dart';
import 'package:emergencyBhaktapur/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:emergencyBhaktapur/Component/Custom_Drawer.dart';
import 'package:emergencyBhaktapur/Views/HospitalMap.dart';

class Hospital extends StatefulWidget {
  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  FSBStatus drawerStatus;

  void _changeLanguage(Language language) {
    Locale _temp;
    switch (language.languageCode) {
      case 'en':
        print("english");
        _temp = Locale(language.languageCode, 'US');
        print(_temp);

        break;
      case 'ne':
        _temp = Locale(language.languageCode, 'NP');
        print(_temp);

        break;
      default:
        _temp = Locale(language.languageCode, 'US');
    }

    EmergencyApp.setLocale(context, _temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 30,
          child: Text(getTranslated(context, 'tab_hospital')),
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
          IconButton(
            icon: Icon(
              FontAwesome.map_marker,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GoogleMaps()));
            },
          ),
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
                  title: "Bhaktapur Cancer Hospital",
                  contact: "01-6611532",
                ),
                PhoneCard(
                  title: "Bhaktapur Hospital",
                  contact: "01-6610798",
                ),
                PhoneCard(
                  title: "Bir Hospital",
                  contact: "01-4221988",
                ),
                PhoneCard(
                  title: "Blood Bank",
                  contact: "01-4225344",
                ),
                PhoneCard(
                  title: "Dhulikhel Hospital",
                  contact: "011-490497",
                ),
                PhoneCard(
                  title: "Gangala Hospital",
                  contact: "01-4371322",
                ),
                PhoneCard(
                  title: "Iwamura M. Hospital",
                  contact: "01-6612695",
                ),
                PhoneCard(
                  title: "Kanti Children's Hospital",
                  contact: "01-4414798",
                ),
                PhoneCard(
                  title: "Kathmandu Cancer Hospital",
                  contact: "01-5091629",
                ),
                PhoneCard(
                  title: "KMC Hospital",
                  contact: "01-6616568",
                ),
                PhoneCard(
                  title: "Lokanthali Hospital",
                  contact: "01-6631736",
                ),
                PhoneCard(
                  title: "Madhyapur Hospital",
                  contact: "01-6631658",
                ),
                PhoneCard(
                  title: "Nagarik C. Hospital",
                  contact: "01-6637700",
                ),
                PhoneCard(
                  title: "Nepal Eye Hospital",
                  contact: "01-4250691",
                ),
                PhoneCard(
                  title: "Nepal Korea Friendship Hospital",
                  contact: "01-6633442",
                ),
                PhoneCard(
                  title: "Nepal Tuberculosis Control Center",
                  contact: "01-6630706",
                ),
                PhoneCard(
                  title: "Patan Hospital",
                  contact: "01-5522266",
                ),
                PhoneCard(
                  title: "Prasuti Griha",
                  contact: "01-4411550",
                ),
                PhoneCard(
                  title: "Sahid DharmaBhakta National Transplant Center",
                  contact: "01-6614709",
                ),
                PhoneCard(
                  title: "Siddhi Memorial Women and Children Hospital",
                  contact: "01-6612945",
                ),
                PhoneCard(
                  title: "Summit Hospital",
                  contact: "01-6631736",
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Health Post',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PhoneCard(
                  title: "Bagwati Sthan Janaswasthaya",
                  contact: "01-6612163",
                ),
                PhoneCard(
                  title: "Byasi Janaswasthaya",
                  contact: "01-6610648",
                ),
                PhoneCard(
                  title: "Changu Primary Health Care",
                  contact: "9849424813",
                ),
                PhoneCard(
                  title: "Chayamasingh Janaswasthaya",
                  contact: "01-6610317",
                ),
                PhoneCard(
                  title: "District Community Eye Center",
                  contact: "01-6618058",
                ),
                PhoneCard(
                  title: "Madhyapur Health Care Center",
                  contact: "01-6630316",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
