// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BreakdownStruct extends FFFirebaseStruct {
  BreakdownStruct({
    List<String>? en,
    List<String>? th,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _en = en,
        _th = th,
        super(firestoreUtilData);

  // "en" field.
  List<String>? _en;
  List<String> get en => _en ?? const [];
  set en(List<String>? val) => _en = val;
  void updateEn(Function(List<String>) updateFn) => updateFn(_en ??= []);
  bool hasEn() => _en != null;

  // "th" field.
  List<String>? _th;
  List<String> get th => _th ?? const [];
  set th(List<String>? val) => _th = val;
  void updateTh(Function(List<String>) updateFn) => updateFn(_th ??= []);
  bool hasTh() => _th != null;

  static BreakdownStruct fromMap(Map<String, dynamic> data) => BreakdownStruct(
        en: getDataList(data['en']),
        th: getDataList(data['th']),
      );

  static BreakdownStruct? maybeFromMap(dynamic data) => data is Map
      ? BreakdownStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'en': _en,
        'th': _th,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'en': serializeParam(
          _en,
          ParamType.String,
          true,
        ),
        'th': serializeParam(
          _th,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static BreakdownStruct fromSerializableMap(Map<String, dynamic> data) =>
      BreakdownStruct(
        en: deserializeParam<String>(
          data['en'],
          ParamType.String,
          true,
        ),
        th: deserializeParam<String>(
          data['th'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'BreakdownStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is BreakdownStruct &&
        listEquality.equals(en, other.en) &&
        listEquality.equals(th, other.th);
  }

  @override
  int get hashCode => const ListEquality().hash([en, th]);
}

BreakdownStruct createBreakdownStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BreakdownStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BreakdownStruct? updateBreakdownStruct(
  BreakdownStruct? breakdown, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    breakdown
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBreakdownStructData(
  Map<String, dynamic> firestoreData,
  BreakdownStruct? breakdown,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (breakdown == null) {
    return;
  }
  if (breakdown.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && breakdown.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final breakdownData = getBreakdownFirestoreData(breakdown, forFieldValue);
  final nestedData = breakdownData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = breakdown.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBreakdownFirestoreData(
  BreakdownStruct? breakdown, [
  bool forFieldValue = false,
]) {
  if (breakdown == null) {
    return {};
  }
  final firestoreData = mapToFirestore(breakdown.toMap());

  // Add any Firestore field values
  breakdown.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBreakdownListFirestoreData(
  List<BreakdownStruct>? breakdowns,
) =>
    breakdowns?.map((e) => getBreakdownFirestoreData(e, true)).toList() ?? [];
