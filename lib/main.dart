import 'package:emergencyBhaktapur/Process/APIRequest.dart';
import 'package:flutter/material.dart';
import 'Views/Home.dart';
import 'package:emergencyBhaktapur/Views/Home.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  APIRequest apiRequest1 = new APIRequest(st: 'ambulance',apiUrl: 'https://raw.githubusercontent.com/Niranjan2054/emergencyBhaktapur/version_one/data/ambulance.php');
  APIRequest apiRequest2 = new APIRequest(st: 'hospital',apiUrl: 'https://raw.githubusercontent.com/Niranjan2054/emergencyBhaktapur/version_one/data/hospital.php');
  APIRequest apiRequest3 = new APIRequest(st: 'fireBrigade',apiUrl: 'https://raw.githubusercontent.com/Niranjan2054/emergencyBhaktapur/version_one/data/fireBrigade.php');
  APIRequest apiRequest4 = new APIRequest(st: 'police',apiUrl: 'https://raw.githubusercontent.com/Niranjan2054/emergencyBhaktapur/version_one/data/police.php');
  APIRequest apiRequest5 = new APIRequest(st: 'sabbahan',apiUrl: 'https://raw.githubusercontent.com/Niranjan2054/emergencyBhaktapur/version_one/data/sabbahan.php');
  APIRequest apiRequest6 = new APIRequest(st: 'bhaktapur',apiUrl: 'https://raw.githubusercontent.com/Niranjan2054/emergencyBhaktapur/version_one/data/bhaktapur.php');
  APIRequest apiRequest7 = new APIRequest(st: 'changu',apiUrl: 'https://raw.githubusercontent.com/Niranjan2054/emergencyBhaktapur/version_one/data/changu.php');
  APIRequest apiRequest8 = new APIRequest(st: 'thimi',apiUrl: 'https://raw.githubusercontent.com/Niranjan2054/emergencyBhaktapur/version_one/data/thimi.php');
  APIRequest apiRequest9 = new APIRequest(st: 'suryabinayak',apiUrl: 'https://raw.githubusercontent.com/Niranjan2054/emergencyBhaktapur/version_one/data/suryabinayak.php');
  APIRequest apiRequest10= new APIRequest(st: 'covid',apiUrl: 'https://raw.githubusercontent.com/Niranjan2054/emergencyBhaktapur/version_one/data/covid.php');
  APIRequest apiRequest11= new APIRequest(st: 'office',apiUrl: 'https://raw.githubusercontent.com/Niranjan2054/emergencyBhaktapur/version_one/data/office.php');
  APIRequest apiRequest12= new APIRequest(st: 'blood',apiUrl: 'https://raw.githubusercontent.com/Niranjan2054/emergencyBhaktapur/version_one/data/blood.php');
  @override
  Widget build(BuildContext context) {
    apiRequest1.getData();
    apiRequest2.getData();
    apiRequest3.getData();
    apiRequest4.getData();
    apiRequest5.getData();
    apiRequest6.getData();
    apiRequest7.getData();
    apiRequest8.getData();
    apiRequest9.getData();
    apiRequest10.getData();
    apiRequest11.getData();
    apiRequest12.getData();
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
