import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:emergencyBhaktapur/Component/Custom_Drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
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
                
                Card(
                  title: "Bhaktapur Cancer Hospital",
                  contact: "9841539930",
                ),
                
                Card(
                  title: "Bhaktapur Hospital",
                  contact: "9840256340",
                ),
                
                Card(
                  title: "Dr. Iwamura Memorial",
                  contact: "9860025333",
                ),
                
                Card(
                  title: "Kathmandu Cancer Center",
                  contact: "9841466550",
                ),
                Card(
                  title: "Madhayapur Hospital",
                  contact: "9851133613",
                ),
                Card(
                  title: "Siddhi Smriti Hospital",
                  contact: "9841204991",
                ),
                SizedBox(height: 20,),
                Text(
                  'Red Cross',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(
                  title: "Red Cross Bhaktapur",
                  contact: "9849857332",
                ),
                Card(
                  title: "Red Cross Changunarayan",
                  contact: "01-6622464",
                ),
                Card(
                  title: "Red Cross Nagarkot Samudaya",
                  contact: "9741233600",
                ),
                Card(
                  title: "Red Cross Nalinchowk",
                  contact: "9741208341",
                ),
                 Card(
                  title: "Red Cross Tathali",
                  contact: "9841233815",
                ),
                Card(
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
                Card(
                  title: "Municipality Bhaktapur",
                  contact: "9851082799",
                ),
                Card(
                  title: "Municipality Changunarayan",
                  contact: "9851214809",
                ),
                Card(
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
                Card(
                  title: "Aakhanda Sewa Samiti",
                  contact: "9741323296",
                ),
                Card(
                  title: "Bhaktapur District Development Committee",
                  contact: "9841395199",
                ),
                Card(
                  title: "Bramayani Sudal",
                  contact: "9843633744",
                ),
                Card(
                  title: "Changu HealthPost",
                  contact: "9849424813",
                ),
                Card(
                  title: "Gramin Bikash Purbadhar Kendra",
                  contact: "9841477794",
                ),
                Card(
                  title: "Harinam Sankritan Sewa Samiti",
                  contact: "9860335944",
                ),
                Card(
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

class Card extends StatelessWidget {
  Card({Key key, this.title, this.contact})
      : super(key: key);
  String title, contact;

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        // height: 55,
        margin: EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset.fromDirection(90, 3),
              blurRadius: 5.0,
            ),
          ],
        ),
        child: ListTile(
          title: Text(
            this.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(this.contact,style: TextStyle(fontSize:16),),
          trailing: Icon(FontAwesomeIcons.phone,color: Colors.green,),
          onTap: () {
            print('Contact ');
            _makePhoneCall('tel:'+this.contact);
          },
        ),
      ),
    );
  }
}
