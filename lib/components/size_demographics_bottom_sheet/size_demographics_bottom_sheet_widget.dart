import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'size_demographics_bottom_sheet_model.dart';
export 'size_demographics_bottom_sheet_model.dart';

class SizeDemographicsBottomSheetWidget extends StatefulWidget {
  const SizeDemographicsBottomSheetWidget({Key? key}) : super(key: key);

  @override
  _SizeDemographicsBottomSheetWidgetState createState() =>
      _SizeDemographicsBottomSheetWidgetState();
}

class _SizeDemographicsBottomSheetWidgetState
    extends State<SizeDemographicsBottomSheetWidget> {
  late SizeDemographicsBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SizeDemographicsBottomSheetModel());

    _model.heightController ??= TextEditingController(
        text: currentUserDocument?.demographics?.age == 0
            ? null
            : currentUserDocument?.demographics?.height?.toString());
    _model.heightFocusNode ??= FocusNode();
    _model.heightFocusNode!.addListener(() => setState(() {}));
    _model.ageController ??= TextEditingController(
        text: currentUserDocument?.demographics?.age == 0
            ? null
            : currentUserDocument?.demographics?.age?.toString());
    _model.ageFocusNode ??= FocusNode();
    _model.ageFocusNode!.addListener(() => setState(() {}));
    _model.weightController ??= TextEditingController(
        text: currentUserDocument?.demographics?.age == 0
            ? null
            : currentUserDocument?.demographics?.weight?.toString());
    _model.weightFocusNode ??= FocusNode();
    _model.weightFocusNode!.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: 50.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent2,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AutoSizeText(
                    FFLocalizations.of(context).getText(
                      'cr5tocc5' /* Choose the options that best d... */,
                    ),
                    maxLines: 2,
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                          fontFamily: 'Jost',
                          fontSize: 18.0,
                        ),
                    minFontSize: 18.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
              child: ListView(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 12.0, 24.0, 12.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: Form(
                                key: _model.formKey4,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      child: TextFormField(
                                        controller: _model.heightController,
                                        focusNode: _model.heightFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.heightController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            if (_model.formKey4.currentState ==
                                                    null ||
                                                !_model.formKey4.currentState!
                                                    .validate()) {
                                              return;
                                            }
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'ndtk6lna' /* Height (cm) */,
                                          ),
                                          alignLabelWithHint: false,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        minLines: 1,
                                        maxLength: 3,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        keyboardType: TextInputType.number,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .accent2,
                                        validator: _model
                                            .heightControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [_model.heightMask],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'mhiv0rrt' /* Gender */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                Form(
                                  key: _model.formKey3,
                                  autovalidateMode: AutovalidateMode.always,
                                  child: AuthUserStreamWidget(
                                    builder: (context) =>
                                        FlutterFlowDropDown<int>(
                                      controller:
                                          _model.genderValueController ??=
                                              FormFieldController<int>(
                                        _model.genderValue ??=
                                            currentUserDocument
                                                        ?.demographics?.age ==
                                                    0
                                                ? null
                                                : currentUserDocument
                                                    ?.demographics?.gender,
                                      ),
                                      options: List<int>.from([0, 1]),
                                      optionLabels: [
                                        FFLocalizations.of(context).getText(
                                          'fcyscj1x' /* Female */,
                                        ),
                                        FFLocalizations.of(context).getText(
                                          'c7puzize' /* Male */,
                                        )
                                      ],
                                      onChanged: (val) async {
                                        setState(
                                            () => _model.genderValue = val);
                                        setState(() {});
                                      },
                                      width: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      height: 36.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      hintText:
                                          FFLocalizations.of(context).getText(
                                        'gdkeyh7b' /* Choose gender */,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Form(
                                key: _model.formKey1,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      child: TextFormField(
                                        controller: _model.ageController,
                                        focusNode: _model.ageFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.ageController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            if (_model.formKey1.currentState ==
                                                    null ||
                                                !_model.formKey1.currentState!
                                                    .validate()) {
                                              return;
                                            }
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'ndsqz5nj' /* Age */,
                                          ),
                                          alignLabelWithHint: false,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        minLines: 1,
                                        maxLength: 2,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        keyboardType: TextInputType.number,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .accent2,
                                        validator: _model.ageControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [_model.ageMask],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '1ns8nopu' /* Weekly activity level  */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                AuthUserStreamWidget(
                                  builder: (context) =>
                                      FlutterFlowDropDown<int>(
                                    controller:
                                        _model.activityLevelValueController ??=
                                            FormFieldController<int>(
                                      _model.activityLevelValue ??=
                                          currentUserDocument
                                                      ?.demographics?.age ==
                                                  0
                                              ? null
                                              : currentUserDocument
                                                  ?.demographics?.activityLevel,
                                    ),
                                    options: List<int>.from([1, 2, 3, 4, 5]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'iht6od1b' /* Sedentary (0 days/week) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'gqn1deyg' /* Lightly active (1-2 days/week) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '608ws76y' /* Moderately active (3-5 days/we... */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'upx9kkkj' /* Very active (6-7 days/week) */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '4a81b3y1' /* Athlete (2x day) */,
                                      )
                                    ],
                                    onChanged: (val) => setState(
                                        () => _model.activityLevelValue = val),
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.4,
                                    height: 36.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'rex7pwr2' /* Choose level */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Form(
                                key: _model.formKey2,
                                autovalidateMode: AutovalidateMode.disabled,
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8.0, 0.0, 8.0, 0.0),
                                  child: AuthUserStreamWidget(
                                    builder: (context) => Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      child: TextFormField(
                                        controller: _model.weightController,
                                        focusNode: _model.weightFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.weightController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            if (_model.formKey2.currentState ==
                                                    null ||
                                                !_model.formKey2.currentState!
                                                    .validate()) {
                                              return;
                                            }
                                          },
                                        ),
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'q49qpty2' /* Weight (kg) */,
                                          ),
                                          alignLabelWithHint: false,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              UnderlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                        minLines: 1,
                                        maxLength: 3,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        keyboardType: TextInputType.number,
                                        cursorColor:
                                            FlutterFlowTheme.of(context)
                                                .accent2,
                                        validator: _model
                                            .weightControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [_model.weightMask],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '0mu1uerp' /* Goal */,
                                  ),
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                                AuthUserStreamWidget(
                                  builder: (context) =>
                                      FlutterFlowDropDown<int>(
                                    controller: _model.goalValueController ??=
                                        FormFieldController<int>(
                                      _model.goalValue ??= currentUserDocument
                                                  ?.demographics?.age ==
                                              0
                                          ? null
                                          : currentUserDocument
                                              ?.demographics?.goal,
                                    ),
                                    options: List<int>.from([1, 2, 3]),
                                    optionLabels: [
                                      FFLocalizations.of(context).getText(
                                        'm37bilqf' /* Cut */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '2jfdjs0m' /* Maintenance */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'nei0l69l' /* Bulk */,
                                      )
                                    ],
                                    onChanged: (val) =>
                                        setState(() => _model.goalValue = val),
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.4,
                                    height: 36.0,
                                    textStyle:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'kq8l92x0' /* Choose goal */,
                                    ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 4.0, 16.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(24.0),
                              child: FFButtonWidget(
                                onPressed: (_model.genderValue == null) ||
                                        (_model.activityLevelValue == null) ||
                                        (_model.goalValue == null) ||
                                        (functions.convertStringToInt(
                                                _model.heightController.text) ==
                                            false) ||
                                        (functions.convertStringToInt(
                                                _model.ageController.text) ==
                                            false) ||
                                        (functions.convertStringToInt(
                                                _model.weightController.text) ==
                                            false) ||
                                        _model.isLoading
                                    ? null
                                    : () async {
                                        setState(() {
                                          _model.isLoading = true;
                                        });
                                        setState(() {
                                          FFAppState().macros = functions
                                              .macroCalculator(
                                                  int.parse(_model
                                                      .ageController.text),
                                                  int.parse(_model
                                                      .weightController.text),
                                                  int.parse(_model
                                                      .heightController.text),
                                                  _model.activityLevelValue!,
                                                  _model.goalValue!,
                                                  _model.genderValue!);
                                        });

                                        await currentUserReference!.update({
                                          ...createUsersRecordData(
                                            demographics:
                                                updateUserDemographicsStruct(
                                              UserDemographicsStruct(
                                                age: int.tryParse(
                                                    _model.ageController.text),
                                                height: int.tryParse(_model
                                                    .heightController.text),
                                                weight: int.tryParse(_model
                                                    .weightController.text),
                                                gender: _model.genderValue,
                                                activityLevel:
                                                    _model.activityLevelValue,
                                                goal: _model.goalValue,
                                              ),
                                              clearUnsetFields: false,
                                            ),
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'weightHistory':
                                                  FieldValue.arrayUnion([
                                                getWeightHistoryFirestoreData(
                                                  updateWeightHistoryStruct(
                                                    WeightHistoryStruct(
                                                      weight: int.tryParse(
                                                          _model
                                                              .weightController
                                                              .text),
                                                      date: random_data
                                                          .randomInteger(
                                                              1, 100),
                                                    ),
                                                    clearUnsetFields: false,
                                                  ),
                                                  true,
                                                )
                                              ]),
                                            },
                                          ),
                                        });
                                        setState(() {
                                          _model.isLoading = false;
                                        });
                                        Navigator.pop(context);
                                      },
                                text: FFLocalizations.of(context).getText(
                                  '36r5kcg7' /* Confirm */,
                                ),
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 0.5,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).accent2,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Jost',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                  disabledColor: Color(0x9D545454),
                                  disabledTextColor:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
