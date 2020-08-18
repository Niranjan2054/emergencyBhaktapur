import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
class Office extends StatefulWidget {
  @override
  _OfficeState createState() => _OfficeState();
}

class _OfficeState extends State<Office> {
  FSBStatus drawerStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 30,
          child: Text("Government Office"),
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
                  title: "Bhaktapur Administration Office(CDO)",
                  contact: "01-6614437",
                ),
                Card(
                  title: "Bhaktapur District Court",
                  contact: "01-6620673",
                ),
                Card(
                  title: "District Co-ordination Committee Office, Bhaktapur",
                  contact: "01-6610970",
                ),
                Card(
                  title: "District Development Committee Office, Bhaktapur",
                  contact: "01-6614826",
                ),
                Card(
                  title: "District Election Office, Bhaktapur",
                  contact: "01-6614525",
                ),
                Card(
                  title: "District ayuktiko Office, Bhaktapur",
                  contact: "01-6610123",
                ),
                Card(
                  title: "District Prabhidhik Office, Bhaktapur",
                  contact: "01-6614854",
                ),
                Card(
                  title: "Malpot Office, Bhaktapur",
                  contact: "01-6619936",
                ),
                Card(
                  title: "Ministry of Urban Development Central Level Project Implementation Unit, Bhaktapur",
                  contact: "01-6612775",
                ),
                Card(
                  title: "Transport Management Office, Bhaktapur",
                  contact: "01-6615211",
                ),
                Card(
                  title: "Nepal Electricity Authority Training Center , Kharipati",
                  contact: "01-6616660",
                ),
                Card(
                  title: "Nepal Electricity Authority Environment and Social Studies Department, Kharipati",
                  contact: "01-6611580",
                ),
                Card(
                  title: "Office of the Controller of Examinations, Sanothimi",
                  contact: "01-6630070",
                ),
                Card(
                  title: "CTEVT Exam Controller Office, Sanothimi",
                  contact: "01-6630408",
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
