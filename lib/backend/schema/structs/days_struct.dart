// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DaysStruct extends FFFirebaseStruct {
  DaysStruct({
    String? name,
    List<ProgramExercisesStruct>? exercises,
    String? id,
    int? day,
    DateTime? date,
    String? superSetId,
    bool? isDropSet,
    bool? isSuperset,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _exercises = exercises,
        _id = id,
        _day = day,
        _date = date,
        _superSetId = superSetId,
        _isDropSet = isDropSet,
        _isSuperset = isSuperset,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "exercises" field.
  List<ProgramExercisesStruct>? _exercises;
  List<ProgramExercisesStruct> get exercises => _exercises ?? const [];
  set exercises(List<ProgramExercisesStruct>? val) => _exercises = val;
  void updateExercises(Function(List<ProgramExercisesStruct>) updateFn) =>
      updateFn(_exercises ??= []);
  bool hasExercises() => _exercises != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "day" field.
  int? _day;
  int get day => _day ?? 0;
  set day(int? val) => _day = val;
  void incrementDay(int amount) => _day = day + amount;
  bool hasDay() => _day != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "superSetId" field.
  String? _superSetId;
  String get superSetId => _superSetId ?? '';
  set superSetId(String? val) => _superSetId = val;
  bool hasSuperSetId() => _superSetId != null;

  // "isDropSet" field.
  bool? _isDropSet;
  bool get isDropSet => _isDropSet ?? false;
  set isDropSet(bool? val) => _isDropSet = val;
  bool hasIsDropSet() => _isDropSet != null;

  // "isSuperset" field.
  bool? _isSuperset;
  bool get isSuperset => _isSuperset ?? false;
  set isSuperset(bool? val) => _isSuperset = val;
  bool hasIsSuperset() => _isSuperset != null;

  static DaysStruct fromMap(Map<String, dynamic> data) => DaysStruct(
        name: data['name'] as String?,
        exercises: getStructList(
          data['exercises'],
          ProgramExercisesStruct.fromMap,
        ),
        id: data['id'] as String?,
        day: castToType<int>(data['day']),
        date: data['date'] as DateTime?,
        superSetId: data['superSetId'] as String?,
        isDropSet: data['isDropSet'] as bool?,
        isSuperset: data['isSuperset'] as bool?,
      );

  static DaysStruct? maybeFromMap(dynamic data) =>
      data is Map ? DaysStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'exercises': _exercises?.map((e) => e.toMap()).toList(),
        'id': _id,
        'day': _day,
        'date': _date,
        'superSetId': _superSetId,
        'isDropSet': _isDropSet,
        'isSuperset': _isSuperset,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'exercises': serializeParam(
          _exercises,
          ParamType.DataStruct,
          true,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'day': serializeParam(
          _day,
          ParamType.int,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'superSetId': serializeParam(
          _superSetId,
          ParamType.String,
        ),
        'isDropSet': serializeParam(
          _isDropSet,
          ParamType.bool,
        ),
        'isSuperset': serializeParam(
          _isSuperset,
          ParamType.bool,
        ),
      }.withoutNulls;

  static DaysStruct fromSerializableMap(Map<String, dynamic> data) =>
      DaysStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        exercises: deserializeStructParam<ProgramExercisesStruct>(
          data['exercises'],
          ParamType.DataStruct,
          true,
          structBuilder: ProgramExercisesStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        day: deserializeParam(
          data['day'],
          ParamType.int,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        superSetId: deserializeParam(
          data['superSetId'],
          ParamType.String,
          false,
        ),
        isDropSet: deserializeParam(
          data['isDropSet'],
          ParamType.bool,
          false,
        ),
        isSuperset: deserializeParam(
          data['isSuperset'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'DaysStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DaysStruct &&
        name == other.name &&
        listEquality.equals(exercises, other.exercises) &&
        id == other.id &&
        day == other.day &&
        date == other.date &&
        superSetId == other.superSetId &&
        isDropSet == other.isDropSet &&
        isSuperset == other.isSuperset;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [name, exercises, id, day, date, superSetId, isDropSet, isSuperset]);
}

DaysStruct createDaysStruct({
  String? name,
  String? id,
  int? day,
  DateTime? date,
  String? superSetId,
  bool? isDropSet,
  bool? isSuperset,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DaysStruct(
      name: name,
      id: id,
      day: day,
      date: date,
      superSetId: superSetId,
      isDropSet: isDropSet,
      isSuperset: isSuperset,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DaysStruct? updateDaysStruct(
  DaysStruct? days, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    days
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDaysStructData(
  Map<String, dynamic> firestoreData,
  DaysStruct? days,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (days == null) {
    return;
  }
  if (days.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && days.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final daysData = getDaysFirestoreData(days, forFieldValue);
  final nestedData = daysData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = days.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDaysFirestoreData(
  DaysStruct? days, [
  bool forFieldValue = false,
]) {
  if (days == null) {
    return {};
  }
  final firestoreData = mapToFirestore(days.toMap());

  // Add any Firestore field values
  days.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDaysListFirestoreData(
  List<DaysStruct>? dayss,
) =>
    dayss?.map((e) => getDaysFirestoreData(e, true)).toList() ?? [];
