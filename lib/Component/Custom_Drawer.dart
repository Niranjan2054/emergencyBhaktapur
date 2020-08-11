import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:emergencyBhaktapur/Views/AboutDeveloper.dart';
import 'package:emergencyBhaktapur/Views/Policy.dart';
import 'package:emergencyBhaktapur/Views/Terms.dart';

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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Policy()));
              },
              leading: Icon(
                Icons.code,
                color: Colors.blue[700],
              ),
              title: Text("Privacy Policy"),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Terms()));
              },
              leading: Icon(
                Icons.code,
                color: Colors.blue[700],
              ),
              title: Text("Terms"),
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
