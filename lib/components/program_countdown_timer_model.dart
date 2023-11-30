import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'program_countdown_timer_widget.dart' show ProgramCountdownTimerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProgramCountdownTimerModel
    extends FlutterFlowModel<ProgramCountdownTimerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for Timer widget.
  int timerMilliseconds = 60000;
  String timerValue = StopWatchTimer.getDisplayTime(60000, milliSecond: false);
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    timerController.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
