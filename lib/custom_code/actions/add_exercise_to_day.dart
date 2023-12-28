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

Future addExerciseToDay(
  String programId,
  int weekIndex,
  int dayIndex,
  ProgramExercisesStruct exercise,
) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  // Get a reference to the program document using programId
  final DocumentReference programRef =
      firestore.collection('programs').doc(programId);
  try {
    // Fetch the program document
    final DocumentSnapshot programSnapshot = await programRef.get();

    if (programSnapshot.exists) {
      // Get the 'weeks' array from the program document
      List<dynamic> weeks = programSnapshot.get('weeks');

      if (weeks != null && weekIndex >= 0 && weekIndex < weeks.length) {
        // Get the 'days' array for the specified week
        List<dynamic> days = weeks[weekIndex]['days'];

        if (days != null && dayIndex >= 0 && dayIndex < days.length) {
          // Add the new exercise to the end of the 'exercises' array for the specified day
          days[dayIndex]['exercises'].add(exercise.toMap());

          // Update the Firestore document with the modified 'weeks' array
          await programRef.update({
            'weeks': weeks,
          });
        }
      }
    } else {
      // Handle the case where the program document doesn't exist
      print('Program document with ID $programId does not exist.');
    }
  } catch (e) {
    // Handle any errors that occur during the update process
    print('Error updating program document: $e');
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
