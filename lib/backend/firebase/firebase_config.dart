import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBUF9wmTR5D5jYODPvWnjrpk7urBibbnSg",
            authDomain: "rebary-d7b28.firebaseapp.com",
            projectId: "rebary-d7b28",
            storageBucket: "rebary-d7b28.firebasestorage.app",
            messagingSenderId: "627200581002",
            appId: "1:627200581002:web:9b5f3c8123a64b08153c73",
            measurementId: "G-G13EM9D3BR"));
  } else {
    await Firebase.initializeApp();
  }
}
