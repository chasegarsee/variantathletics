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
    'currentProgram': usersDoc.currentProgram,
    'weightHistory': usersDoc.weightHistory,
    'macros': usersDoc.macros,
    'readMessages': usersDoc.readMessages,
  };
}

dynamic convertFBProgramToJSON(ProgramsRecord programsDoc) {
  return {
    'id': programsDoc.id,
    'isLive': programsDoc.isLive,
    'name': programsDoc.name,
    'weeks': programsDoc.weeks,
  };
}

List<dynamic>? convertFBExerciseToJSON(List<ExercisesRecord>? exerciseDoc) {
  exerciseDoc ??= [];
  List<Map<String, dynamic>> exercisesJson = exerciseDoc.map((exercise) {
    return {
      'details': exercise.details,
      'breakdown': exercise.breakdown,
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
  List<dynamic> exercises,
  String tag,
) {
  tag = tag
      .toLowerCase(); // Convert the tag to lowercase for case-insensitive comparison
  List<dynamic> filteredExercises = [];

  for (dynamic exercise in exercises) {
    if (exercise['tags'] != null) {
      List<String> exerciseTags = List<String>.from(exercise['tags']);
      // Convert each tag in the exerciseTags array to lowercase for comparison
      exerciseTags = exerciseTags.map((t) => t.toLowerCase()).toList();

      if (exerciseTags.contains(tag)) {
        filteredExercises.add(exercise);
      }
    }
  }
  return filteredExercises;
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

String capitalize(String exercise) {
  return exercise[0].toUpperCase() + exercise.substring(1);
}

bool isWeekComplete(
  int? weekNumber,
  List<String>? completedDays,
) {
  // Check if weekNumber or completedDays is null
  if (weekNumber == null || completedDays == null) {
    return false;
  }

  int count = 0;

  // Iterate through the list of strings
  for (String day in completedDays) {
    // Check if the string contains the pattern "w-{weekNumber}"
    if (day.contains("w-$weekNumber")) {
      count++;
    }

    // Return true if count reaches 7
    if (count == 7) {
      return true;
    }
  }

  // Return false if the count does not reach 7
  return false;
}

List<ProgramExercisesStruct> setExercises(WeeksStruct week) {
  return week.days[0].exercises;
}

List<DaysStruct> setDays(List<WeeksStruct> weeks) {
  return weeks[0].days;
}

MacrosStruct macroCalculator(
  int age,
  int weight,
  int height,
  int activityLevel,
  int goal,
  int gender,
) {
  // Calculate RMR using Mifflin-St Jeor Equation
  int rmr =
      ((10 * weight) + (6.25 * height) - (5 * age) + (gender == 1 ? 5 : -161))
          .round();

  // Activity factors
  double activityMultiplier;
  switch (activityLevel) {
    case 1:
      activityMultiplier = 1.2;
      break;
    case 2:
      activityMultiplier = 1.375;
      break;
    case 3:
      activityMultiplier = 1.55;
      break;
    case 4:
      activityMultiplier = 1.725;
      break;
    case 5:
      activityMultiplier = 1.9;
      break;
    default:
      activityMultiplier = 1.2;
  }

  // Calculate total calories based on activity level and round to the nearest 10th
  int totalCalories = ((rmr * activityMultiplier) / 10).round() * 10;

  // Adjust total calories based on goal
  switch (goal) {
    case 1: // Fat loss: 20% deficit
      totalCalories = (totalCalories * 0.8 / 10).round() * 10;
      break;
    case 3: // Bulking: 20% surplus
      totalCalories = (totalCalories * 1.1 / 10).round() * 10;
      break;
    case 2: // Maintenance
    default:
      break;
  }

  // Calculate macronutrients
  int proteinCalories = (totalCalories * .30).round();
  int proteinGrams = (proteinCalories / 4).round(); // 4 calories per gram

  int carbsCalories = (totalCalories * 0.35).round();
  int carbsGrams = (carbsCalories / 4).round(); // 4 calories per gram

  // Remaining calories for fats
  int remainingCalories = (totalCalories * 0.35).round();
  int fatGrams = (remainingCalories / 9).round(); // 9 calories per gram

  return MacrosStruct(
    totalCalories: totalCalories,
    protein: proteinGrams,
    carbs: carbsGrams,
    fat: fatGrams,
  );
}

bool convertStringToInt(String text) {
  bool isValid;
  if (text == '') {
    return false;
  }
  isValid = int.parse(text) >= 10;
  return isValid;
}

String formatPDFName(String pdfName) {
  // Replace all underscores with spaces
  String replacedString = pdfName.replaceAll('_', ' ');

  // Split the string into words
  List<String> words = replacedString.split(' ');

  // Capitalize the first letter of each word
  List<String> capitalizedWords = words.map((word) {
    if (word.isEmpty) return word;
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }).toList();

  // Join the words back into a single string
  return capitalizedWords.join(' ');
}

bool isFavorite(
  String exerciseId,
  List<FavoritesStruct>? favorites,
) {
  if (favorites == null) {
    return false;
  }
  for (var favorite in favorites) {
    if (favorite.id == exerciseId) {
      return true;
    }
  }
  return false;
}

List<int> macroPercentageCalc(
  int calories,
  int protein,
  int carbs,
  int fat,
) {
  List<int> percentages = [];

  if (calories != null && calories > 0) {
    double proteinPercentage = ((protein * 4) / calories) * 100;
    double carbsPercentage = ((carbs * 4) / calories) * 100;
    double fatPercentage = ((fat * 8) / calories) * 100;

    // Check for NaN values and replace them with 0
    if (proteinPercentage.isNaN) proteinPercentage = 0.0;
    if (carbsPercentage.isNaN) carbsPercentage = 0.0;
    if (fatPercentage.isNaN) fatPercentage = 0.0;

    percentages.addAll([
      proteinPercentage.round(),
      carbsPercentage.round(),
      fatPercentage.round(),
    ]);
  } else {
    // Handle the case where calories are 0 or NaN
    // You can choose an appropriate default value or error handling strategy here
    percentages
        .addAll([0, 0, 0]); // Defaulting to 0 in case of issues with calories
  }

  return percentages;
}

bool isDateWithinLastSevenDays(
  DateTime date,
  DateTime currentTime,
) {
  // Calculate the difference in days between the two dates
  Duration difference = currentTime.difference(date);
  // Check if the difference is less than or equal to 7 days
  return difference.inDays <= 6;
}

List<int> singleMacroPercentageCalc(
  int calories,
  int macro,
  int calPerGram,
) {
  List<int> percentages = [];
  double caloriePercentage = ((macro * calPerGram) / calories) * 100;
  int remainingCalories = (100 - caloriePercentage).round();

  percentages.addAll([caloriePercentage.round(), remainingCalories]);
  return percentages;
}

int handPortionsCalc(
  int macro,
  int gender,
  String macroType,
) {
  double portionSize;
  if (gender != null && macroType != null && macro != 0) {
    if (gender == 1) {
      if (macroType == 'protein') {
        portionSize = (macro * 0.90) / 24;
      } else if (macroType == 'veggies') {
        portionSize = ((macro * 0.80) * 0.25) / 5;
      } else if (macroType == 'carbs') {
        portionSize = ((macro * 0.90) * 0.75) / 25;
      } else {
        portionSize = (macro * 0.75) / 9;
      }
    } else {
      if (macroType == 'protein') {
        portionSize = (macro * 0.90) / 22;
      } else if (macroType == 'veggies') {
        portionSize = ((macro * 0.80) * 0.25) / 5;
      } else if (macroType == 'carbs') {
        portionSize = ((macro * 0.90) * 0.75) / 22;
      } else {
        portionSize = (macro * 0.75) / 9;
      }
    }
  } else {
    // Handle the case where gender, macroType, or macro is null or zero
    portionSize =
        0.0; // You can choose an appropriate default value or error handling strategy here
  }
  return portionSize.round();
}

int convertMacroToFoodWeight(
  int macro,
  String foodType,
) {
  int foodWeight;

  if (foodType == 'protein') {
    foodWeight = (macro * 3.5).round();
  } else if (foodType == 'veggies') {
    foodWeight = ((macro * .25) * 5.5).round();
  } else if (foodType == 'carbs') {
    foodWeight = ((macro * .75) * 4.5).round();
  } else {
    foodWeight = (macro * 3).round();
  }

  return foodWeight;
}

bool allCountsAreZero(List<ResponsesStruct> responses) {
  for (var obj in responses) {
    if (obj.count != 0) {
      return false;
    }
  }
  return true;
}

int unreadMessageCount(
  int messages,
  int readMessages,
) {
  // If readMessages is null, return 0 immediately
  if (readMessages == null) {
    return 0;
  }

  int unreadCount = messages - readMessages;

  // Ensure the count is not negative and does not exceed 9
  return unreadCount.clamp(0, 9);
}

String? convertStringToHyphenatedLowerCase(String inputString) {
  if (inputString != null) {
    // Convert the input string to lowercase
    String lowercaseString = inputString.toLowerCase();

    // Replace spaces with hyphens
    String hyphenatedString = lowercaseString.replaceAll(' ', '-');

    return hyphenatedString;
  } else {
    // Handle the case where inputString is null
    return 'none'; // Or provide an alternative behavior/error message
  }
}

List<WeeksStruct> generateWeekObjects(
  int numWeeks,
  String programName,
) {
  List<WeeksStruct> weekList = [];

  for (int i = 1; i <= numWeeks; i++) {
    weekList.add(
        WeeksStruct(days: [], weekNumber: i, id: '${programName}-week-${i}'));
  }

  return weekList;
}

String removeToken(String url) {
  // Check if the URL contains "&token="
  if (url.contains("&token=")) {
    // Split the URL using "&token=" as the separator
    List<String> parts = url.split("&token=");

    // Take only the part before "&token=" and join it back together
    String updatedUrl = parts[0];

    return updatedUrl;
  } else {
    // If "&token=" is not found in the URL, return the original URL
    return url;
  }
}

List<DaysStruct> detDaysFromFirstWeek(List<WeeksStruct> weeks) {
  return weeks.isNotEmpty ? weeks[0].days : [];
}

List<DaysStruct> getDaysFromWeek(WeeksStruct week) {
  return week.days;
}
