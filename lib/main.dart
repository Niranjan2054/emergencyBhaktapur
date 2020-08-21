import 'package:emergencyBhaktapur/Process/APIRequest.dart';
import 'package:flutter/material.dart';
import 'Views/Home.dart';
import 'package:emergencyBhaktapur/Views/Home.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  APIRequest apiRequest1 = new APIRequest(st: 'fireBrigade',apiUrl: 'https://raw.githubusercontent.com/Niranjan2054/emergencyBhaktapur/version_one/data/fireBrigade.php?token=AHZ7Z55XFPSPQDOJUMXTZZ27H6CRA');
  APIRequest apiRequest2 = new APIRequest(st: 'police',apiUrl: 'http://neofusionsoc.com/police');
  APIRequest apiRequest3 = new APIRequest(st: 'sabbahan',apiUrl: 'http://neofusionsoc.com/sabbahan');
  APIRequest apiRequest4 = new APIRequest(st: 'sabbahan',apiUrl: 'http://neofusionsoc.com/sabbahan');
  @override
  Widget build(BuildContext context) {
    apiRequest1.getData();
    apiRequest2.getData();
    apiRequest3.getData();
    apiRequest4.getData();
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
