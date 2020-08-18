import 'package:emergencyBhaktapur/Component/Phone_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:emergencyBhaktapur/Component/Custom_Drawer.dart';

class SabBahan extends StatefulWidget {
  @override
  _SabBahanState createState() => _SabBahanState();
}

class _SabBahanState extends State<SabBahan> {
  FSBStatus drawerStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 30,
          child: Text("Sab Bahan"),
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
                PhoneCard(
                  title: "Bhaktapur",
                  contact: "01-6613200",
                ),
                PhoneCard(
                  title: "Bhaktapur Cancer Hospital",
                  contact: "9860171552",
                ),
                PhoneCard(
                  title: "Bir Hospital",
                  contact: "01-4221119",
                ),
                PhoneCard(
                  title: "Devdol Samaj",
                  contact: "9818569351",
                ),
                PhoneCard(
                  title: "Red Cross Thimi ",
                  contact: "9849170256",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
