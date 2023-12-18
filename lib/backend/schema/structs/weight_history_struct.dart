// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WeightHistoryStruct extends FFFirebaseStruct {
  WeightHistoryStruct({
    int? weight,
    int? date,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _weight = weight,
        _date = date,
        super(firestoreUtilData);

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  set weight(int? val) => _weight = val;
  void incrementWeight(int amount) => _weight = weight + amount;
  bool hasWeight() => _weight != null;

  // "date" field.
  int? _date;
  int get date => _date ?? 0;
  set date(int? val) => _date = val;
  void incrementDate(int amount) => _date = date + amount;
  bool hasDate() => _date != null;

  static WeightHistoryStruct fromMap(Map<String, dynamic> data) =>
      WeightHistoryStruct(
        weight: castToType<int>(data['weight']),
        date: castToType<int>(data['date']),
      );

  static WeightHistoryStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? WeightHistoryStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'weight': _weight,
        'date': _date,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'weight': serializeParam(
          _weight,
          ParamType.int,
        ),
        'date': serializeParam(
          _date,
          ParamType.int,
        ),
      }.withoutNulls;

  static WeightHistoryStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeightHistoryStruct(
        weight: deserializeParam(
          data['weight'],
          ParamType.int,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'WeightHistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeightHistoryStruct &&
        weight == other.weight &&
        date == other.date;
  }

  @override
  int get hashCode => const ListEquality().hash([weight, date]);
}

WeightHistoryStruct createWeightHistoryStruct({
  int? weight,
  int? date,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WeightHistoryStruct(
      weight: weight,
      date: date,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WeightHistoryStruct? updateWeightHistoryStruct(
  WeightHistoryStruct? weightHistory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    weightHistory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWeightHistoryStructData(
  Map<String, dynamic> firestoreData,
  WeightHistoryStruct? weightHistory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weightHistory == null) {
    return;
  }
  if (weightHistory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && weightHistory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weightHistoryData =
      getWeightHistoryFirestoreData(weightHistory, forFieldValue);
  final nestedData =
      weightHistoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = weightHistory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWeightHistoryFirestoreData(
  WeightHistoryStruct? weightHistory, [
  bool forFieldValue = false,
]) {
  if (weightHistory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(weightHistory.toMap());

  // Add any Firestore field values
  weightHistory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeightHistoryListFirestoreData(
  List<WeightHistoryStruct>? weightHistorys,
) =>
    weightHistorys
        ?.map((e) => getWeightHistoryFirestoreData(e, true))
        .toList() ??
    [];
