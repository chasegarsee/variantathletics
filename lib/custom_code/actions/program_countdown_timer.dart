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

Future<String> programCountdownTimer(
    DateTime currentTime, DateTime liveDate) async {
  if (currentTime.isAfter(liveDate)) {
    return "0w:0d:0h:0m:0s";
  }

  while (currentTime.isBefore(liveDate)) {
    Duration timeDifference = liveDate.difference(currentTime);

    int weeks = timeDifference.inDays ~/ 7;
    int days = timeDifference.inDays % 7;
    int hours = timeDifference.inHours % 24;
    int minutes = timeDifference.inMinutes % 60;
    int seconds = timeDifference.inSeconds % 60;

    String formattedTime =
        "$weeks weeks, $days days, $hours hours, $minutes minutes, $seconds seconds";

    // Print the formatted time or update your UI as needed
    print(formattedTime);

    if (currentTime.isBefore(liveDate)) {
      await Future.delayed(Duration(seconds: 1));
      currentTime = DateTime.now();
    } else {
      return "0w:0d:0h:0m:0s";
    }
  }

  return "0w:0d:0h:0m:0s"; // This line is just for completeness; the loop should return earlier when currentTime is after liveDate.
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
