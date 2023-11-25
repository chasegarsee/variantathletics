import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PdfFileNamesRecord extends FirestoreRecord {
  PdfFileNamesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "names" field.
  List<String>? _names;
  List<String> get names => _names ?? const [];
  bool hasNames() => _names != null;

  void _initializeFields() {
    _names = getDataList(snapshotData['names']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('pdfFileNames');

  static Stream<PdfFileNamesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PdfFileNamesRecord.fromSnapshot(s));

  static Future<PdfFileNamesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PdfFileNamesRecord.fromSnapshot(s));

  static PdfFileNamesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PdfFileNamesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PdfFileNamesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PdfFileNamesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PdfFileNamesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PdfFileNamesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPdfFileNamesRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class PdfFileNamesRecordDocumentEquality
    implements Equality<PdfFileNamesRecord> {
  const PdfFileNamesRecordDocumentEquality();

  @override
  bool equals(PdfFileNamesRecord? e1, PdfFileNamesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.names, e2?.names);
  }

  @override
  int hash(PdfFileNamesRecord? e) => const ListEquality().hash([e?.names]);

  @override
  bool isValidKey(Object? o) => o is PdfFileNamesRecord;
}
