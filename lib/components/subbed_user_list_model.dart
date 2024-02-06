import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'subbed_user_list_widget.dart' show SubbedUserListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubbedUserListModel extends FlutterFlowModel<SubbedUserListWidget> {
  ///  Local state fields for this component.

  List<String> programUserIds = [];
  void addToProgramUserIds(String item) => programUserIds.add(item);
  void removeFromProgramUserIds(String item) => programUserIds.remove(item);
  void removeAtIndexFromProgramUserIds(int index) =>
      programUserIds.removeAt(index);
  void insertAtIndexInProgramUserIds(int index, String item) =>
      programUserIds.insert(index, item);
  void updateProgramUserIdsAtIndex(int index, Function(String) updateFn) =>
      programUserIds[index] = updateFn(programUserIds[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
