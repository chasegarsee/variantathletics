import '/backend/schema/structs/index.dart';
import '/components/set_editor_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/backend/schema/structs/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
  }) : super(key: key);

  final String? name;
  final String? sets;
  final String? reps;
  final String? tempo;
  final String? workTime;
  final String? restTime;
  final int? index;

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

    _model.textController ??= TextEditingController(text: widget.reps);
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
      child: Material(
        color: Colors.transparent,
        elevation: 3.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: double.infinity,
          height: 300.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width * 0.75,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
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
                                  ..name = _model.dropDownValue,
                              ),
                          );
                        });
                      },
                      width: 300.0,
                      height: 50.0,
                      textStyle: FlutterFlowTheme.of(context).bodyMedium,
                      hintText: FFLocalizations.of(context).getText(
                        'ox6sj0nm' /* Please select... */,
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
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isOverButton: true,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        widget.name!,
                        style: FlutterFlowTheme.of(context)
                            .titleMedium
                            .override(
                              fontFamily: 'Jost',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '6tbl6vq9' /* Sets */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Jost',
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                        ),
                                  ),
                                  Text(
                                    widget.sets!,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Container(
                                    width: 200.0,
                                    decoration: BoxDecoration(),
                                  ),
                                  Container(
                                    width: 200.0,
                                    child: wrapWithModel(
                                      model: _model.setEditorModel,
                                      updateCallback: () => setState(() {}),
                                      updateOnChange: true,
                                      child: SetEditorWidget(
                                        sets: widget.sets,
                                        exersiseIndex: widget.index!,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'lk81akwj' /* Reps */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Jost',
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                        ),
                                  ),
                                  Text(
                                    widget.reps!,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                  Container(
                                    width: 200.0,
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Container(
                                        width: 50.0,
                                        child: TextFormField(
                                          controller: _model.textController,
                                          focusNode: _model.textFieldFocusNode,
                                          onChanged: (_) =>
                                              EasyDebounce.debounce(
                                            '_model.textController',
                                            Duration(milliseconds: 500),
                                            () async {
                                              setState(() {
                                                FFAppState()
                                                    .updateEditProgramSelectedDayStruct(
                                                  (e) => e
                                                    ..updateExercises(
                                                      (e) => e[widget.index!]
                                                        ..reps = _model
                                                            .textController
                                                            .text,
                                                    ),
                                                );
                                              });
                                            },
                                          ),
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            labelText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'dhvsd13m' /* Label here... */,
                                            ),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                            ),
                                            errorBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .error,
                                                width: 2.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
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
                                                  BorderRadius.circular(0.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                          maxLength: 3,
                                          maxLengthEnforcement:
                                              MaxLengthEnforcement.enforced,
                                          validator: _model
                                              .textControllerValidator
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
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '3ywaox9j' /* Tempo */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Jost',
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                        ),
                                  ),
                                  Text(
                                    widget.tempo!,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      '1lyjzrse' /* Work Time */,
                                    ),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Jost',
                                          color: FlutterFlowTheme.of(context)
                                              .accent2,
                                        ),
                                  ),
                                  Text(
                                    widget.workTime!,
                                    textAlign: TextAlign.start,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    FFLocalizations.of(context).getText(
                                      'ai3oxtn1' /* Rest Time */,
                                    ),
                                    textAlign: TextAlign.end,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Jost',
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                        ),
                                  ),
                                  Text(
                                    widget.restTime!,
                                    textAlign: TextAlign.end,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ],
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
      ),
    );
  }
}
