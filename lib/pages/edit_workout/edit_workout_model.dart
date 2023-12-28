import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_exercise/add_exercise_widget.dart';
import '/components/edit_exercise/edit_exercise_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'edit_workout_widget.dart' show EditWorkoutWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditWorkoutModel extends FlutterFlowModel<EditWorkoutWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for editExercise dynamic component.
  late FlutterFlowDynamicModels<EditExerciseModel> editExerciseModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    editExerciseModels = FlutterFlowDynamicModels(() => EditExerciseModel());
  }

  void dispose() {
    unfocusNode.dispose();
    editExerciseModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
