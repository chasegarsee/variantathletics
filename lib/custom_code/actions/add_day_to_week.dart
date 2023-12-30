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

    // Get the 'weeks' field as a List<dynamic> explicitly
    List<dynamic> weeksData = (programDoc.data()['weeks'] as List<dynamic>);

    if (weekIndex < 0 || weekIndex >= weeksData.length) {
      throw Exception('Invalid weekIndex');
    }

    // Create a list of ProgramExercisesStruct
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

    // Create a new DaysStruct object
    DaysStruct newDay = DaysStruct(
      day: weeksData[weekIndex]['days'].length + 1, // Increment day number
      id: '$programId-$weekIndex-${weeksData[weekIndex]['days'].length + 1}', // Create a unique day ID
      name: name,
      date: date,
      exercises: exercisesList,
    );

    // Add the new day to the days array in the specified week
    (weeksData[weekIndex]['days'] as List).add({
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

    // Update the Firestore document with the modified data
    await programsCollection.doc(programId).update({'weeks': weeksData});

    // Return the newly created DaysStruct object
    return newDay;
  } catch (error) {
    print('Error adding new day: $error');
    throw error;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
