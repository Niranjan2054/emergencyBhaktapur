import 'package:emergencyBhaktapur/Process/APIRequest.dart';
import 'package:flutter/material.dart';
import 'Views/Home.dart';
import 'package:emergencyBhaktapur/Views/Home.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  APIRequest apiRequest1 = new APIRequest(st: 'ambulance',apiUrl: 'http://neofusionsoc.com/dataEmergency/ambulance');
  APIRequest apiRequest2 = new APIRequest(st: 'hospital',apiUrl: 'http://neofusionsoc.com/dataEmergency/hospital');
  APIRequest apiRequest3 = new APIRequest(st: 'fireBrigade',apiUrl: 'http://neofusionsoc.com/dataEmergency/fireBrigade');
  APIRequest apiRequest4 = new APIRequest(st: 'police',apiUrl: 'http://neofusionsoc.com/dataEmergency/police');
  APIRequest apiRequest5 = new APIRequest(st: 'sabbahan',apiUrl: 'http://neofusionsoc.com/dataEmergency/sabbahan');
  APIRequest apiRequest6 = new APIRequest(st: 'bhaktapur',apiUrl: 'http://neofusionsoc.com/dataEmergency/bhaktapur');
  APIRequest apiRequest7 = new APIRequest(st: 'changu',apiUrl: 'http://neofusionsoc.com/dataEmergency/changu');
  APIRequest apiRequest8 = new APIRequest(st: 'thimi',apiUrl: 'http://neofusionsoc.com/dataEmergency/thimi');
  APIRequest apiRequest9 = new APIRequest(st: 'suryabinayak',apiUrl: 'http://neofusionsoc.com/dataEmergency/suryabinayak');
  APIRequest apiRequest10= new APIRequest(st: 'covid',apiUrl: 'http://neofusionsoc.com/dataEmergency/covid');
  APIRequest apiRequest11= new APIRequest(st: 'office',apiUrl: 'http://neofusionsoc.com/dataEmergency/office');
  APIRequest apiRequest12= new APIRequest(st: 'blood',apiUrl: 'http://neofusionsoc.com/dataEmergency/blood');
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
