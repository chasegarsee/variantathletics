import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StreaksRecord extends FirestoreRecord {
  StreaksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "endDate" field.
  DateTime? _endDate;
  DateTime? get endDate => _endDate;
  bool hasEndDate() => _endDate != null;

  // "startDate" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  bool hasStartDate() => _startDate != null;

  // "streakCount" field.
  int? _streakCount;
  int get streakCount => _streakCount ?? 0;
  bool hasStreakCount() => _streakCount != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "workoutId" field.
  String? _workoutId;
  String get workoutId => _workoutId ?? '';
  bool hasWorkoutId() => _workoutId != null;

  void _initializeFields() {
    _endDate = snapshotData['endDate'] as DateTime?;
    _startDate = snapshotData['startDate'] as DateTime?;
    _streakCount = castToType<int>(snapshotData['streakCount']);
    _userId = snapshotData['userId'] as String?;
    _workoutId = snapshotData['workoutId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('streaks');

  static Stream<StreaksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StreaksRecord.fromSnapshot(s));

  static Future<StreaksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StreaksRecord.fromSnapshot(s));

  static StreaksRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StreaksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StreaksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StreaksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StreaksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StreaksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStreaksRecordData({
  DateTime? endDate,
  DateTime? startDate,
  int? streakCount,
  String? userId,
  String? workoutId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'endDate': endDate,
      'startDate': startDate,
      'streakCount': streakCount,
      'userId': userId,
      'workoutId': workoutId,
    }.withoutNulls,
  );

  return firestoreData;
}

class StreaksRecordDocumentEquality implements Equality<StreaksRecord> {
  const StreaksRecordDocumentEquality();

  @override
  bool equals(StreaksRecord? e1, StreaksRecord? e2) {
    return e1?.endDate == e2?.endDate &&
        e1?.startDate == e2?.startDate &&
        e1?.streakCount == e2?.streakCount &&
        e1?.userId == e2?.userId &&
        e1?.workoutId == e2?.workoutId;
  }

  @override
  int hash(StreaksRecord? e) => const ListEquality().hash(
      [e?.endDate, e?.startDate, e?.streakCount, e?.userId, e?.workoutId]);

  @override
  bool isValidKey(Object? o) => o is StreaksRecord;
}
