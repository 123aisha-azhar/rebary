// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<void> delayedNavigation(BuildContext context) async {
  await Future.delayed(Duration(seconds: 3));
  // Navigate to the home page or any page you want
  context.pushReplacementNamed('home');
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
