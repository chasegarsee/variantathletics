import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessagesRecord extends FirestoreRecord {
  MessagesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "photoURL" field.
  String? _photoURL;
  String get photoURL => _photoURL ?? '';
  bool hasPhotoURL() => _photoURL != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "responses" field.
  List<ResponsesStruct>? _responses;
  List<ResponsesStruct> get responses => _responses ?? const [];
  bool hasResponses() => _responses != null;

  void _initializeFields() {
    _author = snapshotData['author'] as String?;
    _body = snapshotData['body'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _photoURL = snapshotData['photoURL'] as String?;
    _uid = snapshotData['uid'] as String?;
    _responses = getStructList(
      snapshotData['responses'],
      ResponsesStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('messages');

  static Stream<MessagesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessagesRecord.fromSnapshot(s));

  static Future<MessagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessagesRecord.fromSnapshot(s));

  static MessagesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessagesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessagesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessagesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessagesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MessagesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMessagesRecordData({
  String? author,
  String? body,
  DateTime? date,
  String? photoURL,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'author': author,
      'body': body,
      'date': date,
      'photoURL': photoURL,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class MessagesRecordDocumentEquality implements Equality<MessagesRecord> {
  const MessagesRecordDocumentEquality();

  @override
  bool equals(MessagesRecord? e1, MessagesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.author == e2?.author &&
        e1?.body == e2?.body &&
        e1?.date == e2?.date &&
        e1?.photoURL == e2?.photoURL &&
        e1?.uid == e2?.uid &&
        listEquality.equals(e1?.responses, e2?.responses);
  }

  @override
  int hash(MessagesRecord? e) => const ListEquality()
      .hash([e?.author, e?.body, e?.date, e?.photoURL, e?.uid, e?.responses]);

  @override
  bool isValidKey(Object? o) => o is MessagesRecord;
}
