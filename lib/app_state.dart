import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isPortal = prefs.getString('ff_isPortal') ?? _isPortal;
    });
    _safeInit(() {
      _isPortalBool = prefs.getBool('ff_isPortalBool') ?? _isPortalBool;
    });
    _safeInit(() {
      _coachUID = prefs.getString('ff_coachUID') ?? _coachUID;
    });
    _safeInit(() {
      _isProgram = prefs.getBool('ff_isProgram') ?? _isProgram;
    });
    _safeInit(() {
      _showTimer = prefs.getBool('ff_showTimer') ?? _showTimer;
    });
    _safeInit(() {
      _banner = prefs.getString('ff_banner') ?? _banner;
    });
    _safeInit(() {
      _completed = prefs.getInt('ff_completed') ?? _completed;
    });
    _safeInit(() {
      _exerciseBase = prefs.getString('ff_exerciseBase') ?? _exerciseBase;
    });
    _safeInit(() {
      _playSound = prefs.getBool('ff_playSound') ?? _playSound;
    });
    _safeInit(() {
      _breakdownLanguage =
          prefs.getString('ff_breakdownLanguage') ?? _breakdownLanguage;
    });
    _safeInit(() {
      _isInitialLoad = prefs.getBool('ff_isInitialLoad') ?? _isInitialLoad;
    });
    _safeInit(() {
      _completedDays =
          prefs.getStringList('ff_completedDays') ?? _completedDays;
    });
    _safeInit(() {
      _completedWeeks =
          prefs.getStringList('ff_completedWeeks')?.map(int.parse).toList() ??
              _completedWeeks;
    });
    _safeInit(() {
      _selectedWeek = prefs.getInt('ff_selectedWeek') ?? _selectedWeek;
    });
    _safeInit(() {
      _days = prefs
              .getStringList('ff_days')
              ?.map((x) {
                try {
                  return DaysStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _days;
    });
    _safeInit(() {
      _programExercises = prefs
              .getStringList('ff_programExercises')
              ?.map((x) {
                try {
                  return ProgramExercisesStruct.fromSerializableMap(
                      jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _programExercises;
    });
    _safeInit(() {
      _selectedDayName =
          prefs.getString('ff_selectedDayName') ?? _selectedDayName;
    });
    _safeInit(() {
      _selectedDay = prefs.getInt('ff_selectedDay') ?? _selectedDay;
    });
    _safeInit(() {
      _selectedDayId = prefs.getString('ff_selectedDayId') ?? _selectedDayId;
    });
    _safeInit(() {
      _showAllWeeks = prefs.getBool('ff_showAllWeeks') ?? _showAllWeeks;
    });
    _safeInit(() {
      _showAllDays = prefs.getBool('ff_showAllDays') ?? _showAllDays;
    });
    _safeInit(() {
      _weeks = prefs
              .getStringList('ff_weeks')
              ?.map((x) {
                try {
                  return WeeksStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _weeks;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _isPortal = 'false';
  String get isPortal => _isPortal;
  set isPortal(String _value) {
    _isPortal = _value;
    prefs.setString('ff_isPortal', _value);
  }

  bool _isPortalBool = false;
  bool get isPortalBool => _isPortalBool;
  set isPortalBool(bool _value) {
    _isPortalBool = _value;
    prefs.setBool('ff_isPortalBool', _value);
  }

  String _coachUID = '7i2AKzKcQdeV75IH85wl';
  String get coachUID => _coachUID;
  set coachUID(String _value) {
    _coachUID = _value;
    prefs.setString('ff_coachUID', _value);
  }

  bool _isProgram = false;
  bool get isProgram => _isProgram;
  set isProgram(bool _value) {
    _isProgram = _value;
    prefs.setBool('ff_isProgram', _value);
  }

  bool _showTimer = false;
  bool get showTimer => _showTimer;
  set showTimer(bool _value) {
    _showTimer = _value;
    prefs.setBool('ff_showTimer', _value);
  }

  dynamic _user;
  dynamic get user => _user;
  set user(dynamic _value) {
    _user = _value;
  }

  List<dynamic> _programs = [];
  List<dynamic> get programs => _programs;
  set programs(List<dynamic> _value) {
    _programs = _value;
  }

  void addToPrograms(dynamic _value) {
    _programs.add(_value);
  }

  void removeFromPrograms(dynamic _value) {
    _programs.remove(_value);
  }

  void removeAtIndexFromPrograms(int _index) {
    _programs.removeAt(_index);
  }

  void updateProgramsAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _programs[_index] = updateFn(_programs[_index]);
  }

  void insertAtIndexInPrograms(int _index, dynamic _value) {
    _programs.insert(_index, _value);
  }

  String _banner =
      'https://firebasestorage.googleapis.com/v0/b/variant-3baaf.appspot.com/o/users%2FrWyX65FEzkXcOYxAYQJABMokajS2%2Fuploads%2FHorizontal_Logo_Full_White.png?alt=media&token=e3af48b8-67b3-4e20-8131-33ed57901029';
  String get banner => _banner;
  set banner(String _value) {
    _banner = _value;
    prefs.setString('ff_banner', _value);
  }

  int _completed = 0;
  int get completed => _completed;
  set completed(int _value) {
    _completed = _value;
    prefs.setInt('ff_completed', _value);
  }

  String _exerciseBase =
      'https://firebasestorage.googleapis.com/v0/b/variant-3baaf.appspot.com/o/exercises%2F';
  String get exerciseBase => _exerciseBase;
  set exerciseBase(String _value) {
    _exerciseBase = _value;
    prefs.setString('ff_exerciseBase', _value);
  }

  bool _isTimerRunning = false;
  bool get isTimerRunning => _isTimerRunning;
  set isTimerRunning(bool _value) {
    _isTimerRunning = _value;
  }

  bool _playSound = true;
  bool get playSound => _playSound;
  set playSound(bool _value) {
    _playSound = _value;
    prefs.setBool('ff_playSound', _value);
  }

  String _breakdownLanguage = 'th';
  String get breakdownLanguage => _breakdownLanguage;
  set breakdownLanguage(String _value) {
    _breakdownLanguage = _value;
    prefs.setString('ff_breakdownLanguage', _value);
  }

  bool _isInitialLoad = true;
  bool get isInitialLoad => _isInitialLoad;
  set isInitialLoad(bool _value) {
    _isInitialLoad = _value;
    prefs.setBool('ff_isInitialLoad', _value);
  }

  List<dynamic> _exercises = [];
  List<dynamic> get exercises => _exercises;
  set exercises(List<dynamic> _value) {
    _exercises = _value;
  }

  void addToExercises(dynamic _value) {
    _exercises.add(_value);
  }

  void removeFromExercises(dynamic _value) {
    _exercises.remove(_value);
  }

  void removeAtIndexFromExercises(int _index) {
    _exercises.removeAt(_index);
  }

  void updateExercisesAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _exercises[_index] = updateFn(_exercises[_index]);
  }

  void insertAtIndexInExercises(int _index, dynamic _value) {
    _exercises.insert(_index, _value);
  }

  dynamic _program;
  dynamic get program => _program;
  set program(dynamic _value) {
    _program = _value;
  }

  List<String> _completedDays = [];
  List<String> get completedDays => _completedDays;
  set completedDays(List<String> _value) {
    _completedDays = _value;
    prefs.setStringList('ff_completedDays', _value);
  }

  void addToCompletedDays(String _value) {
    _completedDays.add(_value);
    prefs.setStringList('ff_completedDays', _completedDays);
  }

  void removeFromCompletedDays(String _value) {
    _completedDays.remove(_value);
    prefs.setStringList('ff_completedDays', _completedDays);
  }

  void removeAtIndexFromCompletedDays(int _index) {
    _completedDays.removeAt(_index);
    prefs.setStringList('ff_completedDays', _completedDays);
  }

  void updateCompletedDaysAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _completedDays[_index] = updateFn(_completedDays[_index]);
    prefs.setStringList('ff_completedDays', _completedDays);
  }

  void insertAtIndexInCompletedDays(int _index, String _value) {
    _completedDays.insert(_index, _value);
    prefs.setStringList('ff_completedDays', _completedDays);
  }

  List<int> _completedWeeks = [];
  List<int> get completedWeeks => _completedWeeks;
  set completedWeeks(List<int> _value) {
    _completedWeeks = _value;
    prefs.setStringList(
        'ff_completedWeeks', _value.map((x) => x.toString()).toList());
  }

  void addToCompletedWeeks(int _value) {
    _completedWeeks.add(_value);
    prefs.setStringList(
        'ff_completedWeeks', _completedWeeks.map((x) => x.toString()).toList());
  }

  void removeFromCompletedWeeks(int _value) {
    _completedWeeks.remove(_value);
    prefs.setStringList(
        'ff_completedWeeks', _completedWeeks.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromCompletedWeeks(int _index) {
    _completedWeeks.removeAt(_index);
    prefs.setStringList(
        'ff_completedWeeks', _completedWeeks.map((x) => x.toString()).toList());
  }

  void updateCompletedWeeksAtIndex(
    int _index,
    int Function(int) updateFn,
  ) {
    _completedWeeks[_index] = updateFn(_completedWeeks[_index]);
    prefs.setStringList(
        'ff_completedWeeks', _completedWeeks.map((x) => x.toString()).toList());
  }

  void insertAtIndexInCompletedWeeks(int _index, int _value) {
    _completedWeeks.insert(_index, _value);
    prefs.setStringList(
        'ff_completedWeeks', _completedWeeks.map((x) => x.toString()).toList());
  }

  int _selectedWeek = 1;
  int get selectedWeek => _selectedWeek;
  set selectedWeek(int _value) {
    _selectedWeek = _value;
    prefs.setInt('ff_selectedWeek', _value);
  }

  List<DaysStruct> _days = [];
  List<DaysStruct> get days => _days;
  set days(List<DaysStruct> _value) {
    _days = _value;
    prefs.setStringList('ff_days', _value.map((x) => x.serialize()).toList());
  }

  void addToDays(DaysStruct _value) {
    _days.add(_value);
    prefs.setStringList('ff_days', _days.map((x) => x.serialize()).toList());
  }

  void removeFromDays(DaysStruct _value) {
    _days.remove(_value);
    prefs.setStringList('ff_days', _days.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromDays(int _index) {
    _days.removeAt(_index);
    prefs.setStringList('ff_days', _days.map((x) => x.serialize()).toList());
  }

  void updateDaysAtIndex(
    int _index,
    DaysStruct Function(DaysStruct) updateFn,
  ) {
    _days[_index] = updateFn(_days[_index]);
    prefs.setStringList('ff_days', _days.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInDays(int _index, DaysStruct _value) {
    _days.insert(_index, _value);
    prefs.setStringList('ff_days', _days.map((x) => x.serialize()).toList());
  }

  List<ProgramExercisesStruct> _programExercises = [];
  List<ProgramExercisesStruct> get programExercises => _programExercises;
  set programExercises(List<ProgramExercisesStruct> _value) {
    _programExercises = _value;
    prefs.setStringList(
        'ff_programExercises', _value.map((x) => x.serialize()).toList());
  }

  void addToProgramExercises(ProgramExercisesStruct _value) {
    _programExercises.add(_value);
    prefs.setStringList('ff_programExercises',
        _programExercises.map((x) => x.serialize()).toList());
  }

  void removeFromProgramExercises(ProgramExercisesStruct _value) {
    _programExercises.remove(_value);
    prefs.setStringList('ff_programExercises',
        _programExercises.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromProgramExercises(int _index) {
    _programExercises.removeAt(_index);
    prefs.setStringList('ff_programExercises',
        _programExercises.map((x) => x.serialize()).toList());
  }

  void updateProgramExercisesAtIndex(
    int _index,
    ProgramExercisesStruct Function(ProgramExercisesStruct) updateFn,
  ) {
    _programExercises[_index] = updateFn(_programExercises[_index]);
    prefs.setStringList('ff_programExercises',
        _programExercises.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInProgramExercises(
      int _index, ProgramExercisesStruct _value) {
    _programExercises.insert(_index, _value);
    prefs.setStringList('ff_programExercises',
        _programExercises.map((x) => x.serialize()).toList());
  }

  String _selectedDayName = '';
  String get selectedDayName => _selectedDayName;
  set selectedDayName(String _value) {
    _selectedDayName = _value;
    prefs.setString('ff_selectedDayName', _value);
  }

  int _selectedDay = 1;
  int get selectedDay => _selectedDay;
  set selectedDay(int _value) {
    _selectedDay = _value;
    prefs.setInt('ff_selectedDay', _value);
  }

  String _selectedDayId = '';
  String get selectedDayId => _selectedDayId;
  set selectedDayId(String _value) {
    _selectedDayId = _value;
    prefs.setString('ff_selectedDayId', _value);
  }

  bool _showAllWeeks = true;
  bool get showAllWeeks => _showAllWeeks;
  set showAllWeeks(bool _value) {
    _showAllWeeks = _value;
    prefs.setBool('ff_showAllWeeks', _value);
  }

  bool _showAllDays = true;
  bool get showAllDays => _showAllDays;
  set showAllDays(bool _value) {
    _showAllDays = _value;
    prefs.setBool('ff_showAllDays', _value);
  }

  List<WeeksStruct> _weeks = [];
  List<WeeksStruct> get weeks => _weeks;
  set weeks(List<WeeksStruct> _value) {
    _weeks = _value;
    prefs.setStringList('ff_weeks', _value.map((x) => x.serialize()).toList());
  }

  void addToWeeks(WeeksStruct _value) {
    _weeks.add(_value);
    prefs.setStringList('ff_weeks', _weeks.map((x) => x.serialize()).toList());
  }

  void removeFromWeeks(WeeksStruct _value) {
    _weeks.remove(_value);
    prefs.setStringList('ff_weeks', _weeks.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromWeeks(int _index) {
    _weeks.removeAt(_index);
    prefs.setStringList('ff_weeks', _weeks.map((x) => x.serialize()).toList());
  }

  void updateWeeksAtIndex(
    int _index,
    WeeksStruct Function(WeeksStruct) updateFn,
  ) {
    _weeks[_index] = updateFn(_weeks[_index]);
    prefs.setStringList('ff_weeks', _weeks.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInWeeks(int _index, WeeksStruct _value) {
    _weeks.insert(_index, _value);
    prefs.setStringList('ff_weeks', _weeks.map((x) => x.serialize()).toList());
  }

  final _exerciseManager = StreamRequestManager<List<ExercisesRecord>>();
  Stream<List<ExercisesRecord>> exercise({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ExercisesRecord>> Function() requestFn,
  }) =>
      _exerciseManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearExerciseCache() => _exerciseManager.clear();
  void clearExerciseCacheKey(String? uniqueKey) =>
      _exerciseManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
