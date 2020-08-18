import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
class Changu extends StatefulWidget {
  @override
  _ChanguState createState() => _ChanguState();
}

class _ChanguState extends State<Changu> {
  FSBStatus drawerStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 30,
          child: Text("Changu Narayan Municipality"),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width - 20,
            margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Card(
                  title: "Changu Narayan Municipality",
                  contact: "01-6610310",
                ),
                Card(
                  title: "Ward 1, Changu Narayan Municipality",
                  contact: "01-6610649",
                ),
                Card(
                  title: "Ward 2, Changu Narayan Municipality",
                  contact: "01-6610649",
                ),
                Card(
                  title: "Ward 3, Changu Narayan Municipality",
                  contact: "01-6610649",
                ),
                Card(
                  title: "Ward 4, Changu Narayan Municipality",
                  contact: "01-6610649",
                ),
                Card(
                  title: "Ward 5, Changu Narayan Municipality",
                  contact: "01-6610649",
                ),
                Card(
                  title: "Ward 6, Changu Narayan Municipality",
                  contact: "01-6610649",
                ),
                Card(
                  title: "Ward 7, Changu Narayan Municipality",
                  contact: "01-6610649",
                ),
                Card(
                  title: "Ward 8, Changu Narayan Municipality",
                  contact: "01-6610649",
                ),
                Card(
                  title: "Ward 9, Changu Narayan Municipality",
                  contact: "01-6610649",
                ),
                Card(
                  title: "Ward 10, Changu Narayan Municipality",
                  contact: "01-6610649",
                ),
              ],
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
          trailing: Icon(FontAwesomeIcons.phone, color: Colors.green,),
          onTap: () {
            print('Contact ');
            _makePhoneCall('tel:'+this.contact);
          },
        ),
      ),
    );
  }
}
