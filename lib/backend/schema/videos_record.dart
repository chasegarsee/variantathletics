import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideosRecord extends FirestoreRecord {
  VideosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "createdAt" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "workoutId" field.
  String? _workoutId;
  String get workoutId => _workoutId ?? '';
  bool hasWorkoutId() => _workoutId != null;

  // "movementId" field.
  String? _movementId;
  String get movementId => _movementId ?? '';
  bool hasMovementId() => _movementId != null;

  // "programId" field.
  String? _programId;
  String get programId => _programId ?? '';
  bool hasProgramId() => _programId != null;

  void _initializeFields() {
    _createdAt = snapshotData['createdAt'] as DateTime?;
    _videoUrl = snapshotData['videoUrl'] as String?;
    _workoutId = snapshotData['workoutId'] as String?;
    _movementId = snapshotData['movementId'] as String?;
    _programId = snapshotData['programId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('videos');

  static Stream<VideosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VideosRecord.fromSnapshot(s));

  static Future<VideosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VideosRecord.fromSnapshot(s));

  static VideosRecord fromSnapshot(DocumentSnapshot snapshot) => VideosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VideosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VideosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VideosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VideosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVideosRecordData({
  DateTime? createdAt,
  String? videoUrl,
  String? workoutId,
  String? movementId,
  String? programId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdAt': createdAt,
      'videoUrl': videoUrl,
      'workoutId': workoutId,
      'movementId': movementId,
      'programId': programId,
    }.withoutNulls,
  );

  return firestoreData;
}

class VideosRecordDocumentEquality implements Equality<VideosRecord> {
  const VideosRecordDocumentEquality();

  @override
  bool equals(VideosRecord? e1, VideosRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.videoUrl == e2?.videoUrl &&
        e1?.workoutId == e2?.workoutId &&
        e1?.movementId == e2?.movementId &&
        e1?.programId == e2?.programId;
  }

  @override
  int hash(VideosRecord? e) => const ListEquality().hash(
      [e?.createdAt, e?.videoUrl, e?.workoutId, e?.movementId, e?.programId]);

  @override
  bool isValidKey(Object? o) => o is VideosRecord;
}
