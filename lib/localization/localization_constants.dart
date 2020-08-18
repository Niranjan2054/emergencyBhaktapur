import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:emergencyBhaktapur/localization/demo_localization.dart';

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).getTranslatedValue(key);
}
