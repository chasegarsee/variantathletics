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

Future<void> deleteExerciseFromWorkout(
  String programId,
  int weekIndex,
  int dayIndex,
  int exerciseIndex,
) async {
  try {
    // Reference to the Firestore collection where you store your data.
    CollectionReference programsCollection =
        FirebaseFirestore.instance.collection('programs');

    // Get the document for the specified programId.
    DocumentReference programDoc = programsCollection.doc(programId);

    // Retrieve the program data.
    DocumentSnapshot programSnapshot = await programDoc.get();
    Map<String, dynamic> programData =
        programSnapshot.data() as Map<String, dynamic>;

    // Update the exercises array in the specified day by removing the exercise at the given index.
    List<dynamic> weeks = programData['weeks'];
    if (weekIndex >= 0 && weekIndex < weeks.length) {
      Map<String, dynamic> week = weeks[weekIndex] as Map<String, dynamic>;
      List<dynamic> days = week['days'];
      if (dayIndex >= 0 && dayIndex < days.length) {
        Map<String, dynamic> day = days[dayIndex] as Map<String, dynamic>;
        List<dynamic> exercises = day['exercises'];
        if (exerciseIndex >= 0 && exerciseIndex < exercises.length) {
          exercises.removeAt(exerciseIndex);

          // Update the Firestore document with the modified data.
          await programDoc.update({
            'weeks': weeks,
          });
        } else {
          throw Exception('Invalid exerciseIndex');
        }
      } else {
        throw Exception('Invalid dayIndex');
      }
    } else {
      throw Exception('Invalid weekIndex');
    }
  } catch (e) {
    print('Error deleting exercise from workout: $e');
    throw e; // Re-throw the exception if needed.
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
