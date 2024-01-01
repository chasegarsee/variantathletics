// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeeksStruct extends FFFirebaseStruct {
  WeeksStruct({
    int? weekNumber,
    List<DaysStruct>? days,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _weekNumber = weekNumber,
        _days = days,
        _id = id,
        super(firestoreUtilData);

  // "weekNumber" field.
  int? _weekNumber;
  int get weekNumber => _weekNumber ?? 0;
  set weekNumber(int? val) => _weekNumber = val;
  void incrementWeekNumber(int amount) => _weekNumber = weekNumber + amount;
  bool hasWeekNumber() => _weekNumber != null;

  // "days" field.
  List<DaysStruct>? _days;
  List<DaysStruct> get days => _days ?? const [];
  set days(List<DaysStruct>? val) => _days = val;
  void updateDays(Function(List<DaysStruct>) updateFn) =>
      updateFn(_days ??= []);
  bool hasDays() => _days != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  static WeeksStruct fromMap(Map<String, dynamic> data) => WeeksStruct(
        weekNumber: castToType<int>(data['weekNumber']),
        days: getStructList(
          data['days'],
          DaysStruct.fromMap,
        ),
        id: data['id'] as String?,
      );

  static WeeksStruct? maybeFromMap(dynamic data) =>
      data is Map ? WeeksStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'weekNumber': _weekNumber,
        'days': _days?.map((e) => e.toMap()).toList(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'weekNumber': serializeParam(
          _weekNumber,
          ParamType.int,
        ),
        'days': serializeParam(
          _days,
          ParamType.DataStruct,
          true,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static WeeksStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeeksStruct(
        weekNumber: deserializeParam(
          data['weekNumber'],
          ParamType.int,
          false,
        ),
        days: deserializeStructParam<DaysStruct>(
          data['days'],
          ParamType.DataStruct,
          true,
          structBuilder: DaysStruct.fromSerializableMap,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'WeeksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is WeeksStruct &&
        weekNumber == other.weekNumber &&
        listEquality.equals(days, other.days) &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([weekNumber, days, id]);
}

WeeksStruct createWeeksStruct({
  int? weekNumber,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WeeksStruct(
      weekNumber: weekNumber,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WeeksStruct? updateWeeksStruct(
  WeeksStruct? weeks, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    weeks
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWeeksStructData(
  Map<String, dynamic> firestoreData,
  WeeksStruct? weeks,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weeks == null) {
    return;
  }
  if (weeks.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && weeks.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weeksData = getWeeksFirestoreData(weeks, forFieldValue);
  final nestedData = weeksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = weeks.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWeeksFirestoreData(
  WeeksStruct? weeks, [
  bool forFieldValue = false,
]) {
  if (weeks == null) {
    return {};
  }
  final firestoreData = mapToFirestore(weeks.toMap());

  // Add any Firestore field values
  weeks.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeeksListFirestoreData(
  List<WeeksStruct>? weekss,
) =>
    weekss?.map((e) => getWeeksFirestoreData(e, true)).toList() ?? [];
