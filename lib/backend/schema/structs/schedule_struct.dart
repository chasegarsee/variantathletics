// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ScheduleStruct extends FFFirebaseStruct {
  ScheduleStruct({
    int? day,
    int? week,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _day = day,
        _week = week,
        super(firestoreUtilData);

  // "day" field.
  int? _day;
  int get day => _day ?? 0;
  set day(int? val) => _day = val;
  void incrementDay(int amount) => _day = day + amount;
  bool hasDay() => _day != null;

  // "week" field.
  int? _week;
  int get week => _week ?? 0;
  set week(int? val) => _week = val;
  void incrementWeek(int amount) => _week = week + amount;
  bool hasWeek() => _week != null;

  static ScheduleStruct fromMap(Map<String, dynamic> data) => ScheduleStruct(
        day: castToType<int>(data['day']),
        week: castToType<int>(data['week']),
      );

  static ScheduleStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ScheduleStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'day': _day,
        'week': _week,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'day': serializeParam(
          _day,
          ParamType.int,
        ),
        'week': serializeParam(
          _week,
          ParamType.int,
        ),
      }.withoutNulls;

  static ScheduleStruct fromSerializableMap(Map<String, dynamic> data) =>
      ScheduleStruct(
        day: deserializeParam(
          data['day'],
          ParamType.int,
          false,
        ),
        week: deserializeParam(
          data['week'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'ScheduleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ScheduleStruct && day == other.day && week == other.week;
  }

  @override
  int get hashCode => const ListEquality().hash([day, week]);
}

ScheduleStruct createScheduleStruct({
  int? day,
  int? week,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ScheduleStruct(
      day: day,
      week: week,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ScheduleStruct? updateScheduleStruct(
  ScheduleStruct? schedule, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    schedule
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addScheduleStructData(
  Map<String, dynamic> firestoreData,
  ScheduleStruct? schedule,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (schedule == null) {
    return;
  }
  if (schedule.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && schedule.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final scheduleData = getScheduleFirestoreData(schedule, forFieldValue);
  final nestedData = scheduleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = schedule.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getScheduleFirestoreData(
  ScheduleStruct? schedule, [
  bool forFieldValue = false,
]) {
  if (schedule == null) {
    return {};
  }
  final firestoreData = mapToFirestore(schedule.toMap());

  // Add any Firestore field values
  schedule.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getScheduleListFirestoreData(
  List<ScheduleStruct>? schedules,
) =>
    schedules?.map((e) => getScheduleFirestoreData(e, true)).toList() ?? [];
