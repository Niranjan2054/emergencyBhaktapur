import 'package:emergencyBhaktapur/Process/APIRequest.dart';
import 'package:flutter/material.dart';
import 'Views/Home.dart';
import 'package:emergencyBhaktapur/Views/Home.dart';
import 'globals.dart' as globals;
void main() {
  globals.isNepali = true;
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  APIRequest apiRequest = new APIRequest();
  @override
  Widget build(BuildContext context) {
    apiRequest.getData();
    return MaterialApp(
      title: 'Emergency Bhaktapur',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme:ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}
