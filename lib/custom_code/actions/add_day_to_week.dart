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

Future<DaysStruct> addDayToWeek(String programId, int weekIndex,
    int exerciseCount, String name, DateTime date) async {
  // Reference to your Firestore collection
  CollectionReference programsCollection =
      FirebaseFirestore.instance.collection('programs');

  try {
    // Retrieve the program document
    DocumentSnapshot programDoc = await programsCollection.doc(programId).get();

    if (!programDoc.exists) {
      throw Exception('Program does not exist');
    }

    // Get the weeks data from the program document, casting it to the expected type
    List<dynamic> weeks = (programDoc.data() as Map<String, dynamic>)['weeks'];

    if (weekIndex < 0 || weekIndex >= weeks.length) {
      throw Exception('Invalid weekIndex');
    }

    // Create a list of ProgramsExercisesStruct
    List<ProgramExercisesStruct> exercisesList = List.generate(
        exerciseCount,
        (index) => ProgramExercisesStruct(
              id: '',
              name: '',
              reps: '',
              restTime: '',
              sets: '',
              tempo: '',
              workTime: '',
            ));

    // Create a new DaysStruct object with the exercises list
    DaysStruct newDay = DaysStruct(
      day: weeks[weekIndex]['days'].length + 1, // Increment day number
      id: '$programId-$weekIndex-${weeks[weekIndex]['days'].length + 1}', // Create a unique day ID
      name: name,
      date: date,
      exercises: exercisesList,
    );

    // Add the new day to the days array in the specified week
    weeks[weekIndex]['days'].add(newDay);

    // Update the Firestore document with the modified data
    await programsCollection.doc(programId).update({'weeks': weeks});

    // Return the newly created DaysStruct object
    return newDay;
  } catch (error) {
    print('Error adding new day: $error');
    throw error;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
