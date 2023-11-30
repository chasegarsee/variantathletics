import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProgramsRecord extends FirestoreRecord {
  ProgramsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "isLive" field.
  bool? _isLive;
  bool get isLive => _isLive ?? false;
  bool hasIsLive() => _isLive != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "weeks" field.
  List<WeeksStruct>? _weeks;
  List<WeeksStruct> get weeks => _weeks ?? const [];
  bool hasWeeks() => _weeks != null;

  // "liveDate" field.
  DateTime? _liveDate;
  DateTime? get liveDate => _liveDate;
  bool hasLiveDate() => _liveDate != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _isLive = snapshotData['isLive'] as bool?;
    _id = snapshotData['id'] as String?;
    _weeks = getStructList(
      snapshotData['weeks'],
      WeeksStruct.fromMap,
    );
    _liveDate = snapshotData['liveDate'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('programs');

  static Stream<ProgramsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProgramsRecord.fromSnapshot(s));

  static Future<ProgramsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProgramsRecord.fromSnapshot(s));

  static ProgramsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProgramsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProgramsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProgramsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProgramsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProgramsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProgramsRecordData({
  String? name,
  bool? isLive,
  String? id,
  DateTime? liveDate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'isLive': isLive,
      'id': id,
      'liveDate': liveDate,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProgramsRecordDocumentEquality implements Equality<ProgramsRecord> {
  const ProgramsRecordDocumentEquality();

  @override
  bool equals(ProgramsRecord? e1, ProgramsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.isLive == e2?.isLive &&
        e1?.id == e2?.id &&
        listEquality.equals(e1?.weeks, e2?.weeks) &&
        e1?.liveDate == e2?.liveDate;
  }

  @override
  int hash(ProgramsRecord? e) => const ListEquality()
      .hash([e?.name, e?.isLive, e?.id, e?.weeks, e?.liveDate]);

  @override
  bool isValidKey(Object? o) => o is ProgramsRecord;
}
