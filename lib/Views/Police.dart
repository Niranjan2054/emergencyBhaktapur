import 'package:emergencyBhaktapur/Component/Phone_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:emergencyBhaktapur/Component/Custom_Drawer.dart';
import 'package:emergencyBhaktapur/Views/PoliceMaps.dart';

class Police extends StatefulWidget {
  @override
  _PoliceState createState() => _PoliceState();
}

class _PoliceState extends State<Police> {
  FSBStatus drawerStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 30,
          child: Text("Police"),
        ),
        actions: <Widget>[
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
                  title: "Police",
                  contact: "100",
                ),
                PhoneCard(
                  title: "Mahanagariya Prahari Parisar -Bhaktapur ",
                  contact: "9851283020",
                ),
                PhoneCard(
                  title: "Mahanagariya Prahari Parisar -Bhaktapur (Notice)",
                  contact: "9851114821",
                ),
                PhoneCard(
                  title: "Mahanagariya Prahari Bit, Thimi",
                  contact: "9851283599",
                ),
                PhoneCard(
                  title: "Mahanagariya Prahari Bit, Jagati",
                  contact: "9851283028",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
