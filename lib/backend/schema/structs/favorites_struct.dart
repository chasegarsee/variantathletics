// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FavoritesStruct extends FFFirebaseStruct {
  FavoritesStruct({
    String? name,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _id = id,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  static FavoritesStruct fromMap(Map<String, dynamic> data) => FavoritesStruct(
        name: data['name'] as String?,
        id: data['id'] as String?,
      );

  static FavoritesStruct? maybeFromMap(dynamic data) => data is Map
      ? FavoritesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static FavoritesStruct fromSerializableMap(Map<String, dynamic> data) =>
      FavoritesStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'FavoritesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FavoritesStruct && name == other.name && id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([name, id]);
}

FavoritesStruct createFavoritesStruct({
  String? name,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FavoritesStruct(
      name: name,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FavoritesStruct? updateFavoritesStruct(
  FavoritesStruct? favorites, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    favorites
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFavoritesStructData(
  Map<String, dynamic> firestoreData,
  FavoritesStruct? favorites,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (favorites == null) {
    return;
  }
  if (favorites.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && favorites.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final favoritesData = getFavoritesFirestoreData(favorites, forFieldValue);
  final nestedData = favoritesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = favorites.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFavoritesFirestoreData(
  FavoritesStruct? favorites, [
  bool forFieldValue = false,
]) {
  if (favorites == null) {
    return {};
  }
  final firestoreData = mapToFirestore(favorites.toMap());

  // Add any Firestore field values
  favorites.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFavoritesListFirestoreData(
  List<FavoritesStruct>? favoritess,
) =>
    favoritess?.map((e) => getFavoritesFirestoreData(e, true)).toList() ?? [];
