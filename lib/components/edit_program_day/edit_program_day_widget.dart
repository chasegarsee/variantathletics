import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_program_day_model.dart';
export 'edit_program_day_model.dart';

class EditProgramDayWidget extends StatefulWidget {
  const EditProgramDayWidget({
    super.key,
    required this.name,
    this.date,
    required this.day,
    required this.dayIndex,
    required this.program,
  });

  final String? name;
  final DateTime? date;
  final DaysStruct? day;
  final int? dayIndex;
  final ProgramsRecord? program;

  @override
  State<EditProgramDayWidget> createState() => _EditProgramDayWidgetState();
}

class _EditProgramDayWidgetState extends State<EditProgramDayWidget> {
  late EditProgramDayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditProgramDayModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.name = widget.name!;
        _model.date = widget.date;
      });
    });

    _model.textController ??= TextEditingController(text: widget.name);
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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Stack(
        alignment: AlignmentDirectional(1.0, 0.0),
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
                height: 220.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (_model.editing)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.isLoading = true;
                              });
                              await actions.updateDayName(
                                widget.program!.reference.id,
                                FFAppState().editProgramSelectedWeekIndex,
                                widget.dayIndex!,
                                _model.textController.text,
                                _model.calendarSelectedDay?.end,
                              );
                              setState(() {
                                _model.editing = !_model.editing;
                                _model.isLoading = false;
                                _model.name = _model.textController.text;
                                _model.date = _model.calendarSelectedDay?.end;
                              });
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.25,
                              height: MediaQuery.sizeOf(context).height * 0.75,
                              decoration: BoxDecoration(),
                              child: Icon(
                                Icons.check,
                                color: _model.isLoading
                                    ? Color(0xCCD0D0D0)
                                    : FlutterFlowTheme.of(context).accent2,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ),
                      if (!_model.editing)
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                _model.editing = !_model.editing;
                              });
                            },
                            child: Container(
                              width: MediaQuery.sizeOf(context).width * 0.25,
                              height: 80.0,
                              decoration: BoxDecoration(),
                              child: Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Icon(
                                  Icons.edit_sharp,
                                  color: FlutterFlowTheme.of(context).accent2,
                                  size: 24.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.5,
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (!_model.editing)
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'qo627wbu' /* Workout Name */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Jost',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                              ),
                                        ),
                                        Text(
                                          _model.name,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                              if (_model.editing)
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.5,
                                      child: TextFormField(
                                        controller: _model.textController,
                                        focusNode: _model.textFieldFocusNode,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: FFLocalizations.of(context)
                                              .getText(
                                            'dh4u7a0b' /* Workout Name */,
                                          ),
                                          labelStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Jost',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                              ),
                                          alignLabelWithHint: true,
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Jost',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                              ),
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
                                        validator: _model
                                            .textControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if ((widget.date != null) && !_model.editing)
                                    Text(
                                      FFLocalizations.of(context).getText(
                                        'pmlti0yk' /* Date */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Jost',
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                          ),
                                    ),
                                  if ((widget.date != null) && !_model.editing)
                                    Text(
                                      dateTimeFormat(
                                        'yMMMd',
                                        _model.date,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  if ((widget.date != null) && _model.editing)
                                    FlutterFlowCalendar(
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      iconColor:
                                          FlutterFlowTheme.of(context).accent2,
                                      weekFormat: true,
                                      weekStartsMonday: true,
                                      initialDate: widget.date,
                                      rowHeight: 34.0,
                                      onChange:
                                          (DateTimeRange? newSelectedDate) {
                                        setState(() =>
                                            _model.calendarSelectedDay =
                                                newSelectedDate);
                                      },
                                      titleStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Jost',
                                            fontSize: 14.0,
                                          ),
                                      dayOfWeekStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily: 'Jost',
                                                fontSize: 14.0,
                                              ),
                                      dateStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      selectedDateStyle:
                                          FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily: 'Jost',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                              ),
                                      inactiveDateStyle:
                                          FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Jost',
                                                fontSize: 14.0,
                                              ),
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (!_model.editing)
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            setState(() {
                              FFAppState().editProgramSelectedDay = widget.day!;
                              FFAppState().editProgramSelectedDayIndex =
                                  widget.dayIndex!;
                            });

                            context.pushNamed(
                              'editWorkout',
                              queryParameters: {
                                'program': serializeParam(
                                  widget.program,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'program': widget.program,
                              },
                            );
                          },
                          child: Container(
                            width: 75.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Icon(
                              Icons.keyboard_double_arrow_right_rounded,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? FlutterFlowTheme.of(context).accent1
                                  : FlutterFlowTheme.of(context).accent2,
                              size: 36.0,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
