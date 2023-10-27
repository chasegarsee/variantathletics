import '/components/kg_input/kg_input_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'workout_set_list_item_widget.dart' show WorkoutSetListItemWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class WorkoutSetListItemModel
    extends FlutterFlowModel<WorkoutSetListItemWidget> {
  ///  Local state fields for this component.

  bool isComplete = false;

  ///  State fields for stateful widgets in this component.

  // Model for kgInput component.
  late KgInputModel kgInputModel;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Custom Action - updateSetsComplete] action in Switch widget.
  int? completedCopy;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    kgInputModel = createModel(context, () => KgInputModel());
  }

  void dispose() {
    kgInputModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
