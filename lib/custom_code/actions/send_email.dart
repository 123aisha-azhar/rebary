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

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future<String> sendEmail(
  String receiver,
  String subject,
  String senderEmail,
  String senderPassword,
  String body,
) async {
  String username = senderEmail;
  String password = senderPassword;

  final smtpServer = gmail(username, password);
  // Create our message.
  final message = Message()
    ..from = Address(username, 'Rebary')
    ..recipients.add(receiver)
    ..subject = subject
    ..text = body
    ..html = "<p>$body<p>";
  try {
    final sendReport = await send(message, smtpServer);
    return "سکاڵاکەت وەرگیرا سوپاس";
  } on MailerException catch (e) {
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
    return "سکاڵا نەگەیشت دووبارە هەوڵبدە";
  }
}
