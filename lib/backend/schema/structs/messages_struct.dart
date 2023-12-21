// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesStruct extends FFFirebaseStruct {
  MessagesStruct({
    String? author,
    String? body,
    DateTime? date,
    String? photoURL,
    List<ResponsesStruct>? responses,
    String? uid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _author = author,
        _body = body,
        _date = date,
        _photoURL = photoURL,
        _responses = responses,
        _uid = uid,
        super(firestoreUtilData);

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  set author(String? val) => _author = val;
  bool hasAuthor() => _author != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  set body(String? val) => _body = val;
  bool hasBody() => _body != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "photoURL" field.
  String? _photoURL;
  String get photoURL => _photoURL ?? '';
  set photoURL(String? val) => _photoURL = val;
  bool hasPhotoURL() => _photoURL != null;

  // "responses" field.
  List<ResponsesStruct>? _responses;
  List<ResponsesStruct> get responses => _responses ?? const [];
  set responses(List<ResponsesStruct>? val) => _responses = val;
  void updateResponses(Function(List<ResponsesStruct>) updateFn) =>
      updateFn(_responses ??= []);
  bool hasResponses() => _responses != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  static MessagesStruct fromMap(Map<String, dynamic> data) => MessagesStruct(
        author: data['author'] as String?,
        body: data['body'] as String?,
        date: data['date'] as DateTime?,
        photoURL: data['photoURL'] as String?,
        responses: getStructList(
          data['responses'],
          ResponsesStruct.fromMap,
        ),
        uid: data['uid'] as String?,
      );

  static MessagesStruct? maybeFromMap(dynamic data) =>
      data is Map ? MessagesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'author': _author,
        'body': _body,
        'date': _date,
        'photoURL': _photoURL,
        'responses': _responses?.map((e) => e.toMap()).toList(),
        'uid': _uid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'author': serializeParam(
          _author,
          ParamType.String,
        ),
        'body': serializeParam(
          _body,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'photoURL': serializeParam(
          _photoURL,
          ParamType.String,
        ),
        'responses': serializeParam(
          _responses,
          ParamType.DataStruct,
          true,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
      }.withoutNulls;

  static MessagesStruct fromSerializableMap(Map<String, dynamic> data) =>
      MessagesStruct(
        author: deserializeParam(
          data['author'],
          ParamType.String,
          false,
        ),
        body: deserializeParam(
          data['body'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        photoURL: deserializeParam(
          data['photoURL'],
          ParamType.String,
          false,
        ),
        responses: deserializeStructParam<ResponsesStruct>(
          data['responses'],
          ParamType.DataStruct,
          true,
          structBuilder: ResponsesStruct.fromSerializableMap,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MessagesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is MessagesStruct &&
        author == other.author &&
        body == other.body &&
        date == other.date &&
        photoURL == other.photoURL &&
        listEquality.equals(responses, other.responses) &&
        uid == other.uid;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([author, body, date, photoURL, responses, uid]);
}

MessagesStruct createMessagesStruct({
  String? author,
  String? body,
  DateTime? date,
  String? photoURL,
  String? uid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MessagesStruct(
      author: author,
      body: body,
      date: date,
      photoURL: photoURL,
      uid: uid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MessagesStruct? updateMessagesStruct(
  MessagesStruct? messages, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    messages
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMessagesStructData(
  Map<String, dynamic> firestoreData,
  MessagesStruct? messages,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (messages == null) {
    return;
  }
  if (messages.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && messages.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final messagesData = getMessagesFirestoreData(messages, forFieldValue);
  final nestedData = messagesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = messages.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMessagesFirestoreData(
  MessagesStruct? messages, [
  bool forFieldValue = false,
]) {
  if (messages == null) {
    return {};
  }
  final firestoreData = mapToFirestore(messages.toMap());

  // Add any Firestore field values
  messages.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMessagesListFirestoreData(
  List<MessagesStruct>? messagess,
) =>
    messagess?.map((e) => getMessagesFirestoreData(e, true)).toList() ?? [];
