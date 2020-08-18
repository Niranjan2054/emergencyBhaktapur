import 'package:emergencyBhaktapur/Component/Phone_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:emergencyBhaktapur/Component/Custom_Drawer.dart';

class Ambulance extends StatefulWidget {
  @override
  _AmbulanceState createState() => _AmbulanceState();
}

class _AmbulanceState extends State<Ambulance> {
  FSBStatus drawerStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 30,
          child: Text("Ambulance"),
        ),
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
                Text(
                  "Hospital's Ambulance",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PhoneCard(
                  title: "Bhaktapur Cancer Hospital",
                  contact: "9841539930",
                ),
                PhoneCard(
                  title: "Bhaktapur Hospital",
                  contact: "9840256340",
                ),
                PhoneCard(
                  title: "Dr. Iwamura Memorial",
                  contact: "9860025333",
                ),
                PhoneCard(
                  title: "Kathmandu Cancer Center",
                  contact: "9841466550",
                ),
                PhoneCard(
                  title: "Madhayapur Hospital",
                  contact: "9851133613",
                ),
                PhoneCard(
                  title: "Siddhi Smriti Hospital",
                  contact: "9841204991",
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Red Cross',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PhoneCard(
                  title: "Red Cross Bhaktapur",
                  contact: "9849857332",
                ),
                PhoneCard(
                  title: "Red Cross Changunarayan",
                  contact: "01-6622464",
                ),
                PhoneCard(
                  title: "Red Cross Nagarkot Samudaya",
                  contact: "9741233600",
                ),
                PhoneCard(
                  title: "Red Cross Nalinchowk",
                  contact: "9741208341",
                ),
                PhoneCard(
                  title: "Red Cross Tathali",
                  contact: "9841233815",
                ),
                PhoneCard(
                  title: "Red Cross Thimi",
                  contact: "9849170256",
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Municipalities',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PhoneCard(
                  title: "Municipality Bhaktapur",
                  contact: "9851082799",
                ),
                PhoneCard(
                  title: "Municipality Changunarayan",
                  contact: "9851214809",
                ),
                PhoneCard(
                  title: "Municipality Madhayapur",
                  contact: "9851010714",
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'General Misc.',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PhoneCard(
                  title: "Aakhanda Sewa Samiti",
                  contact: "9741323296",
                ),
                PhoneCard(
                  title: "Bhaktapur District Development Committee",
                  contact: "9841395199",
                ),
                PhoneCard(
                  title: "Bramayani Sudal",
                  contact: "9843633744",
                ),
                PhoneCard(
                  title: "Changu HealthPost",
                  contact: "9849424813",
                ),
                PhoneCard(
                  title: "Gramin Bikash Purbadhar Kendra",
                  contact: "9841477794",
                ),
                PhoneCard(
                  title: "Harinam Sankritan Sewa Samiti",
                  contact: "9860335944",
                ),
                PhoneCard(
                  title: "Sudal Bramahayani Bikash Kendra",
                  contact: "9843633744",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
