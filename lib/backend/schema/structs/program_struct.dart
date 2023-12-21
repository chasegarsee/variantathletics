// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramStruct extends FFFirebaseStruct {
  ProgramStruct({
    String? id,
    bool? isLive,
    String? name,
    List<WeeksStruct>? weeks,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _isLive = isLive,
        _name = name,
        _weeks = weeks,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "isLive" field.
  bool? _isLive;
  bool get isLive => _isLive ?? false;
  set isLive(bool? val) => _isLive = val;
  bool hasIsLive() => _isLive != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "weeks" field.
  List<WeeksStruct>? _weeks;
  List<WeeksStruct> get weeks => _weeks ?? const [];
  set weeks(List<WeeksStruct>? val) => _weeks = val;
  void updateWeeks(Function(List<WeeksStruct>) updateFn) =>
      updateFn(_weeks ??= []);
  bool hasWeeks() => _weeks != null;

  static ProgramStruct fromMap(Map<String, dynamic> data) => ProgramStruct(
        id: data['id'] as String?,
        isLive: data['isLive'] as bool?,
        name: data['name'] as String?,
        weeks: getStructList(
          data['weeks'],
          WeeksStruct.fromMap,
        ),
      );

  static ProgramStruct? maybeFromMap(dynamic data) =>
      data is Map ? ProgramStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'isLive': _isLive,
        'name': _name,
        'weeks': _weeks?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'isLive': serializeParam(
          _isLive,
          ParamType.bool,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'weeks': serializeParam(
          _weeks,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static ProgramStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProgramStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        isLive: deserializeParam(
          data['isLive'],
          ParamType.bool,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        weeks: deserializeStructParam<WeeksStruct>(
          data['weeks'],
          ParamType.DataStruct,
          true,
          structBuilder: WeeksStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProgramStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProgramStruct &&
        id == other.id &&
        isLive == other.isLive &&
        name == other.name &&
        listEquality.equals(weeks, other.weeks);
  }

  @override
  int get hashCode => const ListEquality().hash([id, isLive, name, weeks]);
}

ProgramStruct createProgramStruct({
  String? id,
  bool? isLive,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProgramStruct(
      id: id,
      isLive: isLive,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProgramStruct? updateProgramStruct(
  ProgramStruct? program, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    program
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProgramStructData(
  Map<String, dynamic> firestoreData,
  ProgramStruct? program,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (program == null) {
    return;
  }
  if (program.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && program.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final programData = getProgramFirestoreData(program, forFieldValue);
  final nestedData = programData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = program.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProgramFirestoreData(
  ProgramStruct? program, [
  bool forFieldValue = false,
]) {
  if (program == null) {
    return {};
  }
  final firestoreData = mapToFirestore(program.toMap());

  // Add any Firestore field values
  program.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProgramListFirestoreData(
  List<ProgramStruct>? programs,
) =>
    programs?.map((e) => getProgramFirestoreData(e, true)).toList() ?? [];
