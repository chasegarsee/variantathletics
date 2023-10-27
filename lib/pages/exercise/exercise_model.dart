import '/components/exercise_video_stack/exercise_video_stack_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'exercise_widget.dart' show ExerciseWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExerciseModel extends FlutterFlowModel<ExerciseWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for exerciseVideoStack component.
  late ExerciseVideoStackModel exerciseVideoStackModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    exerciseVideoStackModel =
        createModel(context, () => ExerciseVideoStackModel());
  }

  void dispose() {
    unfocusNode.dispose();
    exerciseVideoStackModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
