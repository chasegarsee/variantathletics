import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic convertFBPUserToJSON(UsersRecord usersDoc) {
  return {
    'completedWorkouts': usersDoc.completedWorkouts,
    'currentProgramId': usersDoc.currentProgramId,
    'email': usersDoc.email,
    'isCoach': usersDoc.isCoach,
    'uid': usersDoc.uid,
  };
}

List<dynamic>? convertFBProgramToJSONCopy(List<ProgramsRecord>? programsDoc) {
  programsDoc ??= [];
  List<Map<String, dynamic>> programsJson = programsDoc.map((program) {
    return {
      'color': program.color,
      'createdAt': program.createdAt,
      'description': program.description,
      'id': program.id,
      'isDailyWorkout': program.isDailyWorkout,
      'isLive': program.isLive,
      'length': program.length,
      'programPhotoUrl': program.programPhotoUrl,
      'name': program.name,
    };
  }).toList();

  return programsJson;
}

List<dynamic>? convertFBWorkoutToJSON(List<WorkoutsRecord>? workoutDoc) {
  workoutDoc ??= [];
  List<Map<String, dynamic>> workoutsJson = workoutDoc.map((workout) {
    return {
      'date': workout.date,
      'description': workout.description,
      'exercises': workout.exercises,
      'isRestDay': workout.isRestDay,
      'name': workout.name,
      'programId': workout.programId,
      'schedule': workout.schedule,
      'week': workout.schedule.week,
      'day': workout.schedule.day,
      'workoutIndex': workout.workoutIndex,
      'id': workout.id,
      'usersCompleted': workout.usersCompleted,
    };
  }).toList();

  return workoutsJson;
}

List<dynamic>? convertFBExerciseToJSON(List<ExercisesRecord>? exerciseDoc) {
  exerciseDoc ??= [];
  List<Map<String, dynamic>> exercisesJson = exerciseDoc.map((exercise) {
    return {
      'details': exercise.details,
      'id': exercise.id,
      'imageUrl': exercise.imageUrl,
      'name': exercise.name,
      'tag': exercise.tag,
      'tags': exercise.tags,
      'videoId': exercise.videoId,
      'videoUrl': exercise.videoUrl,
      'workoutId': exercise.workoutId,
    };
  }).toList();
  return exercisesJson;
}

List<dynamic>? filterJson(
  String? field,
  String? value,
  List<dynamic> data,
) {
  List<dynamic> filteredList = [];

  for (dynamic item in data) {
    List<String> fields = field!.split('.');
    dynamic itemValue = item;

    for (String f in fields) {
      itemValue = itemValue[f];
    }

    bool isMatch = false;

    if (itemValue is String && value is String) {
      isMatch = itemValue.toLowerCase().contains(value.toLowerCase());
    } else {
      throw ArgumentError('Unsupported field type for "contains" operation');
    }
    if (isMatch) {
      filteredList.add(item);
    }
  }

  return filteredList;
}

List<dynamic>? filterJsonCopy(
  List<String>? tags,
  String? value,
  List<dynamic> data,
) {
  List<dynamic> filteredList = [];

  for (dynamic item in data) {
    bool isMatch = false;

    for (String tag in tags!) {
      List<String> fields = tag.split('.');
      dynamic itemValue = item;

      for (String f in fields) {
        itemValue = itemValue[f];
      }

      if (itemValue is String && value is String) {
        isMatch = itemValue.toLowerCase().contains(value.toLowerCase());
      } else {
        throw ArgumentError('Unsupported field type for "contains" operation');
      }

      if (isMatch) {
        filteredList.add(item);
        break; // Break the inner loop as soon as a match is found for any tag
      }
    }
  }

  return filteredList;
}

int? indexPlusOne(int index) {
  return index + 1;
}

bool? currentUserCompleted(
  String userId,
  List<String>? usersCompleted,
) {
  return usersCompleted!.contains(userId);
}

bool areAllTrue(List<bool> values) {
  // Use the `every` function to check if all values are true
  return values.every((value) => value == true);
}
