// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramStruct extends FFFirebaseStruct {
  ProgramStruct({
    String? color,
    DateTime? createdAt,
    String? description,
    bool? isDailyWorkout,
    bool? isLive,
    String? length,
    String? id,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _color = color,
        _createdAt = createdAt,
        _description = description,
        _isDailyWorkout = isDailyWorkout,
        _isLive = isLive,
        _length = length,
        _id = id,
        _name = name,
        super(firestoreUtilData);

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  set color(String? val) => _color = val;
  bool hasColor() => _color != null;

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "isDailyWorkout" field.
  bool? _isDailyWorkout;
  bool get isDailyWorkout => _isDailyWorkout ?? false;
  set isDailyWorkout(bool? val) => _isDailyWorkout = val;
  bool hasIsDailyWorkout() => _isDailyWorkout != null;

  // "isLive" field.
  bool? _isLive;
  bool get isLive => _isLive ?? false;
  set isLive(bool? val) => _isLive = val;
  bool hasIsLive() => _isLive != null;

  // "length" field.
  String? _length;
  String get length => _length ?? '';
  set length(String? val) => _length = val;
  bool hasLength() => _length != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static ProgramStruct fromMap(Map<String, dynamic> data) => ProgramStruct(
        color: data['color'] as String?,
        createdAt: data['createdAt'] as DateTime?,
        description: data['description'] as String?,
        isDailyWorkout: data['isDailyWorkout'] as bool?,
        isLive: data['isLive'] as bool?,
        length: data['length'] as String?,
        id: data['id'] as String?,
        name: data['name'] as String?,
      );

  static ProgramStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ProgramStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'color': _color,
        'createdAt': _createdAt,
        'description': _description,
        'isDailyWorkout': _isDailyWorkout,
        'isLive': _isLive,
        'length': _length,
        'id': _id,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'color': serializeParam(
          _color,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'isDailyWorkout': serializeParam(
          _isDailyWorkout,
          ParamType.bool,
        ),
        'isLive': serializeParam(
          _isLive,
          ParamType.bool,
        ),
        'length': serializeParam(
          _length,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProgramStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProgramStruct(
        color: deserializeParam(
          data['color'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.DateTime,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        isDailyWorkout: deserializeParam(
          data['isDailyWorkout'],
          ParamType.bool,
          false,
        ),
        isLive: deserializeParam(
          data['isLive'],
          ParamType.bool,
          false,
        ),
        length: deserializeParam(
          data['length'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProgramStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProgramStruct &&
        color == other.color &&
        createdAt == other.createdAt &&
        description == other.description &&
        isDailyWorkout == other.isDailyWorkout &&
        isLive == other.isLive &&
        length == other.length &&
        id == other.id &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([
        color,
        createdAt,
        description,
        isDailyWorkout,
        isLive,
        length,
        id,
        name
      ]);
}

ProgramStruct createProgramStruct({
  String? color,
  DateTime? createdAt,
  String? description,
  bool? isDailyWorkout,
  bool? isLive,
  String? length,
  String? id,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProgramStruct(
      color: color,
      createdAt: createdAt,
      description: description,
      isDailyWorkout: isDailyWorkout,
      isLive: isLive,
      length: length,
      id: id,
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
