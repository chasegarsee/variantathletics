import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'exercise_library_widget.dart' show ExerciseLibraryWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ExerciseLibraryModel extends FlutterFlowModel<ExerciseLibraryWidget> {
  ///  Local state fields for this page.

  List<dynamic> filteredExercises = [];
  void addToFilteredExercises(dynamic item) => filteredExercises.add(item);
  void removeFromFilteredExercises(dynamic item) =>
      filteredExercises.remove(item);
  void removeAtIndexFromFilteredExercises(int index) =>
      filteredExercises.removeAt(index);
  void insertAtIndexInFilteredExercises(int index, dynamic item) =>
      filteredExercises.insert(index, item);
  void updateFilteredExercisesAtIndex(int index, Function(dynamic) updateFn) =>
      filteredExercises[index] = updateFn(filteredExercises[index]);

  String? status = '';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in exerciseLibrary widget.
  List<ExercisesRecord>? exerciseList;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in GridView widget.
  List<ExercisesRecord>? exerciseListRefresh;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
