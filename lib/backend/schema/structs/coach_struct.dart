// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoachStruct extends FFFirebaseStruct {
  CoachStruct({
    String? bannerUrl,
    String? credentials,
    String? email,
    bool? featured,
    String? name,
    String? profilePhotoUrl,
    int? revenueShare,
    String? uid,
    String? url,
    List<ProgramStruct>? programs,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _bannerUrl = bannerUrl,
        _credentials = credentials,
        _email = email,
        _featured = featured,
        _name = name,
        _profilePhotoUrl = profilePhotoUrl,
        _revenueShare = revenueShare,
        _uid = uid,
        _url = url,
        _programs = programs,
        super(firestoreUtilData);

  // "bannerUrl" field.
  String? _bannerUrl;
  String get bannerUrl => _bannerUrl ?? '';
  set bannerUrl(String? val) => _bannerUrl = val;
  bool hasBannerUrl() => _bannerUrl != null;

  // "credentials" field.
  String? _credentials;
  String get credentials => _credentials ?? '';
  set credentials(String? val) => _credentials = val;
  bool hasCredentials() => _credentials != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "featured" field.
  bool? _featured;
  bool get featured => _featured ?? false;
  set featured(bool? val) => _featured = val;
  bool hasFeatured() => _featured != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "profilePhotoUrl" field.
  String? _profilePhotoUrl;
  String get profilePhotoUrl => _profilePhotoUrl ?? '';
  set profilePhotoUrl(String? val) => _profilePhotoUrl = val;
  bool hasProfilePhotoUrl() => _profilePhotoUrl != null;

  // "revenueShare" field.
  int? _revenueShare;
  int get revenueShare => _revenueShare ?? 0;
  set revenueShare(int? val) => _revenueShare = val;
  void incrementRevenueShare(int amount) =>
      _revenueShare = revenueShare + amount;
  bool hasRevenueShare() => _revenueShare != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;
  bool hasUid() => _uid != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;
  bool hasUrl() => _url != null;

  // "programs" field.
  List<ProgramStruct>? _programs;
  List<ProgramStruct> get programs => _programs ?? const [];
  set programs(List<ProgramStruct>? val) => _programs = val;
  void updatePrograms(Function(List<ProgramStruct>) updateFn) =>
      updateFn(_programs ??= []);
  bool hasPrograms() => _programs != null;

  static CoachStruct fromMap(Map<String, dynamic> data) => CoachStruct(
        bannerUrl: data['bannerUrl'] as String?,
        credentials: data['credentials'] as String?,
        email: data['email'] as String?,
        featured: data['featured'] as bool?,
        name: data['name'] as String?,
        profilePhotoUrl: data['profilePhotoUrl'] as String?,
        revenueShare: castToType<int>(data['revenueShare']),
        uid: data['uid'] as String?,
        url: data['url'] as String?,
        programs: getStructList(
          data['programs'],
          ProgramStruct.fromMap,
        ),
      );

  static CoachStruct? maybeFromMap(dynamic data) =>
      data is Map ? CoachStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'bannerUrl': _bannerUrl,
        'credentials': _credentials,
        'email': _email,
        'featured': _featured,
        'name': _name,
        'profilePhotoUrl': _profilePhotoUrl,
        'revenueShare': _revenueShare,
        'uid': _uid,
        'url': _url,
        'programs': _programs?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'bannerUrl': serializeParam(
          _bannerUrl,
          ParamType.String,
        ),
        'credentials': serializeParam(
          _credentials,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'featured': serializeParam(
          _featured,
          ParamType.bool,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'profilePhotoUrl': serializeParam(
          _profilePhotoUrl,
          ParamType.String,
        ),
        'revenueShare': serializeParam(
          _revenueShare,
          ParamType.int,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'programs': serializeParam(
          _programs,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static CoachStruct fromSerializableMap(Map<String, dynamic> data) =>
      CoachStruct(
        bannerUrl: deserializeParam(
          data['bannerUrl'],
          ParamType.String,
          false,
        ),
        credentials: deserializeParam(
          data['credentials'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        featured: deserializeParam(
          data['featured'],
          ParamType.bool,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        profilePhotoUrl: deserializeParam(
          data['profilePhotoUrl'],
          ParamType.String,
          false,
        ),
        revenueShare: deserializeParam(
          data['revenueShare'],
          ParamType.int,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        programs: deserializeStructParam<ProgramStruct>(
          data['programs'],
          ParamType.DataStruct,
          true,
          structBuilder: ProgramStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CoachStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CoachStruct &&
        bannerUrl == other.bannerUrl &&
        credentials == other.credentials &&
        email == other.email &&
        featured == other.featured &&
        name == other.name &&
        profilePhotoUrl == other.profilePhotoUrl &&
        revenueShare == other.revenueShare &&
        uid == other.uid &&
        url == other.url &&
        listEquality.equals(programs, other.programs);
  }

  @override
  int get hashCode => const ListEquality().hash([
        bannerUrl,
        credentials,
        email,
        featured,
        name,
        profilePhotoUrl,
        revenueShare,
        uid,
        url,
        programs
      ]);
}

CoachStruct createCoachStruct({
  String? bannerUrl,
  String? credentials,
  String? email,
  bool? featured,
  String? name,
  String? profilePhotoUrl,
  int? revenueShare,
  String? uid,
  String? url,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CoachStruct(
      bannerUrl: bannerUrl,
      credentials: credentials,
      email: email,
      featured: featured,
      name: name,
      profilePhotoUrl: profilePhotoUrl,
      revenueShare: revenueShare,
      uid: uid,
      url: url,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CoachStruct? updateCoachStruct(
  CoachStruct? coach, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    coach
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCoachStructData(
  Map<String, dynamic> firestoreData,
  CoachStruct? coach,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (coach == null) {
    return;
  }
  if (coach.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && coach.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final coachData = getCoachFirestoreData(coach, forFieldValue);
  final nestedData = coachData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = coach.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCoachFirestoreData(
  CoachStruct? coach, [
  bool forFieldValue = false,
]) {
  if (coach == null) {
    return {};
  }
  final firestoreData = mapToFirestore(coach.toMap());

  // Add any Firestore field values
  coach.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCoachListFirestoreData(
  List<CoachStruct>? coachs,
) =>
    coachs?.map((e) => getCoachFirestoreData(e, true)).toList() ?? [];
