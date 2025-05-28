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

String returnProfileGreeting(DateTime timestamp) {
  // return "morning" if it is morning, "afternoon" if afternoon and "night" if it is night
  var hour = timestamp.hour;
  if (hour >= 0 && hour < 12) {
    return "Good morning,";
  } else if (hour >= 12 && hour < 17) {
    return "Good afternoon,";
  } else {
    return "Goodnight,";
  }
}

int daysUntilExpiration(DateTime expirationDate) {
  final now = DateTime.now();
  final difference = expirationDate.difference(now);
  return difference.inDays;
}

Color getIngredientBackgroundColor(DateTime expirationDate) {
  final now = DateTime.now();
  final daysLeft = expirationDate.difference(now).inDays;

  if (daysLeft <= 3) {
    return const Color(0xFF8B0000); // dark red
  } else {
    return const Color(0xFF1E1E1E); // normal background
  }
}

String getExpirationText(DateTime expirationDate) {
  final now = DateTime.now();
  final daysLeft = expirationDate.difference(now).inDays;

  if (daysLeft > 0) {
    return '$daysLeft day${daysLeft == 1 ? '' : 's'} to expire';
  } else if (daysLeft == 0) {
    return 'Expires today';
  } else {
    return 'Expired';
  }
}

String newCustomFunction(List<InfoProductStruct> ingreditent) {
  return '[${ingreditent.map((item) => '"${item.toString()}"').join(',')}]';
}

String tostringFromstringlist(List<String> listo) {
  //
  return '[${listo.map((item) => '"$item"').join(',')}]';
}
