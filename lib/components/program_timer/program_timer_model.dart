import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'program_timer_widget.dart' show ProgramTimerWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProgramTimerModel extends FlutterFlowModel<ProgramTimerWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TimerType widget.
  String? timerTypeValue;
  FormFieldController<String>? timerTypeValueController;
  // State field(s) for RestingInterval widget.
  int? restingIntervalValue;
  FormFieldController<int>? restingIntervalValueController;
  // State field(s) for WorkingInterval widget.
  int? workingIntervalValue;
  FormFieldController<int>? workingIntervalValueController;
  // State field(s) for MinutesCount widget.
  int? minutesCountValue;
  // State field(s) for SecondsCount widget.
  int? secondsCountValue;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
