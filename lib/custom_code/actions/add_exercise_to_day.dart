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

Future<ProgramExercisesStruct> addExerciseToDay(
  String programId,
  int weekIndex,
  int dayIndex,
  ProgramExercisesStruct exercise,
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

    // Update the exercises array in the specified day.
    List<dynamic> weeks = programData['weeks'];
    if (weekIndex >= 0 && weekIndex < weeks.length) {
      Map<String, dynamic> week = weeks[weekIndex] as Map<String, dynamic>;
      List<dynamic> days = week['days'];
      if (dayIndex >= 0 && dayIndex < days.length) {
        Map<String, dynamic> day = days[dayIndex] as Map<String, dynamic>;
        List<dynamic> exercises = day['exercises'];
        exercises.add({
          'id': exercise.id,
          'name': exercise.name,
          'reps': exercise.reps,
          'restTime': exercise.restTime,
          'sets': exercise.sets,
          'tempo': exercise.tempo,
          'workTime': exercise.workTime,
        });

        // Update the Firestore document with the modified data.
        await programDoc.update({
          'weeks': weeks,
        });
        return ProgramExercisesStruct(
          id: exercise.id,
          name: exercise.name,
          reps: exercise.reps,
          restTime: exercise.restTime,
          sets: exercise.sets,
          tempo: exercise.tempo,
          workTime: exercise.workTime,
        );
      } else {
        throw Exception('Invalid Day Index');
      }
    } else {
      throw Exception('Invalid Week Index');
    }
  } catch (e) {
    print('Error adding exercise to Firestore: $e');
  }
  return ProgramExercisesStruct(
    id: '',
    name: '',
    reps: '',
    restTime: '',
    sets: '',
    tempo: '',
    workTime: '',
  );
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
