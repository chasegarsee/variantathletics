import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
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

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
