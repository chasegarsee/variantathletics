import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/exercise_drop_down_widget.dart';
import '/components/set_edit_field_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'edit_workout_widget.dart' show EditWorkoutWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditWorkoutModel extends FlutterFlowModel<EditWorkoutWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for exerciseDropDown dynamic component.
  late FlutterFlowDynamicModels<ExerciseDropDownModel> exerciseDropDownModels;
  // Models for setEditField dynamic component.
  late FlutterFlowDynamicModels<SetEditFieldModel> setEditFieldModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    exerciseDropDownModels =
        FlutterFlowDynamicModels(() => ExerciseDropDownModel());
    setEditFieldModels = FlutterFlowDynamicModels(() => SetEditFieldModel());
  }

  void dispose() {
    unfocusNode.dispose();
    exerciseDropDownModels.dispose();
    setEditFieldModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
