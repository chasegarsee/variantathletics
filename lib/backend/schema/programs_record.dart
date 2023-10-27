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

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "programPhotoUrl" field.
  String? _programPhotoUrl;
  String get programPhotoUrl => _programPhotoUrl ?? '';
  bool hasProgramPhotoUrl() => _programPhotoUrl != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  bool hasColor() => _color != null;

  // "photoBlurHash" field.
  String? _photoBlurHash;
  String get photoBlurHash => _photoBlurHash ?? '';
  bool hasPhotoBlurHash() => _photoBlurHash != null;

  // "length" field.
  String? _length;
  String get length => _length ?? '';
  bool hasLength() => _length != null;

  // "isLive" field.
  bool? _isLive;
  bool get isLive => _isLive ?? false;
  bool hasIsLive() => _isLive != null;

  // "isDailyWorkout" field.
  bool? _isDailyWorkout;
  bool get isDailyWorkout => _isDailyWorkout ?? false;
  bool hasIsDailyWorkout() => _isDailyWorkout != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  void _initializeFields() {
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _name = snapshotData['name'] as String?;
    _programPhotoUrl = snapshotData['programPhotoUrl'] as String?;
    _color = snapshotData['color'] as String?;
    _photoBlurHash = snapshotData['photoBlurHash'] as String?;
    _length = snapshotData['length'] as String?;
    _isLive = snapshotData['isLive'] as bool?;
    _isDailyWorkout = snapshotData['isDailyWorkout'] as bool?;
    _id = snapshotData['id'] as String?;
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
  DateTime? createdAt,
  String? description,
  String? name,
  String? programPhotoUrl,
  String? color,
  String? photoBlurHash,
  String? length,
  bool? isLive,
  bool? isDailyWorkout,
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdAt': createdAt,
      'description': description,
      'name': name,
      'programPhotoUrl': programPhotoUrl,
      'color': color,
      'photoBlurHash': photoBlurHash,
      'length': length,
      'isLive': isLive,
      'isDailyWorkout': isDailyWorkout,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProgramsRecordDocumentEquality implements Equality<ProgramsRecord> {
  const ProgramsRecordDocumentEquality();

  @override
  bool equals(ProgramsRecord? e1, ProgramsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.description == e2?.description &&
        e1?.name == e2?.name &&
        e1?.programPhotoUrl == e2?.programPhotoUrl &&
        e1?.color == e2?.color &&
        e1?.photoBlurHash == e2?.photoBlurHash &&
        e1?.length == e2?.length &&
        e1?.isLive == e2?.isLive &&
        e1?.isDailyWorkout == e2?.isDailyWorkout &&
        e1?.id == e2?.id;
  }

  @override
  int hash(ProgramsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.description,
        e?.name,
        e?.programPhotoUrl,
        e?.color,
        e?.photoBlurHash,
        e?.length,
        e?.isLive,
        e?.isDailyWorkout,
        e?.id
      ]);

  @override
  bool isValidKey(Object? o) => o is ProgramsRecord;
}
