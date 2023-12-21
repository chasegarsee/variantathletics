// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramExercisesStruct extends FFFirebaseStruct {
  ProgramExercisesStruct({
    String? name,
    String? reps,
    String? restTime,
    String? sets,
    String? workTime,
    String? id,
    String? tempo,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _reps = reps,
        _restTime = restTime,
        _sets = sets,
        _workTime = workTime,
        _id = id,
        _tempo = tempo,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "reps" field.
  String? _reps;
  String get reps => _reps ?? '';
  set reps(String? val) => _reps = val;
  bool hasReps() => _reps != null;

  // "restTime" field.
  String? _restTime;
  String get restTime => _restTime ?? '';
  set restTime(String? val) => _restTime = val;
  bool hasRestTime() => _restTime != null;

  // "sets" field.
  String? _sets;
  String get sets => _sets ?? '';
  set sets(String? val) => _sets = val;
  bool hasSets() => _sets != null;

  // "workTime" field.
  String? _workTime;
  String get workTime => _workTime ?? '';
  set workTime(String? val) => _workTime = val;
  bool hasWorkTime() => _workTime != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "tempo" field.
  String? _tempo;
  String get tempo => _tempo ?? '';
  set tempo(String? val) => _tempo = val;
  bool hasTempo() => _tempo != null;

  static ProgramExercisesStruct fromMap(Map<String, dynamic> data) =>
      ProgramExercisesStruct(
        name: data['name'] as String?,
        reps: data['reps'] as String?,
        restTime: data['restTime'] as String?,
        sets: data['sets'] as String?,
        workTime: data['workTime'] as String?,
        id: data['id'] as String?,
        tempo: data['tempo'] as String?,
      );

  static ProgramExercisesStruct? maybeFromMap(dynamic data) => data is Map
      ? ProgramExercisesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'reps': _reps,
        'restTime': _restTime,
        'sets': _sets,
        'workTime': _workTime,
        'id': _id,
        'tempo': _tempo,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'reps': serializeParam(
          _reps,
          ParamType.String,
        ),
        'restTime': serializeParam(
          _restTime,
          ParamType.String,
        ),
        'sets': serializeParam(
          _sets,
          ParamType.String,
        ),
        'workTime': serializeParam(
          _workTime,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'tempo': serializeParam(
          _tempo,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProgramExercisesStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ProgramExercisesStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        reps: deserializeParam(
          data['reps'],
          ParamType.String,
          false,
        ),
        restTime: deserializeParam(
          data['restTime'],
          ParamType.String,
          false,
        ),
        sets: deserializeParam(
          data['sets'],
          ParamType.String,
          false,
        ),
        workTime: deserializeParam(
          data['workTime'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        tempo: deserializeParam(
          data['tempo'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProgramExercisesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProgramExercisesStruct &&
        name == other.name &&
        reps == other.reps &&
        restTime == other.restTime &&
        sets == other.sets &&
        workTime == other.workTime &&
        id == other.id &&
        tempo == other.tempo;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, reps, restTime, sets, workTime, id, tempo]);
}

ProgramExercisesStruct createProgramExercisesStruct({
  String? name,
  String? reps,
  String? restTime,
  String? sets,
  String? workTime,
  String? id,
  String? tempo,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProgramExercisesStruct(
      name: name,
      reps: reps,
      restTime: restTime,
      sets: sets,
      workTime: workTime,
      id: id,
      tempo: tempo,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProgramExercisesStruct? updateProgramExercisesStruct(
  ProgramExercisesStruct? programExercises, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    programExercises
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProgramExercisesStructData(
  Map<String, dynamic> firestoreData,
  ProgramExercisesStruct? programExercises,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (programExercises == null) {
    return;
  }
  if (programExercises.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && programExercises.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final programExercisesData =
      getProgramExercisesFirestoreData(programExercises, forFieldValue);
  final nestedData =
      programExercisesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = programExercises.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProgramExercisesFirestoreData(
  ProgramExercisesStruct? programExercises, [
  bool forFieldValue = false,
]) {
  if (programExercises == null) {
    return {};
  }
  final firestoreData = mapToFirestore(programExercises.toMap());

  // Add any Firestore field values
  programExercises.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProgramExercisesListFirestoreData(
  List<ProgramExercisesStruct>? programExercisess,
) =>
    programExercisess
        ?.map((e) => getProgramExercisesFirestoreData(e, true))
        .toList() ??
    [];
