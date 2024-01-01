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

Future<DaysStruct> addDayToWeek(String programId, int weekIndex, String name,
    DateTime date, int exerciseCount, String weekId) async {
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

    // Get the weeks data from the program data.
    List<dynamic> weeks = programData['weeks'];

    if (weekIndex >= 0 && weekIndex < weeks.length) {
      // Create a new day object.
      DaysStruct newDay = DaysStruct(
        day: weeks[weekIndex]['days'].length + 1,
        id: '$weekId-${weeks[weekIndex]['days'].length + 1}',
        name: name,
        date: date,
        exercises: List.generate(
            exerciseCount,
            (index) => ProgramExercisesStruct(
                  id: '',
                  name: '',
                  reps: '',
                  restTime: '',
                  sets: '',
                  tempo: '',
                  workTime: '',
                )),
      );

      // Add the new day to the specified week.
      (weeks[weekIndex]['days'] as List).add({
        'day': newDay.day,
        'date': newDay.date,
        'id': newDay.id,
        'name': newDay.name,
        'exercises': newDay.exercises
            .map((e) => {
                  'id': e.id,
                  'name': e.name,
                  'reps': e.reps,
                  'restTime': e.restTime,
                  'sets': e.sets,
                  'tempo': e.tempo,
                  'workTime': e.workTime,
                })
            .toList(),
      });

      // Update the Firestore document with the modified data.
      await programDoc.update({'weeks': weeks});

      // Return the newly created DaysStruct object.
      return newDay;
    } else {
      throw Exception('Invalid weekIndex');
    }
  } catch (e) {
    print('Error adding day to Firestore: $e');
    throw e;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
