import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_workout/add_workout_widget.dart';
import '/components/edit_program_day/edit_program_day_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'edit_program_widget.dart' show EditProgramWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProgramModel extends FlutterFlowModel<EditProgramWidget> {
  ///  Local state fields for this page.

  int selectedWeek = 0;

  List<DaysStruct> days = [];
  void addToDays(DaysStruct item) => days.add(item);
  void removeFromDays(DaysStruct item) => days.remove(item);
  void removeAtIndexFromDays(int index) => days.removeAt(index);
  void insertAtIndexInDays(int index, DaysStruct item) =>
      days.insert(index, item);
  void updateDaysAtIndex(int index, Function(DaysStruct) updateFn) =>
      days[index] = updateFn(days[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Models for editProgramDay dynamic component.
  late FlutterFlowDynamicModels<EditProgramDayModel> editProgramDayModels;
  // Stores action output result for [Custom Action - reverseDaysOrder] action in Icon widget.
  List<DaysStruct>? reorderedDays;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    editProgramDayModels =
        FlutterFlowDynamicModels(() => EditProgramDayModel());
  }

  void dispose() {
    unfocusNode.dispose();
    editProgramDayModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
