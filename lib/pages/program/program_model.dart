import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/days_placeholder/days_placeholder_widget.dart';
import '/components/leave_workout_comment/leave_workout_comment_widget.dart';
import '/components/program_timer/program_timer_widget.dart';
import '/components/select_program/select_program_widget.dart';
import '/components/workout_comments/workout_comments_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'program_widget.dart' show ProgramWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class ProgramModel extends FlutterFlowModel<ProgramWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  bool selectedTimer = false;

  int timerSize = 14;

  int timerContainerSize = 75;

  int countUpTimerContainerSize = 100;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in program widget.
  ProgramsRecord? currentProgram;
  // State field(s) for intervalTimer widget.
  int intervalTimerMilliseconds = 0;
  String intervalTimerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController intervalTimerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  AudioPlayer? soundPlayer;
  // State field(s) for elapsedTimer widget.
  int elapsedTimerMilliseconds1 = 0;
  String elapsedTimerValue1 =
      StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController elapsedTimerController1 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  // State field(s) for elapsedTimer widget.
  int elapsedTimerMilliseconds2 = 0;
  String elapsedTimerValue2 =
      StopWatchTimer.getDisplayTime(0, milliSecond: false);
  FlutterFlowTimerController elapsedTimerController2 =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countUp));

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    intervalTimerController.dispose();
    elapsedTimerController1.dispose();
    elapsedTimerController2.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
