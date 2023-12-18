import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "isCoach" field.
  bool? _isCoach;
  bool get isCoach => _isCoach ?? false;
  bool hasIsCoach() => _isCoach != null;

  // "currentProgramId" field.
  String? _currentProgramId;
  String get currentProgramId => _currentProgramId ?? '';
  bool hasCurrentProgramId() => _currentProgramId != null;

  // "exercises" field.
  List<ExercisesStruct>? _exercises;
  List<ExercisesStruct> get exercises => _exercises ?? const [];
  bool hasExercises() => _exercises != null;

  // "completedWorkouts" field.
  List<CompletedWorkoutsStruct>? _completedWorkouts;
  List<CompletedWorkoutsStruct> get completedWorkouts =>
      _completedWorkouts ?? const [];
  bool hasCompletedWorkouts() => _completedWorkouts != null;

  // "isSubbed" field.
  bool? _isSubbed;
  bool get isSubbed => _isSubbed ?? false;
  bool hasIsSubbed() => _isSubbed != null;

  // "demographics" field.
  UserDemographicsStruct? _demographics;
  UserDemographicsStruct get demographics =>
      _demographics ?? UserDemographicsStruct();
  bool hasDemographics() => _demographics != null;

  // "currentProgram" field.
  String? _currentProgram;
  String get currentProgram => _currentProgram ?? '';
  bool hasCurrentProgram() => _currentProgram != null;

  // "weightHistory" field.
  List<WeightHistoryStruct>? _weightHistory;
  List<WeightHistoryStruct> get weightHistory => _weightHistory ?? const [];
  bool hasWeightHistory() => _weightHistory != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _isCoach = snapshotData['isCoach'] as bool?;
    _currentProgramId = snapshotData['currentProgramId'] as String?;
    _exercises = getStructList(
      snapshotData['exercises'],
      ExercisesStruct.fromMap,
    );
    _completedWorkouts = getStructList(
      snapshotData['completedWorkouts'],
      CompletedWorkoutsStruct.fromMap,
    );
    _isSubbed = snapshotData['isSubbed'] as bool?;
    _demographics =
        UserDemographicsStruct.maybeFromMap(snapshotData['demographics']);
    _currentProgram = snapshotData['currentProgram'] as String?;
    _weightHistory = getStructList(
      snapshotData['weightHistory'],
      WeightHistoryStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? isCoach,
  String? currentProgramId,
  bool? isSubbed,
  UserDemographicsStruct? demographics,
  String? currentProgram,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'isCoach': isCoach,
      'currentProgramId': currentProgramId,
      'isSubbed': isSubbed,
      'demographics': UserDemographicsStruct().toMap(),
      'currentProgram': currentProgram,
    }.withoutNulls,
  );

  // Handle nested data for "demographics" field.
  addUserDemographicsStructData(firestoreData, demographics, 'demographics');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.isCoach == e2?.isCoach &&
        e1?.currentProgramId == e2?.currentProgramId &&
        listEquality.equals(e1?.exercises, e2?.exercises) &&
        listEquality.equals(e1?.completedWorkouts, e2?.completedWorkouts) &&
        e1?.isSubbed == e2?.isSubbed &&
        e1?.demographics == e2?.demographics &&
        e1?.currentProgram == e2?.currentProgram &&
        listEquality.equals(e1?.weightHistory, e2?.weightHistory);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.isCoach,
        e?.currentProgramId,
        e?.exercises,
        e?.completedWorkouts,
        e?.isSubbed,
        e?.demographics,
        e?.currentProgram,
        e?.weightHistory
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
