import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MovementsRecord extends FirestoreRecord {
  MovementsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "workoutId" field.
  String? _workoutId;
  String get workoutId => _workoutId ?? '';
  bool hasWorkoutId() => _workoutId != null;

  // "videoId" field.
  String? _videoId;
  String get videoId => _videoId ?? '';
  bool hasVideoId() => _videoId != null;

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  void _initializeFields() {
    _details = snapshotData['details'] as String?;
    _name = snapshotData['name'] as String?;
    _workoutId = snapshotData['workoutId'] as String?;
    _videoId = snapshotData['videoId'] as String?;
    _videoUrl = snapshotData['videoUrl'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('movements');

  static Stream<MovementsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MovementsRecord.fromSnapshot(s));

  static Future<MovementsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MovementsRecord.fromSnapshot(s));

  static MovementsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MovementsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MovementsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MovementsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MovementsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MovementsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMovementsRecordData({
  String? details,
  String? name,
  String? workoutId,
  String? videoId,
  String? videoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'details': details,
      'name': name,
      'workoutId': workoutId,
      'videoId': videoId,
      'videoUrl': videoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class MovementsRecordDocumentEquality implements Equality<MovementsRecord> {
  const MovementsRecordDocumentEquality();

  @override
  bool equals(MovementsRecord? e1, MovementsRecord? e2) {
    return e1?.details == e2?.details &&
        e1?.name == e2?.name &&
        e1?.workoutId == e2?.workoutId &&
        e1?.videoId == e2?.videoId &&
        e1?.videoUrl == e2?.videoUrl;
  }

  @override
  int hash(MovementsRecord? e) => const ListEquality()
      .hash([e?.details, e?.name, e?.workoutId, e?.videoId, e?.videoUrl]);

  @override
  bool isValidKey(Object? o) => o is MovementsRecord;
}
