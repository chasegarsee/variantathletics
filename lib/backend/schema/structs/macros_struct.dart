// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MacrosStruct extends FFFirebaseStruct {
  MacrosStruct({
    int? totalCalories,
    int? protein,
    int? carbs,
    int? fat,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _totalCalories = totalCalories,
        _protein = protein,
        _carbs = carbs,
        _fat = fat,
        super(firestoreUtilData);

  // "totalCalories" field.
  int? _totalCalories;
  int get totalCalories => _totalCalories ?? 0;
  set totalCalories(int? val) => _totalCalories = val;
  void incrementTotalCalories(int amount) =>
      _totalCalories = totalCalories + amount;
  bool hasTotalCalories() => _totalCalories != null;

  // "protein" field.
  int? _protein;
  int get protein => _protein ?? 0;
  set protein(int? val) => _protein = val;
  void incrementProtein(int amount) => _protein = protein + amount;
  bool hasProtein() => _protein != null;

  // "carbs" field.
  int? _carbs;
  int get carbs => _carbs ?? 0;
  set carbs(int? val) => _carbs = val;
  void incrementCarbs(int amount) => _carbs = carbs + amount;
  bool hasCarbs() => _carbs != null;

  // "fat" field.
  int? _fat;
  int get fat => _fat ?? 0;
  set fat(int? val) => _fat = val;
  void incrementFat(int amount) => _fat = fat + amount;
  bool hasFat() => _fat != null;

  static MacrosStruct fromMap(Map<String, dynamic> data) => MacrosStruct(
        totalCalories: castToType<int>(data['totalCalories']),
        protein: castToType<int>(data['protein']),
        carbs: castToType<int>(data['carbs']),
        fat: castToType<int>(data['fat']),
      );

  static MacrosStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? MacrosStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'totalCalories': _totalCalories,
        'protein': _protein,
        'carbs': _carbs,
        'fat': _fat,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'totalCalories': serializeParam(
          _totalCalories,
          ParamType.int,
        ),
        'protein': serializeParam(
          _protein,
          ParamType.int,
        ),
        'carbs': serializeParam(
          _carbs,
          ParamType.int,
        ),
        'fat': serializeParam(
          _fat,
          ParamType.int,
        ),
      }.withoutNulls;

  static MacrosStruct fromSerializableMap(Map<String, dynamic> data) =>
      MacrosStruct(
        totalCalories: deserializeParam(
          data['totalCalories'],
          ParamType.int,
          false,
        ),
        protein: deserializeParam(
          data['protein'],
          ParamType.int,
          false,
        ),
        carbs: deserializeParam(
          data['carbs'],
          ParamType.int,
          false,
        ),
        fat: deserializeParam(
          data['fat'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MacrosStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MacrosStruct &&
        totalCalories == other.totalCalories &&
        protein == other.protein &&
        carbs == other.carbs &&
        fat == other.fat;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([totalCalories, protein, carbs, fat]);
}

MacrosStruct createMacrosStruct({
  int? totalCalories,
  int? protein,
  int? carbs,
  int? fat,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MacrosStruct(
      totalCalories: totalCalories,
      protein: protein,
      carbs: carbs,
      fat: fat,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MacrosStruct? updateMacrosStruct(
  MacrosStruct? macros, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    macros
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMacrosStructData(
  Map<String, dynamic> firestoreData,
  MacrosStruct? macros,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (macros == null) {
    return;
  }
  if (macros.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && macros.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final macrosData = getMacrosFirestoreData(macros, forFieldValue);
  final nestedData = macrosData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = macros.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMacrosFirestoreData(
  MacrosStruct? macros, [
  bool forFieldValue = false,
]) {
  if (macros == null) {
    return {};
  }
  final firestoreData = mapToFirestore(macros.toMap());

  // Add any Firestore field values
  macros.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMacrosListFirestoreData(
  List<MacrosStruct>? macross,
) =>
    macross?.map((e) => getMacrosFirestoreData(e, true)).toList() ?? [];
