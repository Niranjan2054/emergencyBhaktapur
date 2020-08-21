import 'dart:convert';
import 'package:emergencyBhaktapur/Process/Storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:emergencyBhaktapur/Component/Custom_Drawer.dart';
import 'package:emergencyBhaktapur/Component/ContactCard.dart';

class FireBrigade extends StatefulWidget {
  @override
  _FireBrigadeState createState() => _FireBrigadeState();
}

class _FireBrigadeState extends State<FireBrigade> {
  Storage storage = new Storage('db');
  FSBStatus drawerStatus;
  int length = 0;
  List jsonFire;

  void getData() async {
    storage.readData().then((String value) {
      setState(() {
        print(value);
        this.jsonFire=jsonDecode(value);
        this.length = jsonFire.length;
        print(this.length);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 30,
          child: Text("Notice"),
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
        screenContents: Container(
          width: MediaQuery.of(context).size.width - 20,
          margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: ListView.builder(
            itemCount: this.length,
            itemBuilder: (BuildContext context, int index) {
              if (this.length != 0) {
                if ((this.jsonFire[index]['contact'] != "" &&
                        this.jsonFire[index]['contact'] != null) &&
                    (this.jsonFire[index]['title'] != "" &&
                        this.jsonFire[index]['title'] != null)) {
                  return ContactCard(
                    title: this.jsonFire[index]['title'],
                    title_nep: this.jsonFire[index]['title_nep'],
                    contact: this.jsonFire[index]['contact'],
                    contact_nep: this.jsonFire[index]['contact_nep'],
                  );
                } else {
                  return SizedBox(
                    height: 0,
                  );
                }
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
