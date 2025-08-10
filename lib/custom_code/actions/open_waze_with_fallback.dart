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

import 'package:url_launcher/url_launcher.dart';

Future openWazeWithFallback(LatLng latlng) async {
  // Add your function code here!
  double lat = latlng.latitude;
  double lng = latlng.longitude;
  final wazeAppUrl = Uri.parse('waze://?ll=$lat,$lng&navigate=yes');
  final wazeWebUrl = Uri.parse('https://waze.com/ul?ll=$lat,$lng&navigate=yes');

  // Try to launch Waze app
  if (await canLaunchUrl(wazeAppUrl)) {
    await launchUrl(wazeAppUrl, mode: LaunchMode.externalApplication);
  } else {
    // Open Waze in browser as fallback
    await launchUrl(wazeWebUrl, mode: LaunchMode.externalApplication);
  }
}
