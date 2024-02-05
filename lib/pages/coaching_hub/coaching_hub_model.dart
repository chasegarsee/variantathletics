import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_program/add_program_widget.dart';
import '/components/subbed_users_list/subbed_users_list_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'coaching_hub_widget.dart' show CoachingHubWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CoachingHubModel extends FlutterFlowModel<CoachingHubWidget> {
  ///  Local state fields for this page.

  List<String> somethingUsers = ['9Xk2DLPU5KPMOsBj3vYltrignAt1'];
  void addToSomethingUsers(String item) => somethingUsers.add(item);
  void removeFromSomethingUsers(String item) => somethingUsers.remove(item);
  void removeAtIndexFromSomethingUsers(int index) =>
      somethingUsers.removeAt(index);
  void insertAtIndexInSomethingUsers(int index, String item) =>
      somethingUsers.insert(index, item);
  void updateSomethingUsersAtIndex(int index, Function(String) updateFn) =>
      somethingUsers[index] = updateFn(somethingUsers[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in coachingHub widget.
  List<UsersRecord>? users;
  // State field(s) for Checkbox widget.

  Map<ProgramsRecord, bool> checkboxValueMap1 = {};
  List<ProgramsRecord> get checkboxCheckedItems1 => checkboxValueMap1.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<ProgramsRecord, bool> checkboxValueMap2 = {};
  List<ProgramsRecord> get checkboxCheckedItems2 => checkboxValueMap2.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  // State field(s) for Checkbox widget.

  Map<ProgramsRecord, bool> checkboxValueMap3 = {};
  List<ProgramsRecord> get checkboxCheckedItems3 => checkboxValueMap3.entries
      .where((e) => e.value)
      .map((e) => e.key)
      .toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
