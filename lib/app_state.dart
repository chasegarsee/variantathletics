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

  final _currentUserManager = StreamRequestManager<List<UsersRecord>>();
  Stream<List<UsersRecord>> currentUser({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<UsersRecord>> Function() requestFn,
  }) =>
      _currentUserManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCurrentUserCache() => _currentUserManager.clear();
  void clearCurrentUserCacheKey(String? uniqueKey) =>
      _currentUserManager.clearRequest(uniqueKey);
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
