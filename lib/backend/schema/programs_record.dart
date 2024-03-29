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

  // "isDaily" field.
  bool? _isDaily;
  bool get isDaily => _isDaily ?? false;
  bool hasIsDaily() => _isDaily != null;

  // "thumbnailURL" field.
  String? _thumbnailURL;
  String get thumbnailURL => _thumbnailURL ?? '';
  bool hasThumbnailURL() => _thumbnailURL != null;

  // "clientIds" field.
  List<String>? _clientIds;
  List<String> get clientIds => _clientIds ?? const [];
  bool hasClientIds() => _clientIds != null;

  // "custom" field.
  bool? _custom;
  bool get custom => _custom ?? false;
  bool hasCustom() => _custom != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _isLive = snapshotData['isLive'] as bool?;
    _id = snapshotData['id'] as String?;
    _weeks = getStructList(
      snapshotData['weeks'],
      WeeksStruct.fromMap,
    );
    _liveDate = snapshotData['liveDate'] as DateTime?;
    _isDaily = snapshotData['isDaily'] as bool?;
    _thumbnailURL = snapshotData['thumbnailURL'] as String?;
    _clientIds = getDataList(snapshotData['clientIds']);
    _custom = snapshotData['custom'] as bool?;
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
  bool? isDaily,
  String? thumbnailURL,
  bool? custom,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'isLive': isLive,
      'id': id,
      'liveDate': liveDate,
      'isDaily': isDaily,
      'thumbnailURL': thumbnailURL,
      'custom': custom,
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
        e1?.liveDate == e2?.liveDate &&
        e1?.isDaily == e2?.isDaily &&
        e1?.thumbnailURL == e2?.thumbnailURL &&
        listEquality.equals(e1?.clientIds, e2?.clientIds) &&
        e1?.custom == e2?.custom;
  }

  @override
  int hash(ProgramsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.isLive,
        e?.id,
        e?.weeks,
        e?.liveDate,
        e?.isDaily,
        e?.thumbnailURL,
        e?.clientIds,
        e?.custom
      ]);

  @override
  bool isValidKey(Object? o) => o is ProgramsRecord;
}
