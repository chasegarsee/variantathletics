// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDemographicsStruct extends FFFirebaseStruct {
  UserDemographicsStruct({
    int? age,
    int? height,
    int? weight,
    int? gender,
    int? activityLevel,
    int? goal,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _age = age,
        _height = height,
        _weight = weight,
        _gender = gender,
        _activityLevel = activityLevel,
        _goal = goal,
        super(firestoreUtilData);

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  set age(int? val) => _age = val;
  void incrementAge(int amount) => _age = age + amount;
  bool hasAge() => _age != null;

  // "height" field.
  int? _height;
  int get height => _height ?? 0;
  set height(int? val) => _height = val;
  void incrementHeight(int amount) => _height = height + amount;
  bool hasHeight() => _height != null;

  // "weight" field.
  int? _weight;
  int get weight => _weight ?? 0;
  set weight(int? val) => _weight = val;
  void incrementWeight(int amount) => _weight = weight + amount;
  bool hasWeight() => _weight != null;

  // "gender" field.
  int? _gender;
  int get gender => _gender ?? 0;
  set gender(int? val) => _gender = val;
  void incrementGender(int amount) => _gender = gender + amount;
  bool hasGender() => _gender != null;

  // "activityLevel" field.
  int? _activityLevel;
  int get activityLevel => _activityLevel ?? 0;
  set activityLevel(int? val) => _activityLevel = val;
  void incrementActivityLevel(int amount) =>
      _activityLevel = activityLevel + amount;
  bool hasActivityLevel() => _activityLevel != null;

  // "goal" field.
  int? _goal;
  int get goal => _goal ?? 0;
  set goal(int? val) => _goal = val;
  void incrementGoal(int amount) => _goal = goal + amount;
  bool hasGoal() => _goal != null;

  static UserDemographicsStruct fromMap(Map<String, dynamic> data) =>
      UserDemographicsStruct(
        age: castToType<int>(data['age']),
        height: castToType<int>(data['height']),
        weight: castToType<int>(data['weight']),
        gender: castToType<int>(data['gender']),
        activityLevel: castToType<int>(data['activityLevel']),
        goal: castToType<int>(data['goal']),
      );

  static UserDemographicsStruct? maybeFromMap(dynamic data) => data is Map
      ? UserDemographicsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'age': _age,
        'height': _height,
        'weight': _weight,
        'gender': _gender,
        'activityLevel': _activityLevel,
        'goal': _goal,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'age': serializeParam(
          _age,
          ParamType.int,
        ),
        'height': serializeParam(
          _height,
          ParamType.int,
        ),
        'weight': serializeParam(
          _weight,
          ParamType.int,
        ),
        'gender': serializeParam(
          _gender,
          ParamType.int,
        ),
        'activityLevel': serializeParam(
          _activityLevel,
          ParamType.int,
        ),
        'goal': serializeParam(
          _goal,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserDemographicsStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      UserDemographicsStruct(
        age: deserializeParam(
          data['age'],
          ParamType.int,
          false,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.int,
          false,
        ),
        weight: deserializeParam(
          data['weight'],
          ParamType.int,
          false,
        ),
        gender: deserializeParam(
          data['gender'],
          ParamType.int,
          false,
        ),
        activityLevel: deserializeParam(
          data['activityLevel'],
          ParamType.int,
          false,
        ),
        goal: deserializeParam(
          data['goal'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserDemographicsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserDemographicsStruct &&
        age == other.age &&
        height == other.height &&
        weight == other.weight &&
        gender == other.gender &&
        activityLevel == other.activityLevel &&
        goal == other.goal;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([age, height, weight, gender, activityLevel, goal]);
}

UserDemographicsStruct createUserDemographicsStruct({
  int? age,
  int? height,
  int? weight,
  int? gender,
  int? activityLevel,
  int? goal,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserDemographicsStruct(
      age: age,
      height: height,
      weight: weight,
      gender: gender,
      activityLevel: activityLevel,
      goal: goal,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserDemographicsStruct? updateUserDemographicsStruct(
  UserDemographicsStruct? userDemographics, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userDemographics
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserDemographicsStructData(
  Map<String, dynamic> firestoreData,
  UserDemographicsStruct? userDemographics,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userDemographics == null) {
    return;
  }
  if (userDemographics.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userDemographics.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userDemographicsData =
      getUserDemographicsFirestoreData(userDemographics, forFieldValue);
  final nestedData =
      userDemographicsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userDemographics.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserDemographicsFirestoreData(
  UserDemographicsStruct? userDemographics, [
  bool forFieldValue = false,
]) {
  if (userDemographics == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userDemographics.toMap());

  // Add any Firestore field values
  userDemographics.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserDemographicsListFirestoreData(
  List<UserDemographicsStruct>? userDemographicss,
) =>
    userDemographicss
        ?.map((e) => getUserDemographicsFirestoreData(e, true))
        .toList() ??
    [];
