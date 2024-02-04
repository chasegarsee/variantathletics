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

Future<void> updateDayName(String programId, int weekIndex, int dayIndex,
    String name, DateTime? date) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  try {
    // Reference to the program document
    DocumentReference programRef =
        firestore.collection('programs').doc(programId);

    // Get the program data
    DocumentSnapshot programSnapshot = await programRef.get();

    if (programSnapshot.exists) {
      // Cast the "weeks" field as a List
      List<dynamic> weeks =
          (programSnapshot.data() as Map<String, dynamic>)['weeks'];

      if (weeks != null && weekIndex >= 0 && weekIndex < weeks.length) {
        // Access the target week using the weekIndex
        Map<String, dynamic> targetWeek = weeks[weekIndex];

        // Access the "days" field of the target week
        List<dynamic> days = targetWeek['days'];

        if (dayIndex >= 0 && dayIndex < days.length) {
          // Update the "name" field of the selected day
          days[dayIndex]['name'] = name;
          if (date != null) {
            days[dayIndex]['date'] = date;
          }

          // Update the Firestore document
          await programRef.update({'weeks': weeks});
        } else {
          throw Exception('Invalid dayIndex');
        }
      } else {
        throw Exception('Invalid weekIndex');
      }
    } else {
      throw Exception('Program not found');
    }
  } catch (e) {
    print('Error updating day name: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
