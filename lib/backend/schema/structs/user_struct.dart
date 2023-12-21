// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends FFFirebaseStruct {
  UserStruct({
    String? coachUid,
    DateTime? createdTime,
    String? displayName,
    String? email,
    bool? isCoach,
    String? uid,
    List<String>? completedWorkouts,
    String? favoriteCoach,
    String? currentProgramId,
    bool? isSubbed,
    String? currentProgram,
    List<WeightHistoryStruct>? weightHistory,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _coachUid = coachUid,
        _createdTime = createdTime,
        _displayName = displayName,
        _email = email,
        _isCoach = isCoach,
        _uid = uid,
        _completedWorkouts = completedWorkouts,
        _favoriteCoach = favoriteCoach,
        _currentProgramId = currentProgramId,
        _isSubbed = isSubbed,
        _currentProgram = currentProgram,
        _weightHistory = weightHistory,
        super(firestoreUtilData);

  // "coachUid" field.
  String? _coachUid;
  String get coachUid => _coachUid ?? '';
  set coachUid(String? val) => _coachUid = val;
  bool hasCoachUid() => _coachUid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;
  bool hasCreatedTime() => _createdTime != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;
  bool hasDisplayName() => _displayName != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "isCoach" field.
  bool? _isCoach;
  bool get isCoach => _isCoach ?? false;
  set isCoach(bool? val) => _isCoach = val;
  bool hasIsCoach() => _isCoach != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  // "completedWorkouts" field.
  List<String>? _completedWorkouts;
  List<String> get completedWorkouts => _completedWorkouts ?? const [];
  set completedWorkouts(List<String>? val) => _completedWorkouts = val;
  void updateCompletedWorkouts(Function(List<String>) updateFn) =>
      updateFn(_completedWorkouts ??= []);
  bool hasCompletedWorkouts() => _completedWorkouts != null;

  // "favoriteCoach" field.
  String? _favoriteCoach;
  String get favoriteCoach => _favoriteCoach ?? '';
  set favoriteCoach(String? val) => _favoriteCoach = val;
  bool hasFavoriteCoach() => _favoriteCoach != null;

  // "currentProgramId" field.
  String? _currentProgramId;
  String get currentProgramId => _currentProgramId ?? '';
  set currentProgramId(String? val) => _currentProgramId = val;
  bool hasCurrentProgramId() => _currentProgramId != null;

  // "isSubbed" field.
  bool? _isSubbed;
  bool get isSubbed => _isSubbed ?? false;
  set isSubbed(bool? val) => _isSubbed = val;
  bool hasIsSubbed() => _isSubbed != null;

  // "currentProgram" field.
  String? _currentProgram;
  String get currentProgram => _currentProgram ?? '';
  set currentProgram(String? val) => _currentProgram = val;
  bool hasCurrentProgram() => _currentProgram != null;

  // "weightHistory" field.
  List<WeightHistoryStruct>? _weightHistory;
  List<WeightHistoryStruct> get weightHistory => _weightHistory ?? const [];
  set weightHistory(List<WeightHistoryStruct>? val) => _weightHistory = val;
  void updateWeightHistory(Function(List<WeightHistoryStruct>) updateFn) =>
      updateFn(_weightHistory ??= []);
  bool hasWeightHistory() => _weightHistory != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        coachUid: data['coachUid'] as String?,
        createdTime: data['created_time'] as DateTime?,
        displayName: data['display_name'] as String?,
        email: data['email'] as String?,
        isCoach: data['isCoach'] as bool?,
        uid: data['uid'] as String?,
        completedWorkouts: getDataList(data['completedWorkouts']),
        favoriteCoach: data['favoriteCoach'] as String?,
        currentProgramId: data['currentProgramId'] as String?,
        isSubbed: data['isSubbed'] as bool?,
        currentProgram: data['currentProgram'] as String?,
        weightHistory: getStructList(
          data['weightHistory'],
          WeightHistoryStruct.fromMap,
        ),
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'coachUid': _coachUid,
        'created_time': _createdTime,
        'display_name': _displayName,
        'email': _email,
        'isCoach': _isCoach,
        'uid': _uid,
        'completedWorkouts': _completedWorkouts,
        'favoriteCoach': _favoriteCoach,
        'currentProgramId': _currentProgramId,
        'isSubbed': _isSubbed,
        'currentProgram': _currentProgram,
        'weightHistory': _weightHistory?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'coachUid': serializeParam(
          _coachUid,
          ParamType.String,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'isCoach': serializeParam(
          _isCoach,
          ParamType.bool,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'completedWorkouts': serializeParam(
          _completedWorkouts,
          ParamType.String,
          true,
        ),
        'favoriteCoach': serializeParam(
          _favoriteCoach,
          ParamType.String,
        ),
        'currentProgramId': serializeParam(
          _currentProgramId,
          ParamType.String,
        ),
        'isSubbed': serializeParam(
          _isSubbed,
          ParamType.bool,
        ),
        'currentProgram': serializeParam(
          _currentProgram,
          ParamType.String,
        ),
        'weightHistory': serializeParam(
          _weightHistory,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        coachUid: deserializeParam(
          data['coachUid'],
          ParamType.String,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        isCoach: deserializeParam(
          data['isCoach'],
          ParamType.bool,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        completedWorkouts: deserializeParam<String>(
          data['completedWorkouts'],
          ParamType.String,
          true,
        ),
        favoriteCoach: deserializeParam(
          data['favoriteCoach'],
          ParamType.String,
          false,
        ),
        currentProgramId: deserializeParam(
          data['currentProgramId'],
          ParamType.String,
          false,
        ),
        isSubbed: deserializeParam(
          data['isSubbed'],
          ParamType.bool,
          false,
        ),
        currentProgram: deserializeParam(
          data['currentProgram'],
          ParamType.String,
          false,
        ),
        weightHistory: deserializeStructParam<WeightHistoryStruct>(
          data['weightHistory'],
          ParamType.DataStruct,
          true,
          structBuilder: WeightHistoryStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        coachUid == other.coachUid &&
        createdTime == other.createdTime &&
        displayName == other.displayName &&
        email == other.email &&
        isCoach == other.isCoach &&
        uid == other.uid &&
        listEquality.equals(completedWorkouts, other.completedWorkouts) &&
        favoriteCoach == other.favoriteCoach &&
        currentProgramId == other.currentProgramId &&
        isSubbed == other.isSubbed &&
        currentProgram == other.currentProgram &&
        listEquality.equals(weightHistory, other.weightHistory);
  }

  @override
  int get hashCode => const ListEquality().hash([
        coachUid,
        createdTime,
        displayName,
        email,
        isCoach,
        uid,
        completedWorkouts,
        favoriteCoach,
        currentProgramId,
        isSubbed,
        currentProgram,
        weightHistory
      ]);
}

UserStruct createUserStruct({
  String? coachUid,
  DateTime? createdTime,
  String? displayName,
  String? email,
  bool? isCoach,
  String? uid,
  String? favoriteCoach,
  String? currentProgramId,
  bool? isSubbed,
  String? currentProgram,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserStruct(
      coachUid: coachUid,
      createdTime: createdTime,
      displayName: displayName,
      email: email,
      isCoach: isCoach,
      uid: uid,
      favoriteCoach: favoriteCoach,
      currentProgramId: currentProgramId,
      isSubbed: isSubbed,
      currentProgram: currentProgram,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserStruct? updateUserStruct(
  UserStruct? user, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    user
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserStructData(
  Map<String, dynamic> firestoreData,
  UserStruct? user,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (user == null) {
    return;
  }
  if (user.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && user.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userData = getUserFirestoreData(user, forFieldValue);
  final nestedData = userData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = user.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserFirestoreData(
  UserStruct? user, [
  bool forFieldValue = false,
]) {
  if (user == null) {
    return {};
  }
  final firestoreData = mapToFirestore(user.toMap());

  // Add any Firestore field values
  user.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserListFirestoreData(
  List<UserStruct>? users,
) =>
    users?.map((e) => getUserFirestoreData(e, true)).toList() ?? [];
