import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
class Bhaktapur extends StatefulWidget {
  @override
  _BhaktapurState createState() => _BhaktapurState();
}

class _BhaktapurState extends State<Bhaktapur> {
  FSBStatus drawerStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 30,
          child: Text("Bhaktapur Municipality"),
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
                  title: "Bhaktapur Municipality",
                  contact: "01-6610310",
                ),
                Card(
                  title: "Ward 1, Bhaktapur Municipality",
                  contact: "01-6612124",
                ),
                Card(
                  title: "Ward 2, Bhaktapur Municipality",
                  contact: "01-6612161",
                ),
                Card(
                  title: "Ward 3, Bhaktapur Municipality",
                  contact: "01-6613110",
                ),
                Card(
                  title: "Ward 4, Bhaktapur Municipality",
                  contact: "01-6612183",
                ),
                Card(
                  title: "Ward 5, Bhaktapur Municipality",
                  contact: "01-6612162",
                ),
                Card(
                  title: "Ward 6, Bhaktapur Municipality",
                  contact: "01-6612159",
                ),
                Card(
                  title: "Ward 7, Bhaktapur Municipality",
                  contact: "01-6612132",
                ),
                Card(
                  title: "Ward 8, Bhaktapur Municipality",
                  contact: "01-5122281",
                ),
                Card(
                  title: "Ward 9, Bhaktapur Municipality",
                  contact: "01-6612165",
                ),
                Card(
                  title: "Ward 10, Bhaktapur Municipality",
                  contact: "01-6612139",
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
