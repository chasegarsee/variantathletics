import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkoutCommentsRecord extends FirestoreRecord {
  WorkoutCommentsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "dateTime" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "workoutId" field.
  String? _workoutId;
  String get workoutId => _workoutId ?? '';
  bool hasWorkoutId() => _workoutId != null;

  void _initializeFields() {
    _comment = snapshotData['comment'] as String?;
    _dateTime = snapshotData['dateTime'] as DateTime?;
    _name = snapshotData['name'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
    _uid = snapshotData['uid'] as String?;
    _workoutId = snapshotData['workoutId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('workoutComments');

  static Stream<WorkoutCommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkoutCommentsRecord.fromSnapshot(s));

  static Future<WorkoutCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkoutCommentsRecord.fromSnapshot(s));

  static WorkoutCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkoutCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkoutCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkoutCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkoutCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkoutCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkoutCommentsRecordData({
  String? comment,
  DateTime? dateTime,
  String? name,
  int? rating,
  String? uid,
  String? workoutId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'comment': comment,
      'dateTime': dateTime,
      'name': name,
      'rating': rating,
      'uid': uid,
      'workoutId': workoutId,
    }.withoutNulls,
  );

  return firestoreData;
}

class WorkoutCommentsRecordDocumentEquality
    implements Equality<WorkoutCommentsRecord> {
  const WorkoutCommentsRecordDocumentEquality();

  @override
  bool equals(WorkoutCommentsRecord? e1, WorkoutCommentsRecord? e2) {
    return e1?.comment == e2?.comment &&
        e1?.dateTime == e2?.dateTime &&
        e1?.name == e2?.name &&
        e1?.rating == e2?.rating &&
        e1?.uid == e2?.uid &&
        e1?.workoutId == e2?.workoutId;
  }

  @override
  int hash(WorkoutCommentsRecord? e) => const ListEquality().hash(
      [e?.comment, e?.dateTime, e?.name, e?.rating, e?.uid, e?.workoutId]);

  @override
  bool isValidKey(Object? o) => o is WorkoutCommentsRecord;
}
