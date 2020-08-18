import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:emergencyBhaktapur/Views/Bhaktapur.dart';
import 'package:emergencyBhaktapur/Views/SuryaBinayak.dart';
import 'package:emergencyBhaktapur/Views/Changu.dart';
import 'package:emergencyBhaktapur/Views/Thimi.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:emergencyBhaktapur/Component/Municipality_Button_Navigation_Bar.dart'
    as bnb;

class Municipality extends StatefulWidget {
  @override
  _MunicipalityState createState() => _MunicipalityState();
}

class _MunicipalityState extends State<Municipality> {
  GlobalKey _bottomNavigationKey = GlobalKey();
  PageController _pageController;
  int current_page = 0;

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
    return SwipeDetector(
      onSwipeLeft: () {
        if (current_page < 3) {
          current_page++;
        }
        _pageController.jumpToPage(current_page);
      },
      onSwipeRight: () {
        if (current_page > 0) {
          current_page--;
        }
        _pageController.jumpToPage(current_page);
      },
      swipeConfiguration:
          SwipeConfiguration(horizontalSwipeMinDisplacement: 75),
      child: Scaffold(
        bottomNavigationBar: bnb.BottomNavigationBar(
          bottomNavigationKey: _bottomNavigationKey,
          pageController: _pageController,
        ),
        body: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            current_page = index;
            final CurvedNavigationBarState navBarState =
                _bottomNavigationKey.currentState;
            navBarState.setPage(index);
          },
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Bhaktapur(),
            Changu(),
            Thimi(),
            SuryaBinayak(),
          ],
        ),
      ),
    );
  }
}
