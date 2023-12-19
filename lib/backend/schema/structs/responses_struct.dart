// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResponsesStruct extends FFFirebaseStruct {
  ResponsesStruct({
    int? count,
    String? response,
    List<String>? uid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _count = count,
        _response = response,
        _uid = uid,
        super(firestoreUtilData);

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;
  void incrementCount(int amount) => _count = count + amount;
  bool hasCount() => _count != null;

  // "response" field.
  String? _response;
  String get response => _response ?? '';
  set response(String? val) => _response = val;
  bool hasResponse() => _response != null;

  // "uid" field.
  List<String>? _uid;
  List<String> get uid => _uid ?? const [];
  set uid(List<String>? val) => _uid = val;
  void updateUid(Function(List<String>) updateFn) => updateFn(_uid ??= []);
  bool hasUid() => _uid != null;

  static ResponsesStruct fromMap(Map<String, dynamic> data) => ResponsesStruct(
        count: castToType<int>(data['count']),
        response: data['response'] as String?,
        uid: getDataList(data['uid']),
      );

  static ResponsesStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ResponsesStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'count': _count,
        'response': _response,
        'uid': _uid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
        'response': serializeParam(
          _response,
          ParamType.String,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static ResponsesStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResponsesStruct(
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
        response: deserializeParam(
          data['response'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam<String>(
          data['uid'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'ResponsesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ResponsesStruct &&
        count == other.count &&
        response == other.response &&
        listEquality.equals(uid, other.uid);
  }

  @override
  int get hashCode => const ListEquality().hash([count, response, uid]);
}

ResponsesStruct createResponsesStruct({
  int? count,
  String? response,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResponsesStruct(
      count: count,
      response: response,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResponsesStruct? updateResponsesStruct(
  ResponsesStruct? responses, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    responses
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResponsesStructData(
  Map<String, dynamic> firestoreData,
  ResponsesStruct? responses,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (responses == null) {
    return;
  }
  if (responses.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && responses.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final responsesData = getResponsesFirestoreData(responses, forFieldValue);
  final nestedData = responsesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = responses.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResponsesFirestoreData(
  ResponsesStruct? responses, [
  bool forFieldValue = false,
]) {
  if (responses == null) {
    return {};
  }
  final firestoreData = mapToFirestore(responses.toMap());

  // Add any Firestore field values
  responses.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResponsesListFirestoreData(
  List<ResponsesStruct>? responsess,
) =>
    responsess?.map((e) => getResponsesFirestoreData(e, true)).toList() ?? [];
