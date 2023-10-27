import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'timer_widget.dart' show TimerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class TimerModel extends FlutterFlowModel<TimerWidget> {
  ///  Local state fields for this page.

  int workingInterval = 20000;

  int restingInterval = 40000;

  int completedIntervals = 0;

  bool isWorkingInterval = true;

  bool isCounting = false;

  int? currentInterval;

  List<dynamic> filteredExercises = [];
  void addToFilteredExercises(dynamic item) => filteredExercises.add(item);
  void removeFromFilteredExercises(dynamic item) =>
      filteredExercises.remove(item);
  void removeAtIndexFromFilteredExercises(int index) =>
      filteredExercises.removeAt(index);
  void insertAtIndexInFilteredExercises(int index, dynamic item) =>
      filteredExercises.insert(index, item);
  void updateFilteredExercisesAtIndex(int index, Function(dynamic) updateFn) =>
      filteredExercises[index] = updateFn(filteredExercises[index]);

  bool playSound = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Timer widget.
  int timerMilliseconds1 = 0;
  String timerValue1 = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController1 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  AudioPlayer? soundPlayer;
  // State field(s) for Timer widget.
  int timerMilliseconds2 = 0;
  String timerValue2 = StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController timerController2 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for WorkingInterval widget.
  int? workingIntervalValue;
  FormFieldController<int>? workingIntervalValueController;
  // State field(s) for RestingInterval widget.
  int? restingIntervalValue;
  FormFieldController<int>? restingIntervalValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    timerController1.dispose();
    timerController2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
