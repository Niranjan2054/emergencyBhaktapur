// import 'package:KhCE/Views/Contact.dart';
// import 'package:KhCE/Views/Department.dart';
// import 'package:KhCE/Views/Facilities.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:move_to_background/move_to_background.dart';
import 'package:emergencyBhaktapur/Component/Button_Navigation_Bar.dart' as bnb;
import 'package:emergencyBhaktapur/Views/Ambulance.dart';
// import 'package:KhCE/Views/Welcome.dart';
// import 'Notice.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        MoveToBackground.moveTaskToBack();
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: bnb.BottomNavigationBar(
          bottomNavigationKey: _bottomNavigationKey,
          pageController: _pageController,
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            final CurvedNavigationBarState navBarState =
                _bottomNavigationKey.currentState;
            navBarState.setPage(index);
          },
          children: <Widget>[
            Ambulance(),
            Ambulance(),
            Ambulance(),
            Ambulance(),
            Ambulance(),
          ],
        ),
      ),
    );
  }
}
