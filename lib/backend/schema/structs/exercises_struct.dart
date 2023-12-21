// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExercisesStruct extends FFFirebaseStruct {
  ExercisesStruct({
    String? exerciseId,
    int? sets,
    int? reps,
    bool? isSuperSet,
    String? exerciseImageUrl,
    String? name,
    List<String>? setArr,
    List<String>? usersCompleted,
    BreakdownStruct? breakdown,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _exerciseId = exerciseId,
        _sets = sets,
        _reps = reps,
        _isSuperSet = isSuperSet,
        _exerciseImageUrl = exerciseImageUrl,
        _name = name,
        _setArr = setArr,
        _usersCompleted = usersCompleted,
        _breakdown = breakdown,
        super(firestoreUtilData);

  // "exerciseId" field.
  String? _exerciseId;
  String get exerciseId => _exerciseId ?? '';
  set exerciseId(String? val) => _exerciseId = val;
  bool hasExerciseId() => _exerciseId != null;

  // "sets" field.
  int? _sets;
  int get sets => _sets ?? 0;
  set sets(int? val) => _sets = val;
  void incrementSets(int amount) => _sets = sets + amount;
  bool hasSets() => _sets != null;

  // "reps" field.
  int? _reps;
  int get reps => _reps ?? 0;
  set reps(int? val) => _reps = val;
  void incrementReps(int amount) => _reps = reps + amount;
  bool hasReps() => _reps != null;

  // "isSuperSet" field.
  bool? _isSuperSet;
  bool get isSuperSet => _isSuperSet ?? false;
  set isSuperSet(bool? val) => _isSuperSet = val;
  bool hasIsSuperSet() => _isSuperSet != null;

  // "exerciseImageUrl" field.
  String? _exerciseImageUrl;
  String get exerciseImageUrl => _exerciseImageUrl ?? '';
  set exerciseImageUrl(String? val) => _exerciseImageUrl = val;
  bool hasExerciseImageUrl() => _exerciseImageUrl != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "setArr" field.
  List<String>? _setArr;
  List<String> get setArr => _setArr ?? const [];
  set setArr(List<String>? val) => _setArr = val;
  void updateSetArr(Function(List<String>) updateFn) =>
      updateFn(_setArr ??= []);
  bool hasSetArr() => _setArr != null;

  // "usersCompleted" field.
  List<String>? _usersCompleted;
  List<String> get usersCompleted => _usersCompleted ?? const [];
  set usersCompleted(List<String>? val) => _usersCompleted = val;
  void updateUsersCompleted(Function(List<String>) updateFn) =>
      updateFn(_usersCompleted ??= []);
  bool hasUsersCompleted() => _usersCompleted != null;

  // "breakdown" field.
  BreakdownStruct? _breakdown;
  BreakdownStruct get breakdown => _breakdown ?? BreakdownStruct();
  set breakdown(BreakdownStruct? val) => _breakdown = val;
  void updateBreakdown(Function(BreakdownStruct) updateFn) =>
      updateFn(_breakdown ??= BreakdownStruct());
  bool hasBreakdown() => _breakdown != null;

  static ExercisesStruct fromMap(Map<String, dynamic> data) => ExercisesStruct(
        exerciseId: data['exerciseId'] as String?,
        sets: castToType<int>(data['sets']),
        reps: castToType<int>(data['reps']),
        isSuperSet: data['isSuperSet'] as bool?,
        exerciseImageUrl: data['exerciseImageUrl'] as String?,
        name: data['name'] as String?,
        setArr: getDataList(data['setArr']),
        usersCompleted: getDataList(data['usersCompleted']),
        breakdown: BreakdownStruct.maybeFromMap(data['breakdown']),
      );

  static ExercisesStruct? maybeFromMap(dynamic data) => data is Map
      ? ExercisesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'exerciseId': _exerciseId,
        'sets': _sets,
        'reps': _reps,
        'isSuperSet': _isSuperSet,
        'exerciseImageUrl': _exerciseImageUrl,
        'name': _name,
        'setArr': _setArr,
        'usersCompleted': _usersCompleted,
        'breakdown': _breakdown?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'exerciseId': serializeParam(
          _exerciseId,
          ParamType.String,
        ),
        'sets': serializeParam(
          _sets,
          ParamType.int,
        ),
        'reps': serializeParam(
          _reps,
          ParamType.int,
        ),
        'isSuperSet': serializeParam(
          _isSuperSet,
          ParamType.bool,
        ),
        'exerciseImageUrl': serializeParam(
          _exerciseImageUrl,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'setArr': serializeParam(
          _setArr,
          ParamType.String,
          true,
        ),
        'usersCompleted': serializeParam(
          _usersCompleted,
          ParamType.String,
          true,
        ),
        'breakdown': serializeParam(
          _breakdown,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ExercisesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ExercisesStruct(
        exerciseId: deserializeParam(
          data['exerciseId'],
          ParamType.String,
          false,
        ),
        sets: deserializeParam(
          data['sets'],
          ParamType.int,
          false,
        ),
        reps: deserializeParam(
          data['reps'],
          ParamType.int,
          false,
        ),
        isSuperSet: deserializeParam(
          data['isSuperSet'],
          ParamType.bool,
          false,
        ),
        exerciseImageUrl: deserializeParam(
          data['exerciseImageUrl'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        setArr: deserializeParam<String>(
          data['setArr'],
          ParamType.String,
          true,
        ),
        usersCompleted: deserializeParam<String>(
          data['usersCompleted'],
          ParamType.String,
          true,
        ),
        breakdown: deserializeStructParam(
          data['breakdown'],
          ParamType.DataStruct,
          false,
          structBuilder: BreakdownStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ExercisesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ExercisesStruct &&
        exerciseId == other.exerciseId &&
        sets == other.sets &&
        reps == other.reps &&
        isSuperSet == other.isSuperSet &&
        exerciseImageUrl == other.exerciseImageUrl &&
        name == other.name &&
        listEquality.equals(setArr, other.setArr) &&
        listEquality.equals(usersCompleted, other.usersCompleted) &&
        breakdown == other.breakdown;
  }

  @override
  int get hashCode => const ListEquality().hash([
        exerciseId,
        sets,
        reps,
        isSuperSet,
        exerciseImageUrl,
        name,
        setArr,
        usersCompleted,
        breakdown
      ]);
}

ExercisesStruct createExercisesStruct({
  String? exerciseId,
  int? sets,
  int? reps,
  bool? isSuperSet,
  String? exerciseImageUrl,
  String? name,
  BreakdownStruct? breakdown,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ExercisesStruct(
      exerciseId: exerciseId,
      sets: sets,
      reps: reps,
      isSuperSet: isSuperSet,
      exerciseImageUrl: exerciseImageUrl,
      name: name,
      breakdown: breakdown ?? (clearUnsetFields ? BreakdownStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ExercisesStruct? updateExercisesStruct(
  ExercisesStruct? exercises, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    exercises
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addExercisesStructData(
  Map<String, dynamic> firestoreData,
  ExercisesStruct? exercises,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (exercises == null) {
    return;
  }
  if (exercises.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && exercises.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final exercisesData = getExercisesFirestoreData(exercises, forFieldValue);
  final nestedData = exercisesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = exercises.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getExercisesFirestoreData(
  ExercisesStruct? exercises, [
  bool forFieldValue = false,
]) {
  if (exercises == null) {
    return {};
  }
  final firestoreData = mapToFirestore(exercises.toMap());

  // Handle nested data for "breakdown" field.
  addBreakdownStructData(
    firestoreData,
    exercises.hasBreakdown() ? exercises.breakdown : null,
    'breakdown',
    forFieldValue,
  );

  // Add any Firestore field values
  exercises.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getExercisesListFirestoreData(
  List<ExercisesStruct>? exercisess,
) =>
    exercisess?.map((e) => getExercisesFirestoreData(e, true)).toList() ?? [];
