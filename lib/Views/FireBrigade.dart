import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:emergencyBhaktapur/Component/Custom_Drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
class FireBrigade extends StatefulWidget {
  @override
  _FireBrigadeState createState() => _FireBrigadeState();
}

class _FireBrigadeState extends State<FireBrigade> {
  FSBStatus drawerStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 30,
          child: Text("Fire Brigade"),
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
                  title: "Fire Brigade",
                  contact: "101",
                ),
                Card(
                  title: "Bhaktapur",
                  contact: "01-6610649",
                ),
                Card(
                  title: "Kathmandu",
                  contact: "01-4221177",
                ),
                Card(
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
