import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String>? uniqueList(List<String> listcity) {
  // null safety
  listcity ??= [];

// Create a Set from the input list
  Set<String> uniqueSet = Set<String>.from(listcity);

  // Convert the Set back to a List
  List<String> uniqueList = uniqueSet.toList();
  uniqueList.sort((a, b) => a.compareTo(b));

  return uniqueList;
}

List<ServicesRecord>? shuffleList(
  List<ServicesRecord>? data,
  bool isStatus,
) {
  data ??= [];

// Shuffle the list
  if (isStatus) {
    final random = math.Random();
    data.shuffle(random);
  }

  return data;
}

List<CategoryRecord> customSreachCategory(
  String query,
  List<CategoryRecord> listdata,
) {
  List<CategoryRecord> filteredData = listdata.where((doc) {
    String normalizedString =
        doc.search.toLowerCase().trim().replaceAll(RegExp(r'\s+'), ' ');
    String normalizedQuery =
        query.toLowerCase().trim().replaceAll(RegExp(r'\s+'), ' ');

    List<String> wordsList = normalizedString.split(" ");
    List<String> queryWords = normalizedQuery.split(" ");

    return queryWords.every((word) => wordsList.any((w) => w.contains(word)));
  }).toList();
  return filteredData;
}

List<ServicesRecord> loadMore(List<ServicesRecord> list) {
  return list;
}

List<ServicesRecord> customSreach(
  String query,
  List<ServicesRecord> listdata,
) {
  List<ServicesRecord> filteredData = listdata.where((doc) {
    String normalizedString =
        doc.search.toLowerCase().trim().replaceAll(RegExp(r'\s+'), ' ');
    String normalizedQuery =
        query.toLowerCase().trim().replaceAll(RegExp(r'\s+'), ' ');

    List<String> wordsList = normalizedString.split(" ");
    List<String> queryWords = normalizedQuery.split(" ");

    return queryWords.every((word) => wordsList.any((w) => w.contains(word)));
  }).toList();
  return filteredData;
}

int? countServicesView(List<int> pageView) {
  if (pageView.isNotEmpty) {
    int sum = 0;
    for (int view in pageView) {
      sum = sum + view;
    }
    return sum;
  }
  return 0;
}

String timeAgo(DateTime date) {
  Duration difference = DateTime.now().difference(date);

  if (difference.inMinutes < 1) {
    return "تازە تۆمارکراوە";
  } else if (difference.inMinutes < 60) {
    return "${difference.inMinutes} خولەکە تۆمارکراوە";
  } else if (difference.inHours < 24) {
    return "${difference.inHours} کاتژمێرە تۆمارکراوە";
  } else {
    return "${difference.inDays} ڕۆژە تۆمارکراوە";
  }
}

String latLngToString(LatLng latlng) {
  return '${latlng.latitude},${latlng.longitude}';
}

bool isButtonDisabled(DateTime? clickTime) {
  if (clickTime == null) return false;

  final now = DateTime.now().millisecondsSinceEpoch;
  final diff = now - clickTime.millisecondsSinceEpoch;

  const duration24Hours = 24 * 60 * 60 * 1000; // in milliseconds

  return diff < duration24Hours;
}

int getRemainingMillis(DateTime? clickTime) {
  if (clickTime == null) {
    // No click stored = no wait
    return 0;
  }

  final now = DateTime.now().millisecondsSinceEpoch;
  final expiry = clickTime.millisecondsSinceEpoch + 86400000; // 24 hours in ms
  final remaining = expiry - now;

  return remaining > 0 ? remaining : 0;
}
