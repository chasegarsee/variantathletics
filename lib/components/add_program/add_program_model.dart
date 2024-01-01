import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_program_widget.dart' show AddProgramWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddProgramModel extends FlutterFlowModel<AddProgramWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for isDailyCheckbox widget.
  bool? isDailyCheckboxValue;
  // State field(s) for numWeeksInput widget.
  FocusNode? numWeeksInputFocusNode;
  TextEditingController? numWeeksInputController;
  String? Function(BuildContext, String?)? numWeeksInputControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProgramsRecord? newProgram;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    numWeeksInputFocusNode?.dispose();
    numWeeksInputController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
