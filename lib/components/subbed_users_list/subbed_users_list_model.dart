import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'subbed_users_list_widget.dart' show SubbedUsersListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SubbedUsersListModel extends FlutterFlowModel<SubbedUsersListWidget> {
  ///  Local state fields for this component.

  List<String> selectedUsers = [];
  void addToSelectedUsers(String item) => selectedUsers.add(item);
  void removeFromSelectedUsers(String item) => selectedUsers.remove(item);
  void removeAtIndexFromSelectedUsers(int index) =>
      selectedUsers.removeAt(index);
  void insertAtIndexInSelectedUsers(int index, String item) =>
      selectedUsers.insert(index, item);
  void updateSelectedUsersAtIndex(int index, Function(String) updateFn) =>
      selectedUsers[index] = updateFn(selectedUsers[index]);

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
