import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:emergencyBhaktapur/Component/Custom_Drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class Hospital extends StatefulWidget {
  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  FSBStatus drawerStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 30,
          child: Text("Hospital"),
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
                Card(
                  title: "Bhaktapur Cancer Hospital",
                  contact: "01-6611532",
                ),
                Card(
                  title: "Bhaktapur Hospital",
                  contact: "01-6610798",
                ),
                Card(
                  title: "Bir Hospital",
                  contact: "01-4221988",
                ),
                Card(
                  title: "Blood Bank",
                  contact: "01-4225344",
                ),
                Card(
                  title: "Dhulikhel Hospital",
                  contact: "011-490497",
                ),
                Card(
                  title: "Gangala Hospital",
                  contact: "01-4371322",
                ),
                Card(
                  title: "Iwamura M. Hospital",
                  contact: "01-6612695",
                ),
                Card(
                  title: "Kanti Children's Hospital",
                  contact: "01-4414798",
                ),
                Card(
                  title: "Kathmandu Cancer Hospital",
                  contact: "01-5091629",
                ),
                Card(
                  title: "KMC Hospital",
                  contact: "01-6616568",
                ),
                Card(
                  title: "Lokanthali Hospital",
                  contact: "01-6631736",
                ),
                Card(
                  title: "Madhyapur Hospital",
                  contact: "01-6631658",
                ),
                Card(
                  title: "Nagarik C. Hospital",
                  contact: "01-6637700",
                ),
                Card(
                  title: "Nepal Eye Hospital",
                  contact: "01-4250691",
                ),
                Card(
                  title: "Nepal Korea Friendship Hospital",
                  contact: "01-6633442",
                ),
                Card(
                  title: "Nepal Tuberculosis Control Center",
                  contact: "01-6630706",
                ),
                Card(
                  title: "Patan Hospital",
                  contact: "01-5522266",
                ),
                Card(
                  title: "Prasuti Griha",
                  contact: "01-4411550",
                ),
                Card(
                  title: "Sahid DharmaBhakta National Transplant Center",
                  contact: "01-6614709",
                ),
                Card(
                  title: "Siddhi Memorial Women and Children Hospital",
                  contact: "01-6612945",
                ),
                Card(
                  title: "Siddhi Smriti Hospital",
                  contact: "01-6612947",
                ),
                Card(
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
                Card(
                  title: "Bagwati Sthan Janaswasthaya",
                  contact: "01-6612163",
                ),
                Card(
                  title: "Byasi Janaswasthaya",
                  contact: "01-6610648",
                ),
                Card(
                  title: "Changu Primary Health Care",
                  contact: "9849424813",
                ),
                Card(
                  title: "Chayamasingh Janaswasthaya",
                  contact: "01-6610317",
                ),
                Card(
                  title: "District Community Eye Center",
                  contact: "01-6618058",
                ),
                Card(
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

class Card extends StatelessWidget {
  Card({Key key, this.title, this.contact}) : super(key: key);
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
          subtitle: Text(
            this.contact,
            style: TextStyle(fontSize: 16),
          ),
          trailing: Icon(
            FontAwesomeIcons.phone,
            color: Colors.green,
          ),
          onTap: () {
            print('Contact ');
            _makePhoneCall('tel:' + this.contact);
          },
        ),
      ),
    );
  }
}
