import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/backend/schema/structs/index.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_exercise_model.dart';
export 'edit_exercise_model.dart';

class EditExerciseWidget extends StatefulWidget {
  const EditExerciseWidget({
    Key? key,
    this.name,
    this.sets,
    this.reps,
    this.tempo,
    this.workTime,
    this.restTime,
    required this.index,
    required this.programId,
  }) : super(key: key);

  final String? name;
  final String? sets;
  final String? reps;
  final String? tempo;
  final String? workTime;
  final String? restTime;
  final int? index;
  final DocumentReference? programId;

  @override
  _EditExerciseWidgetState createState() => _EditExerciseWidgetState();
}

class _EditExerciseWidgetState extends State<EditExerciseWidget> {
  late EditExerciseModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditExerciseModel());

    _model.textController1 ??= TextEditingController(text: widget.sets);
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController(text: widget.reps);
    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textController3 ??= TextEditingController(text: widget.tempo);
    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textController4 ??= TextEditingController(text: widget.workTime);
    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textController5 ??= TextEditingController(text: widget.restTime);
    _model.textFieldFocusNode5 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
          child: Material(
            color: Colors.transparent,
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 500),
                        fadeOutDuration: Duration(milliseconds: 500),
                        imageUrl:
                            '${FFAppState().exerciseBase}${functions.convertStringToHyphenatedLowerCase(FFAppState().editProgramSelectedDay.exercises[widget.index!].id)}.png?alt=media',
                        width: MediaQuery.sizeOf(context).width * 0.25,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??= widget.name,
                          ),
                          options: FFAppState()
                              .exercises
                              .map((e) => ExercisesStruct.maybeFromMap(e)?.name)
                              .withoutNulls
                              .toList(),
                          onChanged: (val) async {
                            setState(() => _model.dropDownValue = val);
                            setState(() {
                              FFAppState().updateEditProgramSelectedDayStruct(
                                (e) => e
                                  ..updateExercises(
                                    (e) => e[widget.index!]
                                      ..name = _model.dropDownValue
                                      ..id = functions
                                          .convertStringToHyphenatedLowerCase(
                                              _model.dropDownValue!),
                                  ),
                              );
                            });
                          },
                          width: 300.0,
                          height: 50.0,
                          searchHintTextStyle:
                              FlutterFlowTheme.of(context).labelMedium,
                          textStyle: FlutterFlowTheme.of(context).bodyMedium,
                          hintText: FFLocalizations.of(context).getText(
                            '8wquxxn7' /* Select Exercise... */,
                          ),
                          searchHintText: FFLocalizations.of(context).getText(
                            '37csumcw' /* Search for an exercise... */,
                          ),
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: true,
                          isMultiSelect: false,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 75.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Container(
                                            width: 50.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.textController1,
                                              focusNode:
                                                  _model.textFieldFocusNode1,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController1',
                                                Duration(milliseconds: 500),
                                                () async {
                                                  setState(() {
                                                    FFAppState()
                                                        .updateEditProgramSelectedDayStruct(
                                                      (e) => e
                                                        ..updateExercises(
                                                          (e) => e[
                                                              widget.index!]
                                                            ..sets = _model
                                                                .textController1
                                                                .text,
                                                        ),
                                                    );
                                                  });
                                                },
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'w281g3cm' /* sets */,
                                                ),
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Jost',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent2,
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              validator: _model
                                                  .textController1Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        width: 75.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Container(
                                            width: 50.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.textController2,
                                              focusNode:
                                                  _model.textFieldFocusNode2,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController2',
                                                Duration(milliseconds: 500),
                                                () async {
                                                  setState(() {
                                                    FFAppState()
                                                        .updateEditProgramSelectedDayStruct(
                                                      (e) => e
                                                        ..updateExercises(
                                                          (e) => e[
                                                              widget.index!]
                                                            ..reps = _model
                                                                .textController2
                                                                .text,
                                                        ),
                                                    );
                                                  });
                                                },
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '5ukprbsb' /* reps */,
                                                ),
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Jost',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent2,
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              validator: _model
                                                  .textController2Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 75.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Container(
                                            width: 50.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.textController3,
                                              focusNode:
                                                  _model.textFieldFocusNode3,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController3',
                                                Duration(milliseconds: 500),
                                                () async {
                                                  setState(() {
                                                    FFAppState()
                                                        .updateEditProgramSelectedDayStruct(
                                                      (e) => e
                                                        ..updateExercises(
                                                          (e) => e[
                                                              widget.index!]
                                                            ..tempo = _model
                                                                .textController3
                                                                .text,
                                                        ),
                                                    );
                                                  });
                                                },
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '60um87cx' /* tempo */,
                                                ),
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Jost',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent2,
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              validator: _model
                                                  .textController3Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Container(
                                            width: 50.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.textController4,
                                              focusNode:
                                                  _model.textFieldFocusNode4,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController4',
                                                Duration(milliseconds: 500),
                                                () async {
                                                  setState(() {
                                                    FFAppState()
                                                        .updateEditProgramSelectedDayStruct(
                                                      (e) => e
                                                        ..updateExercises(
                                                          (e) => e[
                                                              widget.index!]
                                                            ..workTime = _model
                                                                .textController4
                                                                .text,
                                                        ),
                                                    );
                                                  });
                                                },
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  '9745ik8c' /* Working Time */,
                                                ),
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Jost',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent2,
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              validator: _model
                                                  .textController4Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 100.0,
                                        decoration: BoxDecoration(),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  8.0, 0.0, 8.0, 0.0),
                                          child: Container(
                                            width: 50.0,
                                            child: TextFormField(
                                              controller:
                                                  _model.textController5,
                                              focusNode:
                                                  _model.textFieldFocusNode5,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController5',
                                                Duration(milliseconds: 500),
                                                () async {
                                                  setState(() {
                                                    FFAppState()
                                                        .updateEditProgramSelectedDayStruct(
                                                      (e) => e
                                                        ..updateExercises(
                                                          (e) => e[
                                                              widget.index!]
                                                            ..restTime = _model
                                                                .textController5
                                                                .text,
                                                        ),
                                                    );
                                                  });
                                                },
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                labelText:
                                                    FFLocalizations.of(context)
                                                        .getText(
                                                  'ag10mm7l' /* Rest Time */,
                                                ),
                                                labelStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Jost',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent2,
                                                        ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .error,
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium,
                                              validator: _model
                                                  .textController5Validator
                                                  .asValidator(context),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '7p63f6nf' /* Super Set */,
                                    ),
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Theme(
                                    data: ThemeData(
                                      checkboxTheme: CheckboxThemeData(
                                        visualDensity: VisualDensity.compact,
                                        materialTapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                        ),
                                      ),
                                      unselectedWidgetColor:
                                          FlutterFlowTheme.of(context).error,
                                    ),
                                    child: Checkbox(
                                      value: _model.checkboxValue ??= true,
                                      onChanged: (newValue) async {
                                        setState(() =>
                                            _model.checkboxValue = newValue!);
                                      },
                                      activeColor:
                                          FlutterFlowTheme.of(context).accent2,
                                      checkColor:
                                          FlutterFlowTheme.of(context).info,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (!_model.hasSelectedSuperSet ||
                                      (_model.selectedSuperset
                                              .contains('#EE8B60') ==
                                          true))
                                    ToggleIcon(
                                      onPressed: () async {
                                        setState(
                                          () => _model.selectedSuperset
                                                  .contains('#EE8B60')
                                              ? _model
                                                  .removeFromSelectedSuperset(
                                                      '#EE8B60')
                                              : _model.addToSelectedSuperset(
                                                  '#EE8B60'),
                                        );
                                        setState(() {
                                          _model.hasSelectedSuperSet =
                                              !_model.hasSelectedSuperSet;
                                        });
                                        if (_model.selectedSuperset.length >=
                                            1) {
                                          setState(() {
                                            _model.selectedSuperset = [];
                                          });
                                        } else {
                                          setState(() {
                                            _model.addToSelectedSuperset(
                                                '#EE8B60');
                                          });
                                        }
                                      },
                                      value: _model.selectedSuperset
                                          .contains('#EE8B60'),
                                      onIcon: Icon(
                                        Icons.radio_button_checked_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 25.0,
                                      ),
                                      offIcon: Icon(
                                        Icons.radio_button_off,
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                        size: 25.0,
                                      ),
                                    ),
                                  if (!_model.hasSelectedSuperSet ||
                                      (_model.selectedSuperset
                                              .contains(_model.purple) ==
                                          true))
                                    ToggleIcon(
                                      onPressed: () async {
                                        setState(
                                          () => _model.selectedSuperset
                                                  .contains(_model.purple)
                                              ? _model
                                                  .removeFromSelectedSuperset(
                                                      _model.purple)
                                              : _model.addToSelectedSuperset(
                                                  _model.purple),
                                        );
                                        setState(() {
                                          _model.hasSelectedSuperSet =
                                              !_model.hasSelectedSuperSet;
                                        });
                                        if (_model.selectedSuperset.length ==
                                            1) {
                                          setState(() {
                                            _model.selectedSuperset = [];
                                          });
                                        } else {
                                          setState(() {
                                            _model.addToSelectedSuperset(
                                                '#9CBA20FF');
                                          });
                                        }
                                      },
                                      value: _model.selectedSuperset
                                          .contains(_model.purple),
                                      onIcon: Icon(
                                        Icons.radio_button_checked_sharp,
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        size: 25.0,
                                      ),
                                      offIcon: Icon(
                                        Icons.radio_button_off,
                                        color: FlutterFlowTheme.of(context)
                                            .accent1,
                                        size: 25.0,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            final color = _model.selectedSuperset.toList();
                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: color.length,
                              itemBuilder: (context, colorIndex) {
                                final colorItem = color[colorIndex];
                                return Text(
                                  colorItem,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0.95, -0.89),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await actions.deleteExerciseFromWorkout(
                widget.programId!.id,
                FFAppState().editProgramSelectedWeekIndex,
                FFAppState().editProgramSelectedDayIndex,
                widget.index!,
              );
            },
            child: FaIcon(
              FontAwesomeIcons.trashAlt,
              color: FlutterFlowTheme.of(context).error,
              size: 20.0,
            ),
          ),
        ),
      ],
    );
  }
}
