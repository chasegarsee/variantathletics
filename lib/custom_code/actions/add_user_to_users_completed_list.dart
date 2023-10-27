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

Future<void> addUserToUsersCompletedList(
    String workoutId, String uid, int exerciseIndex) async {
  try {
    // Reference to the workout document
    DocumentReference workoutRef =
        FirebaseFirestore.instance.collection('workouts').doc(workoutId);

    // Get the current exercises array
    DocumentSnapshot workoutSnapshot = await workoutRef.get();
    List<dynamic> exercisesArray = workoutSnapshot['exercises'];

    // Update the usersCompleted array within the specified exercise index
    //exercisesArray[exerciseIndex]['usersCompleted'].add(uid);

    // Update the entire exercises array in the document
    //await workoutRef.update({'exercises': exercisesArray});

// Get the usersCompleted array within the specified exercise index
    List<dynamic> usersCompletedArray =
        exercisesArray[exerciseIndex]['usersCompleted'];

    // Only add the current user's UID if it's not already present
    if (!usersCompletedArray.contains(uid)) {
      usersCompletedArray.add(uid);

      // Update the entire exercises array in the document
      await workoutRef.update({'exercises': exercisesArray});
    }
  } catch (error) {
    print("Error adding user to completed list: $error");
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the button on the right!
