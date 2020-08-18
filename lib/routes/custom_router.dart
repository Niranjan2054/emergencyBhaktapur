import 'package:emergencyBhaktapur/Views/Home.dart';
import 'package:emergencyBhaktapur/routes/route_names.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Route<dynamic> allRoutes(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Home());
    }
    return MaterialPageRoute(builder: (_) => Home());
  }
}
