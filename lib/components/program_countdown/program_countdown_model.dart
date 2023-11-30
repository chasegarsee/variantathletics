import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'program_countdown_widget.dart' show ProgramCountdownWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProgramCountdownModel extends FlutterFlowModel<ProgramCountdownWidget> {
  ///  Local state fields for this component.

  String? countDown = '';

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - programCountdownTimer] action in programCountdown widget.
  String? countdown;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
