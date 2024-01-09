// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IntervalTimerStruct extends FFFirebaseStruct {
  IntervalTimerStruct({
    int? workingInterval,
    int? restingInterval,
    int? completedIntervals,
    bool? isOn,
    bool? isInterval,
    int? countDown,
    int? currentInterval,
    bool? isWorkingInterval,
    bool? playSound,
    String? timerType,
    bool? isCountDown,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _workingInterval = workingInterval,
        _restingInterval = restingInterval,
        _completedIntervals = completedIntervals,
        _isOn = isOn,
        _isInterval = isInterval,
        _countDown = countDown,
        _currentInterval = currentInterval,
        _isWorkingInterval = isWorkingInterval,
        _playSound = playSound,
        _timerType = timerType,
        _isCountDown = isCountDown,
        super(firestoreUtilData);

  // "workingInterval" field.
  int? _workingInterval;
  int get workingInterval => _workingInterval ?? 20000;
  set workingInterval(int? val) => _workingInterval = val;
  void incrementWorkingInterval(int amount) =>
      _workingInterval = workingInterval + amount;
  bool hasWorkingInterval() => _workingInterval != null;

  // "restingInterval" field.
  int? _restingInterval;
  int get restingInterval => _restingInterval ?? 40000;
  set restingInterval(int? val) => _restingInterval = val;
  void incrementRestingInterval(int amount) =>
      _restingInterval = restingInterval + amount;
  bool hasRestingInterval() => _restingInterval != null;

  // "completedIntervals" field.
  int? _completedIntervals;
  int get completedIntervals => _completedIntervals ?? 0;
  set completedIntervals(int? val) => _completedIntervals = val;
  void incrementCompletedIntervals(int amount) =>
      _completedIntervals = completedIntervals + amount;
  bool hasCompletedIntervals() => _completedIntervals != null;

  // "isOn" field.
  bool? _isOn;
  bool get isOn => _isOn ?? false;
  set isOn(bool? val) => _isOn = val;
  bool hasIsOn() => _isOn != null;

  // "isInterval" field.
  bool? _isInterval;
  bool get isInterval => _isInterval ?? true;
  set isInterval(bool? val) => _isInterval = val;
  bool hasIsInterval() => _isInterval != null;

  // "countDown" field.
  int? _countDown;
  int get countDown => _countDown ?? 5000;
  set countDown(int? val) => _countDown = val;
  void incrementCountDown(int amount) => _countDown = countDown + amount;
  bool hasCountDown() => _countDown != null;

  // "currentInterval" field.
  int? _currentInterval;
  int get currentInterval => _currentInterval ?? 0;
  set currentInterval(int? val) => _currentInterval = val;
  void incrementCurrentInterval(int amount) =>
      _currentInterval = currentInterval + amount;
  bool hasCurrentInterval() => _currentInterval != null;

  // "isWorkingInterval" field.
  bool? _isWorkingInterval;
  bool get isWorkingInterval => _isWorkingInterval ?? false;
  set isWorkingInterval(bool? val) => _isWorkingInterval = val;
  bool hasIsWorkingInterval() => _isWorkingInterval != null;

  // "playSound" field.
  bool? _playSound;
  bool get playSound => _playSound ?? false;
  set playSound(bool? val) => _playSound = val;
  bool hasPlaySound() => _playSound != null;

  // "timerType" field.
  String? _timerType;
  String get timerType => _timerType ?? 'Interval';
  set timerType(String? val) => _timerType = val;
  bool hasTimerType() => _timerType != null;

  // "isCountDown" field.
  bool? _isCountDown;
  bool get isCountDown => _isCountDown ?? true;
  set isCountDown(bool? val) => _isCountDown = val;
  bool hasIsCountDown() => _isCountDown != null;

  static IntervalTimerStruct fromMap(Map<String, dynamic> data) =>
      IntervalTimerStruct(
        workingInterval: castToType<int>(data['workingInterval']),
        restingInterval: castToType<int>(data['restingInterval']),
        completedIntervals: castToType<int>(data['completedIntervals']),
        isOn: data['isOn'] as bool?,
        isInterval: data['isInterval'] as bool?,
        countDown: castToType<int>(data['countDown']),
        currentInterval: castToType<int>(data['currentInterval']),
        isWorkingInterval: data['isWorkingInterval'] as bool?,
        playSound: data['playSound'] as bool?,
        timerType: data['timerType'] as String?,
        isCountDown: data['isCountDown'] as bool?,
      );

  static IntervalTimerStruct? maybeFromMap(dynamic data) => data is Map
      ? IntervalTimerStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'workingInterval': _workingInterval,
        'restingInterval': _restingInterval,
        'completedIntervals': _completedIntervals,
        'isOn': _isOn,
        'isInterval': _isInterval,
        'countDown': _countDown,
        'currentInterval': _currentInterval,
        'isWorkingInterval': _isWorkingInterval,
        'playSound': _playSound,
        'timerType': _timerType,
        'isCountDown': _isCountDown,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'workingInterval': serializeParam(
          _workingInterval,
          ParamType.int,
        ),
        'restingInterval': serializeParam(
          _restingInterval,
          ParamType.int,
        ),
        'completedIntervals': serializeParam(
          _completedIntervals,
          ParamType.int,
        ),
        'isOn': serializeParam(
          _isOn,
          ParamType.bool,
        ),
        'isInterval': serializeParam(
          _isInterval,
          ParamType.bool,
        ),
        'countDown': serializeParam(
          _countDown,
          ParamType.int,
        ),
        'currentInterval': serializeParam(
          _currentInterval,
          ParamType.int,
        ),
        'isWorkingInterval': serializeParam(
          _isWorkingInterval,
          ParamType.bool,
        ),
        'playSound': serializeParam(
          _playSound,
          ParamType.bool,
        ),
        'timerType': serializeParam(
          _timerType,
          ParamType.String,
        ),
        'isCountDown': serializeParam(
          _isCountDown,
          ParamType.bool,
        ),
      }.withoutNulls;

  static IntervalTimerStruct fromSerializableMap(Map<String, dynamic> data) =>
      IntervalTimerStruct(
        workingInterval: deserializeParam(
          data['workingInterval'],
          ParamType.int,
          false,
        ),
        restingInterval: deserializeParam(
          data['restingInterval'],
          ParamType.int,
          false,
        ),
        completedIntervals: deserializeParam(
          data['completedIntervals'],
          ParamType.int,
          false,
        ),
        isOn: deserializeParam(
          data['isOn'],
          ParamType.bool,
          false,
        ),
        isInterval: deserializeParam(
          data['isInterval'],
          ParamType.bool,
          false,
        ),
        countDown: deserializeParam(
          data['countDown'],
          ParamType.int,
          false,
        ),
        currentInterval: deserializeParam(
          data['currentInterval'],
          ParamType.int,
          false,
        ),
        isWorkingInterval: deserializeParam(
          data['isWorkingInterval'],
          ParamType.bool,
          false,
        ),
        playSound: deserializeParam(
          data['playSound'],
          ParamType.bool,
          false,
        ),
        timerType: deserializeParam(
          data['timerType'],
          ParamType.String,
          false,
        ),
        isCountDown: deserializeParam(
          data['isCountDown'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'IntervalTimerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IntervalTimerStruct &&
        workingInterval == other.workingInterval &&
        restingInterval == other.restingInterval &&
        completedIntervals == other.completedIntervals &&
        isOn == other.isOn &&
        isInterval == other.isInterval &&
        countDown == other.countDown &&
        currentInterval == other.currentInterval &&
        isWorkingInterval == other.isWorkingInterval &&
        playSound == other.playSound &&
        timerType == other.timerType &&
        isCountDown == other.isCountDown;
  }

  @override
  int get hashCode => const ListEquality().hash([
        workingInterval,
        restingInterval,
        completedIntervals,
        isOn,
        isInterval,
        countDown,
        currentInterval,
        isWorkingInterval,
        playSound,
        timerType,
        isCountDown
      ]);
}

IntervalTimerStruct createIntervalTimerStruct({
  int? workingInterval,
  int? restingInterval,
  int? completedIntervals,
  bool? isOn,
  bool? isInterval,
  int? countDown,
  int? currentInterval,
  bool? isWorkingInterval,
  bool? playSound,
  String? timerType,
  bool? isCountDown,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IntervalTimerStruct(
      workingInterval: workingInterval,
      restingInterval: restingInterval,
      completedIntervals: completedIntervals,
      isOn: isOn,
      isInterval: isInterval,
      countDown: countDown,
      currentInterval: currentInterval,
      isWorkingInterval: isWorkingInterval,
      playSound: playSound,
      timerType: timerType,
      isCountDown: isCountDown,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IntervalTimerStruct? updateIntervalTimerStruct(
  IntervalTimerStruct? intervalTimer, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    intervalTimer
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIntervalTimerStructData(
  Map<String, dynamic> firestoreData,
  IntervalTimerStruct? intervalTimer,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (intervalTimer == null) {
    return;
  }
  if (intervalTimer.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && intervalTimer.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final intervalTimerData =
      getIntervalTimerFirestoreData(intervalTimer, forFieldValue);
  final nestedData =
      intervalTimerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = intervalTimer.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIntervalTimerFirestoreData(
  IntervalTimerStruct? intervalTimer, [
  bool forFieldValue = false,
]) {
  if (intervalTimer == null) {
    return {};
  }
  final firestoreData = mapToFirestore(intervalTimer.toMap());

  // Add any Firestore field values
  intervalTimer.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIntervalTimerListFirestoreData(
  List<IntervalTimerStruct>? intervalTimers,
) =>
    intervalTimers
        ?.map((e) => getIntervalTimerFirestoreData(e, true))
        .toList() ??
    [];
