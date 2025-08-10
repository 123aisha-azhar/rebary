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

import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:flutter/foundation.dart';

Future initializeInAppMessaging() async {
  // Add your function code here!
  try {
    // Add platform check
    if (!kIsWeb) {
      // Only run on mobile platforms
      final fiam = FirebaseInAppMessaging.instance;
      await fiam.setMessagesSuppressed(false);
      debugPrint('In-App Messaging initialized successfully');
    } else {
      debugPrint('In-App Messaging not supported on web platform');
    }
  } catch (e) {
    debugPrint('Error initializing In-App Messaging: $e');
    // Log the full error details
    debugPrint(e.toString());
  }
}
