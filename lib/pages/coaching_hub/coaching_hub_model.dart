import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/add_program/add_program_widget.dart';
import '/components/subbed_user_list_widget.dart';
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
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in coachingHub widget.
  List<UsersRecord>? users;
  // State field(s) for live widget.

  Map<ProgramsRecord, bool> liveValueMap = {};
  List<ProgramsRecord> get liveCheckedItems =>
      liveValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for daily widget.

  Map<ProgramsRecord, bool> dailyValueMap = {};
  List<ProgramsRecord> get dailyCheckedItems =>
      dailyValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // State field(s) for custom widget.

  Map<ProgramsRecord, bool> customValueMap = {};
  List<ProgramsRecord> get customCheckedItems =>
      customValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Models for subbedUserList dynamic component.
  late FlutterFlowDynamicModels<SubbedUserListModel> subbedUserListModels;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    subbedUserListModels =
        FlutterFlowDynamicModels(() => SubbedUserListModel());
  }

  void dispose() {
    unfocusNode.dispose();
    subbedUserListModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
