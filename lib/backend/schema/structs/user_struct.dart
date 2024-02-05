// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends FFFirebaseStruct {
  UserStruct({
    String? email,
    String? displayName,
    String? photoUrl,
    String? uid,
    DateTime? createdTime,
    bool? isCoach,
    String? phoneNumber,
    String? coachUid,
    String? currentProgramId,
    bool? isSubbed,
    UserDemographicsStruct? demographics,
    String? currentProgram,
    List<WeightHistoryStruct>? weightHistory,
    MacrosStruct? macros,
    int? readMessages,
    String? favoriteCoach,
    List<String>? completedWorkouts,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _email = email,
        _displayName = displayName,
        _photoUrl = photoUrl,
        _uid = uid,
        _createdTime = createdTime,
        _isCoach = isCoach,
        _phoneNumber = phoneNumber,
        _coachUid = coachUid,
        _currentProgramId = currentProgramId,
        _isSubbed = isSubbed,
        _demographics = demographics,
        _currentProgram = currentProgram,
        _weightHistory = weightHistory,
        _macros = macros,
        _readMessages = readMessages,
        _favoriteCoach = favoriteCoach,
        _completedWorkouts = completedWorkouts,
        super(firestoreUtilData);

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  set displayName(String? val) => _displayName = val;
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  set photoUrl(String? val) => _photoUrl = val;
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  set createdTime(DateTime? val) => _createdTime = val;
  bool hasCreatedTime() => _createdTime != null;

  // "isCoach" field.
  bool? _isCoach;
  bool get isCoach => _isCoach ?? false;
  set isCoach(bool? val) => _isCoach = val;
  bool hasIsCoach() => _isCoach != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  set phoneNumber(String? val) => _phoneNumber = val;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "coachUid" field.
  String? _coachUid;
  String get coachUid => _coachUid ?? '';
  set coachUid(String? val) => _coachUid = val;
  bool hasCoachUid() => _coachUid != null;

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

  // "demographics" field.
  UserDemographicsStruct? _demographics;
  UserDemographicsStruct get demographics =>
      _demographics ?? UserDemographicsStruct();
  set demographics(UserDemographicsStruct? val) => _demographics = val;
  void updateDemographics(Function(UserDemographicsStruct) updateFn) =>
      updateFn(_demographics ??= UserDemographicsStruct());
  bool hasDemographics() => _demographics != null;

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

  // "macros" field.
  MacrosStruct? _macros;
  MacrosStruct get macros => _macros ?? MacrosStruct();
  set macros(MacrosStruct? val) => _macros = val;
  void updateMacros(Function(MacrosStruct) updateFn) =>
      updateFn(_macros ??= MacrosStruct());
  bool hasMacros() => _macros != null;

  // "readMessages" field.
  int? _readMessages;
  int get readMessages => _readMessages ?? 0;
  set readMessages(int? val) => _readMessages = val;
  void incrementReadMessages(int amount) =>
      _readMessages = readMessages + amount;
  bool hasReadMessages() => _readMessages != null;

  // "favoriteCoach" field.
  String? _favoriteCoach;
  String get favoriteCoach => _favoriteCoach ?? '';
  set favoriteCoach(String? val) => _favoriteCoach = val;
  bool hasFavoriteCoach() => _favoriteCoach != null;

  // "completedWorkouts" field.
  List<String>? _completedWorkouts;
  List<String> get completedWorkouts => _completedWorkouts ?? const [];
  set completedWorkouts(List<String>? val) => _completedWorkouts = val;
  void updateCompletedWorkouts(Function(List<String>) updateFn) =>
      updateFn(_completedWorkouts ??= []);
  bool hasCompletedWorkouts() => _completedWorkouts != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        email: data['email'] as String?,
        displayName: data['display_name'] as String?,
        photoUrl: data['photo_url'] as String?,
        uid: data['uid'] as String?,
        createdTime: data['created_time'] as DateTime?,
        isCoach: data['isCoach'] as bool?,
        phoneNumber: data['phone_number'] as String?,
        coachUid: data['coachUid'] as String?,
        currentProgramId: data['currentProgramId'] as String?,
        isSubbed: data['isSubbed'] as bool?,
        demographics: UserDemographicsStruct.maybeFromMap(data['demographics']),
        currentProgram: data['currentProgram'] as String?,
        weightHistory: getStructList(
          data['weightHistory'],
          WeightHistoryStruct.fromMap,
        ),
        macros: MacrosStruct.maybeFromMap(data['macros']),
        readMessages: castToType<int>(data['readMessages']),
        favoriteCoach: data['favoriteCoach'] as String?,
        completedWorkouts: getDataList(data['completedWorkouts']),
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'display_name': _displayName,
        'photo_url': _photoUrl,
        'uid': _uid,
        'created_time': _createdTime,
        'isCoach': _isCoach,
        'phone_number': _phoneNumber,
        'coachUid': _coachUid,
        'currentProgramId': _currentProgramId,
        'isSubbed': _isSubbed,
        'demographics': _demographics?.toMap(),
        'currentProgram': _currentProgram,
        'weightHistory': _weightHistory?.map((e) => e.toMap()).toList(),
        'macros': _macros?.toMap(),
        'readMessages': _readMessages,
        'favoriteCoach': _favoriteCoach,
        'completedWorkouts': _completedWorkouts,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'display_name': serializeParam(
          _displayName,
          ParamType.String,
        ),
        'photo_url': serializeParam(
          _photoUrl,
          ParamType.String,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'created_time': serializeParam(
          _createdTime,
          ParamType.DateTime,
        ),
        'isCoach': serializeParam(
          _isCoach,
          ParamType.bool,
        ),
        'phone_number': serializeParam(
          _phoneNumber,
          ParamType.String,
        ),
        'coachUid': serializeParam(
          _coachUid,
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
        'demographics': serializeParam(
          _demographics,
          ParamType.DataStruct,
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
        'macros': serializeParam(
          _macros,
          ParamType.DataStruct,
        ),
        'readMessages': serializeParam(
          _readMessages,
          ParamType.int,
        ),
        'favoriteCoach': serializeParam(
          _favoriteCoach,
          ParamType.String,
        ),
        'completedWorkouts': serializeParam(
          _completedWorkouts,
          ParamType.String,
          true,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        displayName: deserializeParam(
          data['display_name'],
          ParamType.String,
          false,
        ),
        photoUrl: deserializeParam(
          data['photo_url'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        createdTime: deserializeParam(
          data['created_time'],
          ParamType.DateTime,
          false,
        ),
        isCoach: deserializeParam(
          data['isCoach'],
          ParamType.bool,
          false,
        ),
        phoneNumber: deserializeParam(
          data['phone_number'],
          ParamType.String,
          false,
        ),
        coachUid: deserializeParam(
          data['coachUid'],
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
        demographics: deserializeStructParam(
          data['demographics'],
          ParamType.DataStruct,
          false,
          structBuilder: UserDemographicsStruct.fromSerializableMap,
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
        macros: deserializeStructParam(
          data['macros'],
          ParamType.DataStruct,
          false,
          structBuilder: MacrosStruct.fromSerializableMap,
        ),
        readMessages: deserializeParam(
          data['readMessages'],
          ParamType.int,
          false,
        ),
        favoriteCoach: deserializeParam(
          data['favoriteCoach'],
          ParamType.String,
          false,
        ),
        completedWorkouts: deserializeParam<String>(
          data['completedWorkouts'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        email == other.email &&
        displayName == other.displayName &&
        photoUrl == other.photoUrl &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        isCoach == other.isCoach &&
        phoneNumber == other.phoneNumber &&
        coachUid == other.coachUid &&
        currentProgramId == other.currentProgramId &&
        isSubbed == other.isSubbed &&
        demographics == other.demographics &&
        currentProgram == other.currentProgram &&
        listEquality.equals(weightHistory, other.weightHistory) &&
        macros == other.macros &&
        readMessages == other.readMessages &&
        favoriteCoach == other.favoriteCoach &&
        listEquality.equals(completedWorkouts, other.completedWorkouts);
  }

  @override
  int get hashCode => const ListEquality().hash([
        email,
        displayName,
        photoUrl,
        uid,
        createdTime,
        isCoach,
        phoneNumber,
        coachUid,
        currentProgramId,
        isSubbed,
        demographics,
        currentProgram,
        weightHistory,
        macros,
        readMessages,
        favoriteCoach,
        completedWorkouts
      ]);
}

UserStruct createUserStruct({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  bool? isCoach,
  String? phoneNumber,
  String? coachUid,
  String? currentProgramId,
  bool? isSubbed,
  UserDemographicsStruct? demographics,
  String? currentProgram,
  MacrosStruct? macros,
  int? readMessages,
  String? favoriteCoach,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserStruct(
      email: email,
      displayName: displayName,
      photoUrl: photoUrl,
      uid: uid,
      createdTime: createdTime,
      isCoach: isCoach,
      phoneNumber: phoneNumber,
      coachUid: coachUid,
      currentProgramId: currentProgramId,
      isSubbed: isSubbed,
      demographics:
          demographics ?? (clearUnsetFields ? UserDemographicsStruct() : null),
      currentProgram: currentProgram,
      macros: macros ?? (clearUnsetFields ? MacrosStruct() : null),
      readMessages: readMessages,
      favoriteCoach: favoriteCoach,
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

  // Handle nested data for "demographics" field.
  addUserDemographicsStructData(
    firestoreData,
    user.hasDemographics() ? user.demographics : null,
    'demographics',
    forFieldValue,
  );

  // Handle nested data for "macros" field.
  addMacrosStructData(
    firestoreData,
    user.hasMacros() ? user.macros : null,
    'macros',
    forFieldValue,
  );

  // Add any Firestore field values
  user.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserListFirestoreData(
  List<UserStruct>? users,
) =>
    users?.map((e) => getUserFirestoreData(e, true)).toList() ?? [];
