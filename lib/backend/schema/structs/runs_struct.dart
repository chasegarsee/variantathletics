// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RunsStruct extends FFFirebaseStruct {
  RunsStruct({
    int? averagePace,
    int? duration,
    LatLng? endLocation,
    DateTime? endTime,
    String? notes,
    List<LatLng>? route,
    String? runTitle,
    LatLng? startLocation,
    DateTime? startTime,
    double? totalDistance,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _averagePace = averagePace,
        _duration = duration,
        _endLocation = endLocation,
        _endTime = endTime,
        _notes = notes,
        _route = route,
        _runTitle = runTitle,
        _startLocation = startLocation,
        _startTime = startTime,
        _totalDistance = totalDistance,
        super(firestoreUtilData);

  // "averagePace" field.
  int? _averagePace;
  int get averagePace => _averagePace ?? 0;
  set averagePace(int? val) => _averagePace = val;
  void incrementAveragePace(int amount) => _averagePace = averagePace + amount;
  bool hasAveragePace() => _averagePace != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  set duration(int? val) => _duration = val;
  void incrementDuration(int amount) => _duration = duration + amount;
  bool hasDuration() => _duration != null;

  // "endLocation" field.
  LatLng? _endLocation;
  LatLng? get endLocation => _endLocation;
  set endLocation(LatLng? val) => _endLocation = val;
  bool hasEndLocation() => _endLocation != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  set endTime(DateTime? val) => _endTime = val;
  bool hasEndTime() => _endTime != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  set notes(String? val) => _notes = val;
  bool hasNotes() => _notes != null;

  // "route" field.
  List<LatLng>? _route;
  List<LatLng> get route => _route ?? const [];
  set route(List<LatLng>? val) => _route = val;
  void updateRoute(Function(List<LatLng>) updateFn) => updateFn(_route ??= []);
  bool hasRoute() => _route != null;

  // "runTitle" field.
  String? _runTitle;
  String get runTitle => _runTitle ?? '';
  set runTitle(String? val) => _runTitle = val;
  bool hasRunTitle() => _runTitle != null;

  // "startLocation" field.
  LatLng? _startLocation;
  LatLng? get startLocation => _startLocation;
  set startLocation(LatLng? val) => _startLocation = val;
  bool hasStartLocation() => _startLocation != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  set startTime(DateTime? val) => _startTime = val;
  bool hasStartTime() => _startTime != null;

  // "totalDistance" field.
  double? _totalDistance;
  double get totalDistance => _totalDistance ?? 0.0;
  set totalDistance(double? val) => _totalDistance = val;
  void incrementTotalDistance(double amount) =>
      _totalDistance = totalDistance + amount;
  bool hasTotalDistance() => _totalDistance != null;

  static RunsStruct fromMap(Map<String, dynamic> data) => RunsStruct(
        averagePace: castToType<int>(data['averagePace']),
        duration: castToType<int>(data['duration']),
        endLocation: data['endLocation'] as LatLng?,
        endTime: data['endTime'] as DateTime?,
        notes: data['notes'] as String?,
        route: getDataList(data['route']),
        runTitle: data['runTitle'] as String?,
        startLocation: data['startLocation'] as LatLng?,
        startTime: data['startTime'] as DateTime?,
        totalDistance: castToType<double>(data['totalDistance']),
      );

  static RunsStruct? maybeFromMap(dynamic data) =>
      data is Map ? RunsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'averagePace': _averagePace,
        'duration': _duration,
        'endLocation': _endLocation,
        'endTime': _endTime,
        'notes': _notes,
        'route': _route,
        'runTitle': _runTitle,
        'startLocation': _startLocation,
        'startTime': _startTime,
        'totalDistance': _totalDistance,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'averagePace': serializeParam(
          _averagePace,
          ParamType.int,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.int,
        ),
        'endLocation': serializeParam(
          _endLocation,
          ParamType.LatLng,
        ),
        'endTime': serializeParam(
          _endTime,
          ParamType.DateTime,
        ),
        'notes': serializeParam(
          _notes,
          ParamType.String,
        ),
        'route': serializeParam(
          _route,
          ParamType.LatLng,
          true,
        ),
        'runTitle': serializeParam(
          _runTitle,
          ParamType.String,
        ),
        'startLocation': serializeParam(
          _startLocation,
          ParamType.LatLng,
        ),
        'startTime': serializeParam(
          _startTime,
          ParamType.DateTime,
        ),
        'totalDistance': serializeParam(
          _totalDistance,
          ParamType.double,
        ),
      }.withoutNulls;

  static RunsStruct fromSerializableMap(Map<String, dynamic> data) =>
      RunsStruct(
        averagePace: deserializeParam(
          data['averagePace'],
          ParamType.int,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.int,
          false,
        ),
        endLocation: deserializeParam(
          data['endLocation'],
          ParamType.LatLng,
          false,
        ),
        endTime: deserializeParam(
          data['endTime'],
          ParamType.DateTime,
          false,
        ),
        notes: deserializeParam(
          data['notes'],
          ParamType.String,
          false,
        ),
        route: deserializeParam<LatLng>(
          data['route'],
          ParamType.LatLng,
          true,
        ),
        runTitle: deserializeParam(
          data['runTitle'],
          ParamType.String,
          false,
        ),
        startLocation: deserializeParam(
          data['startLocation'],
          ParamType.LatLng,
          false,
        ),
        startTime: deserializeParam(
          data['startTime'],
          ParamType.DateTime,
          false,
        ),
        totalDistance: deserializeParam(
          data['totalDistance'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'RunsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RunsStruct &&
        averagePace == other.averagePace &&
        duration == other.duration &&
        endLocation == other.endLocation &&
        endTime == other.endTime &&
        notes == other.notes &&
        listEquality.equals(route, other.route) &&
        runTitle == other.runTitle &&
        startLocation == other.startLocation &&
        startTime == other.startTime &&
        totalDistance == other.totalDistance;
  }

  @override
  int get hashCode => const ListEquality().hash([
        averagePace,
        duration,
        endLocation,
        endTime,
        notes,
        route,
        runTitle,
        startLocation,
        startTime,
        totalDistance
      ]);
}

RunsStruct createRunsStruct({
  int? averagePace,
  int? duration,
  LatLng? endLocation,
  DateTime? endTime,
  String? notes,
  String? runTitle,
  LatLng? startLocation,
  DateTime? startTime,
  double? totalDistance,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    RunsStruct(
      averagePace: averagePace,
      duration: duration,
      endLocation: endLocation,
      endTime: endTime,
      notes: notes,
      runTitle: runTitle,
      startLocation: startLocation,
      startTime: startTime,
      totalDistance: totalDistance,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

RunsStruct? updateRunsStruct(
  RunsStruct? runs, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    runs
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addRunsStructData(
  Map<String, dynamic> firestoreData,
  RunsStruct? runs,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (runs == null) {
    return;
  }
  if (runs.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && runs.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final runsData = getRunsFirestoreData(runs, forFieldValue);
  final nestedData = runsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = runs.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getRunsFirestoreData(
  RunsStruct? runs, [
  bool forFieldValue = false,
]) {
  if (runs == null) {
    return {};
  }
  final firestoreData = mapToFirestore(runs.toMap());

  // Add any Firestore field values
  runs.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getRunsListFirestoreData(
  List<RunsStruct>? runss,
) =>
    runss?.map((e) => getRunsFirestoreData(e, true)).toList() ?? [];
