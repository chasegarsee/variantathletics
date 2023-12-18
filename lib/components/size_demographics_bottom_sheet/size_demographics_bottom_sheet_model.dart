import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'size_demographics_bottom_sheet_widget.dart'
    show SizeDemographicsBottomSheetWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SizeDemographicsBottomSheetModel
    extends FlutterFlowModel<SizeDemographicsBottomSheetWidget> {
  ///  Local state fields for this component.

  bool isLoading = false;

  ///  State fields for stateful widgets in this component.

  final formKey4 = GlobalKey<FormState>();
  final formKey3 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for height widget.
  FocusNode? heightFocusNode;
  TextEditingController? heightController;
  final heightMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? heightControllerValidator;
  String? _heightControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'yq3kiaxw' /* Required */,
      );
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }
    if (val.length > 3) {
      return 'Maximum 3 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for gender widget.
  int? genderValue;
  FormFieldController<int>? genderValueController;
  // State field(s) for age widget.
  FocusNode? ageFocusNode;
  TextEditingController? ageController;
  final ageMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? ageControllerValidator;
  String? _ageControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'eu6qqvsa' /* Required */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        'vgqjexjr' /* minimum 10 y/o required */,
      );
    }
    if (val.length > 2) {
      return 'Maximum 2 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for activityLevel widget.
  int? activityLevelValue;
  FormFieldController<int>? activityLevelValueController;
  // State field(s) for weight widget.
  FocusNode? weightFocusNode;
  TextEditingController? weightController;
  final weightMask = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? weightControllerValidator;
  String? _weightControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '2tzzxxzw' /* Rrequired */,
      );
    }

    if (val.length < 2) {
      return FFLocalizations.of(context).getText(
        '0tc39lg7' /* Minimun 10 KG required */,
      );
    }
    if (val.length > 3) {
      return 'Maximum 3 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for goal widget.
  int? goalValue;
  FormFieldController<int>? goalValueController;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    heightControllerValidator = _heightControllerValidator;
    ageControllerValidator = _ageControllerValidator;
    weightControllerValidator = _weightControllerValidator;
  }

  void dispose() {
    heightFocusNode?.dispose();
    heightController?.dispose();

    ageFocusNode?.dispose();
    ageController?.dispose();

    weightFocusNode?.dispose();
    weightController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
