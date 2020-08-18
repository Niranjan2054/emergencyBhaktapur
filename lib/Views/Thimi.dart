import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
class Thimi extends StatefulWidget {
  @override
  _ThimiState createState() => _ThimiState();
}

class _ThimiState extends State<Thimi> {
  FSBStatus drawerStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 30,
          child: Text("Madhayapur Thimi Municipality"),
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
                  title: "Madhayapur Thimi Municipality",
                  contact: "+9770715555556",
                ),
                Card(
                  title: "Ward 1, Madhayapur Thimi Municipality",
                  contact: "01-6630472",
                ),
                Card(
                  title: "Ward 2, Madhayapur Thimi Municipality",
                  contact: "01-6639428",
                ),
                Card(
                  title: "Ward 3, Madhayapur Thimi Municipality",
                  contact: "01-6633150",
                ),
                Card(
                  title: "Ward 4, Madhayapur Thimi Municipality",
                  contact: "01-6630575",
                ),
                Card(
                  title: "Ward 5, Madhayapur Thimi Municipality",
                  contact: "01-6635470",
                ),
                Card(
                  title: "Ward 6, Madhayapur Thimi Municipality",
                  contact: "01-6630515",
                ),
                Card(
                  title: "Ward 7, Madhayapur Thimi Municipality",
                  contact: "01-6630192",
                ),
                Card(
                  title: "Ward 8, Madhayapur Thimi Municipality",
                  contact: "01-6631357",
                ),
                Card(
                  title: "Ward 9, Madhayapur Thimi Municipality",
                  contact: "01-5144500",
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
