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
import 'dart:io';

Future openGoogleMapWithFallback(LatLng latlng) async {
  // Add your function code here!
  double lat = latlng.latitude;
  double lng = latlng.longitude;
  final appleMapsUrl = Uri.parse("http://maps.apple.com/?daddr=$lat,$lng");
  final googleMapsAppUrl =
      Uri.parse("comgooglemaps://?daddr=$lat,$lng&directionsmode=driving");
  final googleMapsWebUrl =
      Uri.parse("https://www.google.com/maps/dir/?api=1&destination=$lat,$lng");

  if (Platform.isIOS) {
    // Try opening Google Maps app
    if (await canLaunchUrl(googleMapsAppUrl)) {
      await launchUrl(googleMapsAppUrl);
    } else {
      // Open in Apple Maps or Google Maps web if app is not installed
      if (await canLaunchUrl(appleMapsUrl)) {
        await launchUrl(appleMapsUrl);
      } else {
        await launchUrl(googleMapsWebUrl);
      }
    }
  } else {
    // On Android, just open Google Maps app or browser
    if (await canLaunchUrl(googleMapsWebUrl)) {
      await launchUrl(googleMapsWebUrl, mode: LaunchMode.externalApplication);
    }
  }
}
