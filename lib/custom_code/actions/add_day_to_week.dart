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

    // Get the weeks data from the program document
    List<dynamic> weeks = programDoc.data()['weeks'];

    if (weekIndex < 0 || weekIndex >= weeks.length) {
      throw Exception('Invalid weekIndex');
    }

    // Create a new day object
    Map<String, dynamic> newDay = {
      'day': weeks[weekIndex]['days'].length + 1, // Increment day number
      'id':
          '$programId-$weekIndex-${weeks[weekIndex]['days'].length + 1}', // Create a unique day ID
      'name': name,
      'date': Timestamp.fromDate(date),
      'exercises': List.generate(
          exerciseCount,
          (index) => {
                'id': '',
                'name': '',
                'reps': '',
                'restTime': '',
                'sets': '',
                'tempo': '',
                'workTime': '',
              }),
    };

    // Add the new day to the days array in the specified week
    weeks[weekIndex]['days'].add(newDay);

    // Update the Firestore document with the modified data
    await programsCollection.doc(programId).update({'weeks': weeks});

    // Create a DaysStruct object from the newly created day and return it
    DaysStruct daysStruct = DaysStruct(
      day: newDay['day'],
      id: newDay['id'],
      name: newDay['name'],
      date: newDay['date'].toDate(),
      exercises: newDay['exercises'],
    );

    return daysStruct;
  } catch (error) {
    print('Error adding new day: $error');
    throw error;
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
