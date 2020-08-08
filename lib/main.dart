// import 'package:KhCE/Views/Enquiry.dart';
// import 'package:KhCE/Views/KhwopaCircle.dart';
// import 'package:KhCE/Views/Panaroma.dart';
import 'package:flutter/material.dart';
import 'Views/Home.dart';
import 'package:emergencyBhaktapur/Views/Home.dart';
void main() {
  runApp(MyApp());
}

Map<int, Color> color = {
  50: Color.fromRGBO(19, 54, 153, .1),
  100: Color.fromRGBO(19, 54, 153, .2),
  200: Color.fromRGBO(19, 54, 153, .3),
  300: Color.fromRGBO(19, 54, 153, .4),
  400: Color.fromRGBO(19, 54, 153, .5),
  500: Color.fromRGBO(19, 54, 153, .6),
  600: Color.fromRGBO(19, 54, 153, .7),
  700: Color.fromRGBO(19, 54, 153, .8),
  800: Color.fromRGBO(19, 54, 153, .9),
  900: Color.fromRGBO(19, 54, 153, 1),
};
MaterialColor AppThemeColor = MaterialColor(0xFF133699, color);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emergency Bhaktapur',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        body: Home(),
      ),
      // routes: <String, WidgetBuilder>{
      //   '/enquiry': (BuildContext context) => Enquiry(),
      //   '/college_view': (BuildContext context) => Panaroma(),
      //   '/khwopa_circle': (BuildContext context) => KhwopaCircle(),
      // },
    );
  }
}
