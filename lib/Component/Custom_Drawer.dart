// import 'package:KhCE/Views/Enquiry.dart';
// import 'package:KhCE/Views/Fee.dart';
// import 'package:KhCE/Views/Map.dart';
// import 'package:KhCE/Views/Panaroma.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:KhCE/Views/Scholarship.dart';
// import 'package:KhCE/Views/KhwopaCircle.dart';
// import 'package:KhCE/Views/AboutDeveloper.dart';
import 'package:emergencyBhaktapur/Views/AboutDeveloper.dart';

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;
  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).cardColor,
        width: mediaQuery.size.width * 0.60,
        height: mediaQuery.size.height,
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                closeDrawer();
              },
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/ambulance.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    height: 150,
                    decoration: BoxDecoration(color: Colors.black38),
                  )
                ],
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutDeveloper()));
              },
              leading: Icon(
                Icons.code,
                color: Colors.blue[700],
              ),
              title: Text("About Developer"),
            ),
            ListTile(
              onTap: () {
                SystemNavigator.pop();
              },
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.blue[800],
              ),
              title: Text("Exit"),
            ),
          ],
        ),
      ),
    );
  }
}
