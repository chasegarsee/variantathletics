// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompletedWorkoutsStruct extends FFFirebaseStruct {
  CompletedWorkoutsStruct({
    List<String>? exerciseIndexes,
    String? workoutId,
    bool? isComplete,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _exerciseIndexes = exerciseIndexes,
        _workoutId = workoutId,
        _isComplete = isComplete,
        super(firestoreUtilData);

  // "exerciseIndexes" field.
  List<String>? _exerciseIndexes;
  List<String> get exerciseIndexes => _exerciseIndexes ?? const [];
  set exerciseIndexes(List<String>? val) => _exerciseIndexes = val;
  void updateExerciseIndexes(Function(List<String>) updateFn) =>
      updateFn(_exerciseIndexes ??= []);
  bool hasExerciseIndexes() => _exerciseIndexes != null;

  // "workoutId" field.
  String? _workoutId;
  String get workoutId => _workoutId ?? '';
  set workoutId(String? val) => _workoutId = val;
  bool hasWorkoutId() => _workoutId != null;

  // "isComplete" field.
  bool? _isComplete;
  bool get isComplete => _isComplete ?? false;
  set isComplete(bool? val) => _isComplete = val;
  bool hasIsComplete() => _isComplete != null;

  static CompletedWorkoutsStruct fromMap(Map<String, dynamic> data) =>
      CompletedWorkoutsStruct(
        exerciseIndexes: getDataList(data['exerciseIndexes']),
        workoutId: data['workoutId'] as String?,
        isComplete: data['isComplete'] as bool?,
      );

  static CompletedWorkoutsStruct? maybeFromMap(dynamic data) => data is Map
      ? CompletedWorkoutsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'exerciseIndexes': _exerciseIndexes,
        'workoutId': _workoutId,
        'isComplete': _isComplete,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'exerciseIndexes': serializeParam(
          _exerciseIndexes,
          ParamType.String,
          true,
        ),
        'workoutId': serializeParam(
          _workoutId,
          ParamType.String,
        ),
        'isComplete': serializeParam(
          _isComplete,
          ParamType.bool,
        ),
      }.withoutNulls;

  static CompletedWorkoutsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CompletedWorkoutsStruct(
        exerciseIndexes: deserializeParam<String>(
          data['exerciseIndexes'],
          ParamType.String,
          true,
        ),
        workoutId: deserializeParam(
          data['workoutId'],
          ParamType.String,
          false,
        ),
        isComplete: deserializeParam(
          data['isComplete'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'CompletedWorkoutsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CompletedWorkoutsStruct &&
        listEquality.equals(exerciseIndexes, other.exerciseIndexes) &&
        workoutId == other.workoutId &&
        isComplete == other.isComplete;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([exerciseIndexes, workoutId, isComplete]);
}

CompletedWorkoutsStruct createCompletedWorkoutsStruct({
  String? workoutId,
  bool? isComplete,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CompletedWorkoutsStruct(
      workoutId: workoutId,
      isComplete: isComplete,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CompletedWorkoutsStruct? updateCompletedWorkoutsStruct(
  CompletedWorkoutsStruct? completedWorkouts, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    completedWorkouts
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCompletedWorkoutsStructData(
  Map<String, dynamic> firestoreData,
  CompletedWorkoutsStruct? completedWorkouts,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (completedWorkouts == null) {
    return;
  }
  if (completedWorkouts.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && completedWorkouts.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final completedWorkoutsData =
      getCompletedWorkoutsFirestoreData(completedWorkouts, forFieldValue);
  final nestedData =
      completedWorkoutsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = completedWorkouts.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCompletedWorkoutsFirestoreData(
  CompletedWorkoutsStruct? completedWorkouts, [
  bool forFieldValue = false,
]) {
  if (completedWorkouts == null) {
    return {};
  }
  final firestoreData = mapToFirestore(completedWorkouts.toMap());

  // Add any Firestore field values
  completedWorkouts.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCompletedWorkoutsListFirestoreData(
  List<CompletedWorkoutsStruct>? completedWorkoutss,
) =>
    completedWorkoutss
        ?.map((e) => getCompletedWorkoutsFirestoreData(e, true))
        .toList() ??
    [];
