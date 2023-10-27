import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WorkoutsRecord extends FirestoreRecord {
  WorkoutsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "programId" field.
  String? _programId;
  String get programId => _programId ?? '';
  bool hasProgramId() => _programId != null;

  // "schedule" field.
  ScheduleStruct? _schedule;
  ScheduleStruct get schedule => _schedule ?? ScheduleStruct();
  bool hasSchedule() => _schedule != null;

  // "workoutIndex" field.
  int? _workoutIndex;
  int get workoutIndex => _workoutIndex ?? 0;
  bool hasWorkoutIndex() => _workoutIndex != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "isRestDay" field.
  bool? _isRestDay;
  bool get isRestDay => _isRestDay ?? false;
  bool hasIsRestDay() => _isRestDay != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "exercises" field.
  List<ExercisesStruct>? _exercises;
  List<ExercisesStruct> get exercises => _exercises ?? const [];
  bool hasExercises() => _exercises != null;

  // "usersCompleted" field.
  List<String>? _usersCompleted;
  List<String> get usersCompleted => _usersCompleted ?? const [];
  bool hasUsersCompleted() => _usersCompleted != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _name = snapshotData['name'] as String?;
    _programId = snapshotData['programId'] as String?;
    _schedule = ScheduleStruct.maybeFromMap(snapshotData['schedule']);
    _workoutIndex = castToType<int>(snapshotData['workoutIndex']);
    _date = snapshotData['date'] as DateTime?;
    _isRestDay = snapshotData['isRestDay'] as bool?;
    _id = snapshotData['id'] as String?;
    _exercises = getStructList(
      snapshotData['exercises'],
      ExercisesStruct.fromMap,
    );
    _usersCompleted = getDataList(snapshotData['usersCompleted']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('workouts');

  static Stream<WorkoutsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WorkoutsRecord.fromSnapshot(s));

  static Future<WorkoutsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WorkoutsRecord.fromSnapshot(s));

  static WorkoutsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WorkoutsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WorkoutsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WorkoutsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WorkoutsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WorkoutsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWorkoutsRecordData({
  String? description,
  String? name,
  String? programId,
  ScheduleStruct? schedule,
  int? workoutIndex,
  DateTime? date,
  bool? isRestDay,
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'name': name,
      'programId': programId,
      'schedule': ScheduleStruct().toMap(),
      'workoutIndex': workoutIndex,
      'date': date,
      'isRestDay': isRestDay,
      'id': id,
    }.withoutNulls,
  );

  // Handle nested data for "schedule" field.
  addScheduleStructData(firestoreData, schedule, 'schedule');

  return firestoreData;
}

class WorkoutsRecordDocumentEquality implements Equality<WorkoutsRecord> {
  const WorkoutsRecordDocumentEquality();

  @override
  bool equals(WorkoutsRecord? e1, WorkoutsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.description == e2?.description &&
        e1?.name == e2?.name &&
        e1?.programId == e2?.programId &&
        e1?.schedule == e2?.schedule &&
        e1?.workoutIndex == e2?.workoutIndex &&
        e1?.date == e2?.date &&
        e1?.isRestDay == e2?.isRestDay &&
        e1?.id == e2?.id &&
        listEquality.equals(e1?.exercises, e2?.exercises) &&
        listEquality.equals(e1?.usersCompleted, e2?.usersCompleted);
  }

  @override
  int hash(WorkoutsRecord? e) => const ListEquality().hash([
        e?.description,
        e?.name,
        e?.programId,
        e?.schedule,
        e?.workoutIndex,
        e?.date,
        e?.isRestDay,
        e?.id,
        e?.exercises,
        e?.usersCompleted
      ]);

  @override
  bool isValidKey(Object? o) => o is WorkoutsRecord;
}
