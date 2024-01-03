import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/days_placeholder/days_placeholder_widget.dart';
import '/components/leave_workout_comment/leave_workout_comment_widget.dart';
import '/components/program_timer/program_timer_widget.dart';
import '/components/select_program/select_program_widget.dart';
import '/components/workout_comments/workout_comments_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'program_model.dart';
export 'program_model.dart';

class ProgramWidget extends StatefulWidget {
  const ProgramWidget({
    Key? key,
    bool? isFromTimer,
  })  : this.isFromTimer = isFromTimer ?? false,
        super(key: key);

  final bool isFromTimer;

  @override
  _ProgramWidgetState createState() => _ProgramWidgetState();
}

class _ProgramWidgetState extends State<ProgramWidget> {
  late ProgramModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgramModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if ((valueOrDefault(currentUserDocument?.currentProgram, '') == null ||
              valueOrDefault(currentUserDocument?.currentProgram, '') == '') ||
          (FFAppState().currentProgram == null ||
              FFAppState().currentProgram == '')) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          enableDrag: false,
          useSafeArea: true,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  child: SelectProgramWidget(),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));

        setState(() {
          FFAppState().isDailySelectedDay = getCurrentTimestamp;
        });
        return;
      } else {
        _model.currentProgram = await queryProgramsRecordOnce(
          queryBuilder: (programsRecord) => programsRecord.where(
            'id',
            isEqualTo: valueOrDefault(currentUserDocument?.currentProgram, ''),
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
        if (_model.currentProgram!.isDaily) {
          setState(() {
            FFAppState().selectedWeek =
                _model.currentProgram!.weeks.first.weekNumber;
            FFAppState().days = functions
                .setDays(_model.currentProgram!.weeks.toList())
                .toList()
                .cast<DaysStruct>();
            FFAppState().programExercises = functions
                .getCurrentDateExercises(
                    _model.currentProgram!.weeks.toList(), getCurrentTimestamp)!
                .toList()
                .cast<ProgramExercisesStruct>();
            FFAppState().selectedDayName =
                _model.currentProgram!.weeks.first.days.first.name;
            FFAppState().selectedDay = _model.currentProgram!.weeks.first.days
                .where((e) =>
                    dateTimeFormat(
                      'MMMEd',
                      e.date,
                      locale: FFLocalizations.of(context).languageCode,
                    ) ==
                    dateTimeFormat(
                      'MMMEd',
                      getCurrentTimestamp,
                      locale: FFLocalizations.of(context).languageCode,
                    ))
                .toList()
                .first
                .day;
            FFAppState().selectedDayId = _model.currentProgram!.weeks.first.days
                .where((e) =>
                    dateTimeFormat(
                      'MMMEd',
                      e.date,
                      locale: FFLocalizations.of(context).languageCode,
                    ) ==
                    dateTimeFormat(
                      'MMMEd',
                      getCurrentTimestamp,
                      locale: FFLocalizations.of(context).languageCode,
                    ))
                .toList()
                .first
                .id;
            FFAppState().weeks =
                _model.currentProgram!.weeks.toList().cast<WeeksStruct>();
            FFAppState().currentProgram = _model.currentProgram!.name;
            FFAppState().currentProgramId = _model.currentProgram!.reference.id;
            FFAppState().showAllWeeks = false;
            FFAppState().isDaily = _model.currentProgram!.isDaily;
            FFAppState().isDailySelectedDay = getCurrentTimestamp;
            FFAppState().showAllDays = true;
          });
          return;
        } else {
          setState(() {
            FFAppState().selectedWeek =
                _model.currentProgram!.weeks.first.weekNumber;
            FFAppState().days = functions
                .setDays(_model.currentProgram!.weeks.toList())
                .toList()
                .cast<DaysStruct>();
            FFAppState().programExercises = functions
                .setExercises(_model.currentProgram!.weeks.first)
                .toList()
                .cast<ProgramExercisesStruct>();
            FFAppState().selectedDayName =
                _model.currentProgram!.weeks.first.days.first.name;
            FFAppState().selectedDay =
                _model.currentProgram!.weeks.first.days.first.day;
            FFAppState().selectedDayId =
                _model.currentProgram!.weeks.first.days.first.id;
            FFAppState().weeks =
                _model.currentProgram!.weeks.toList().cast<WeeksStruct>();
            FFAppState().currentProgram = _model.currentProgram!.name;
            FFAppState().currentProgramId = _model.currentProgram!.reference.id;
            FFAppState().showAllWeeks = false;
            FFAppState().isDaily = _model.currentProgram!.isDaily;
            FFAppState().isDailySelectedDay = getCurrentTimestamp;
            FFAppState().showAllDays = false;
          });
          return;
        }
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFAppState().currentProgram,
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Jost',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                ),
          ),
          actions: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        enableDrag: false,
                        context: context,
                        builder: (context) {
                          return GestureDetector(
                            onTap: () => _model.unfocusNode.canRequestFocus
                                ? FocusScope.of(context)
                                    .requestFocus(_model.unfocusNode)
                                : FocusScope.of(context).unfocus(),
                            child: Padding(
                              padding: MediaQuery.viewInsetsOf(context),
                              child: Container(
                                height: MediaQuery.sizeOf(context).height * 0.4,
                                child: SelectProgramWidget(),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: FaIcon(
                      FontAwesomeIcons.exchangeAlt,
                      color: FlutterFlowTheme.of(context).accent2,
                      size: 28.0,
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: !widget.isFromTimer,
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pushNamed(
                      'timer',
                      queryParameters: {
                        'isFromProgram': serializeParam(
                          true,
                          ParamType.bool,
                        ),
                      }.withoutNulls,
                    );
                  },
                  child: Icon(
                    Icons.timer,
                    color: FlutterFlowTheme.of(context).accent2,
                    size: 35.0,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Visibility(
            visible: !_model.isLoading,
            child: Stack(
              children: [
                if (!_model.isLoading)
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 5.0,
                          child: Container(
                            width: double.infinity,
                            height: 75.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4.0,
                                  color: Color(0x33000000),
                                  offset: Offset(0.0, 2.0),
                                )
                              ],
                            ),
                            child: Stack(
                              children: [
                                if (!FFAppState().isDaily)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          if (!FFAppState().showAllWeeks)
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              borderWidth: 0.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons
                                                    .keyboard_double_arrow_left,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                size: 20.0,
                                              ),
                                              onPressed: () async {
                                                setState(() {
                                                  FFAppState().showAllWeeks =
                                                      true;
                                                });
                                              },
                                            ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final weeks =
                                                    FFAppState().weeks.toList();
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: List.generate(
                                                        weeks.length,
                                                        (weeksIndex) {
                                                      final weeksItem =
                                                          weeks[weeksIndex];
                                                      return Visibility(
                                                        visible: FFAppState()
                                                                .showAllWeeks ||
                                                            (weeksItem
                                                                    .weekNumber ==
                                                                FFAppState()
                                                                    .selectedWeek),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              FFAppState()
                                                                      .selectedWeek =
                                                                  weeksItem
                                                                      .weekNumber;
                                                              FFAppState()
                                                                      .days =
                                                                  weeksItem.days
                                                                      .toList()
                                                                      .cast<
                                                                          DaysStruct>();
                                                              FFAppState()
                                                                      .programExercises =
                                                                  functions
                                                                      .setExercises(
                                                                          weeksItem)
                                                                      .toList()
                                                                      .cast<
                                                                          ProgramExercisesStruct>();
                                                              FFAppState()
                                                                      .selectedDayName =
                                                                  weeksItem
                                                                      .days
                                                                      .first
                                                                      .name;
                                                              FFAppState()
                                                                      .selectedDay =
                                                                  weeksItem
                                                                      .days
                                                                      .first
                                                                      .day;
                                                              FFAppState()
                                                                      .selectedDayId =
                                                                  weeksItem.days
                                                                      .first.id;
                                                              FFAppState()
                                                                      .showAllWeeks =
                                                                  !FFAppState()
                                                                      .showAllWeeks;
                                                            });
                                                          },
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        3.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          50.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: weeksItem.weekNumber ==
                                                                                FFAppState().selectedWeek
                                                                            ? FlutterFlowTheme.of(context).accent2
                                                                            : FlutterFlowTheme.of(context).primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'W-${weeksItem.weekNumber.toString()}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (functions.isWeekComplete(
                                                                  weeksItem
                                                                      .weekNumber,
                                                                  (currentUserDocument
                                                                              ?.completedWorkouts
                                                                              ?.toList() ??
                                                                          [])
                                                                      .toList(),
                                                                  weeksItem.id,
                                                                  weeksItem.days
                                                                      .length))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.79,
                                                                          -0.82),
                                                                  child:
                                                                      AuthUserStreamWidget(
                                                                    builder:
                                                                        (context) =>
                                                                            Container(
                                                                      width:
                                                                          20.0,
                                                                      height:
                                                                          20.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .checkDouble,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              15.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final day =
                                                    FFAppState().days.toList();
                                                if (day.isEmpty) {
                                                  return DaysPlaceholderWidget();
                                                }
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: List.generate(
                                                        day.length, (dayIndex) {
                                                      final dayItem =
                                                          day[dayIndex];
                                                      return Visibility(
                                                        visible: FFAppState()
                                                                .showAllDays ||
                                                            (FFAppState()
                                                                    .selectedDay ==
                                                                dayItem.day),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              FFAppState()
                                                                      .programExercises =
                                                                  dayItem
                                                                      .exercises
                                                                      .toList()
                                                                      .cast<
                                                                          ProgramExercisesStruct>();
                                                              FFAppState()
                                                                      .selectedDayName =
                                                                  dayItem.name;
                                                              FFAppState()
                                                                      .selectedDay =
                                                                  dayItem.day;
                                                              FFAppState()
                                                                      .selectedDayId =
                                                                  dayItem.id;
                                                              FFAppState()
                                                                      .showAllDays =
                                                                  !FFAppState()
                                                                      .showAllDays;
                                                            });
                                                          },
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        3.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          30.0,
                                                                      height:
                                                                          50.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: dayItem.day ==
                                                                                FFAppState().selectedDay
                                                                            ? FlutterFlowTheme.of(context).accent2
                                                                            : FlutterFlowTheme.of(context).primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'D-${dayItem.day.toString()}',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyMedium,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if ((currentUserDocument
                                                                          ?.completedWorkouts
                                                                          ?.toList() ??
                                                                      [])
                                                                  .contains(
                                                                      dayItem
                                                                          .id))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.79,
                                                                          -0.82),
                                                                  child:
                                                                      AuthUserStreamWidget(
                                                                    builder:
                                                                        (context) =>
                                                                            Container(
                                                                      width:
                                                                          20.0,
                                                                      height:
                                                                          20.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .accent1,
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .checkDouble,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              15.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          if (!FFAppState().showAllDays)
                                            FlutterFlowIconButton(
                                              borderColor: Colors.transparent,
                                              borderRadius: 20.0,
                                              borderWidth: 0.0,
                                              buttonSize: 40.0,
                                              icon: Icon(
                                                Icons
                                                    .keyboard_double_arrow_right,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent1,
                                                size: 20.0,
                                              ),
                                              onPressed: () async {
                                                setState(() {
                                                  FFAppState().showAllDays =
                                                      true;
                                                });
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (FFAppState().isDaily)
                                  Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final day = FFAppState()
                                                    .days
                                                    .where((e) => functions
                                                        .isDateWithinLastSevenDays(
                                                            e.date!,
                                                            getCurrentTimestamp))
                                                    .toList()
                                                    .take(7)
                                                    .toList();
                                                if (day.isEmpty) {
                                                  return DaysPlaceholderWidget();
                                                }
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: List.generate(
                                                        day.length, (dayIndex) {
                                                      final dayItem =
                                                          day[dayIndex];
                                                      return Visibility(
                                                        visible: FFAppState()
                                                                .showAllDays ||
                                                            (FFAppState()
                                                                    .selectedDay ==
                                                                dayItem.day),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            setState(() {
                                                              FFAppState()
                                                                      .programExercises =
                                                                  dayItem
                                                                      .exercises
                                                                      .toList()
                                                                      .cast<
                                                                          ProgramExercisesStruct>();
                                                              FFAppState()
                                                                      .selectedDayName =
                                                                  dayItem.name;
                                                              FFAppState()
                                                                      .selectedDay =
                                                                  dayItem.day;
                                                              FFAppState()
                                                                      .selectedDayId =
                                                                  dayItem.id;
                                                              FFAppState()
                                                                      .isDailySelectedDay =
                                                                  dayItem.date;
                                                            });
                                                          },
                                                          child: Stack(
                                                            children: [
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child:
                                                                      Material(
                                                                    color: Colors
                                                                        .transparent,
                                                                    elevation:
                                                                        3.0,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                    ),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          50.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: dateTimeFormat(
                                                                                  'Md',
                                                                                  dayItem.date,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ) ==
                                                                                dateTimeFormat(
                                                                                  'Md',
                                                                                  FFAppState().isDailySelectedDay,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                )
                                                                            ? FlutterFlowTheme.of(context).accent2
                                                                            : FlutterFlowTheme.of(context).primary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        shape: BoxShape
                                                                            .rectangle,
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            dateTimeFormat(
                                                                              'MMM,d',
                                                                              dayItem.date!,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style:
                                                                                FlutterFlowTheme.of(context).bodyMedium,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              if (FFAppState()
                                                                  .completedDays
                                                                  .contains(
                                                                      dayItem
                                                                          .id))
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.79,
                                                                          -0.82),
                                                                  child:
                                                                      Container(
                                                                    width: 20.0,
                                                                    height:
                                                                        20.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent1,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .checkDouble,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            15.0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 24.0,
                              height: 24.0,
                              decoration: BoxDecoration(),
                              child: Visibility(
                                visible: FFAppState()
                                    .completedDays
                                    .contains(FFAppState().selectedDayId),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    setState(() {
                                      FFAppState().removeFromCompletedDays(
                                          FFAppState().selectedDayId);
                                    });

                                    await currentUserReference!.update({
                                      ...mapToFirestore(
                                        {
                                          'completedWorkouts':
                                              FieldValue.arrayRemove(
                                                  [FFAppState().selectedDayId]),
                                        },
                                      ),
                                    });
                                  },
                                  child: Icon(
                                    Icons.replay,
                                    color: FlutterFlowTheme.of(context).accent2,
                                    size: 24.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.7,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 10.0, 5.0, 10.0),
                              child: AutoSizeText(
                                FFAppState().selectedDayName,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .override(
                                      fontFamily: 'Jost',
                                      color:
                                          FlutterFlowTheme.of(context).accent2,
                                      fontSize: 24.0,
                                    ),
                                minFontSize: 14.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 12.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.5,
                                          child: WorkoutCommentsWidget(
                                            workoutId:
                                                FFAppState().selectedDayId,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: Icon(
                                Icons.comment_rounded,
                                color: FlutterFlowTheme.of(context).accent2,
                                size: 24.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: Container(
                                  width: 75.0,
                                  decoration: BoxDecoration(
                                    color: FFAppState()
                                                .intervalTimer
                                                .currentInterval ==
                                            FFAppState()
                                                .intervalTimer
                                                .workingInterval
                                        ? FlutterFlowTheme.of(context).success
                                        : FlutterFlowTheme.of(context).error,
                                    borderRadius: BorderRadius.circular(24.0),
                                  ),
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          useSafeArea: true,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.4,
                                                  child: ProgramTimerWidget(
                                                    resetTimer: () async {},
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(() {}));

                                        setState(() {
                                          _model.selectedTimer = true;
                                        });
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons.timer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 14.0,
                                            ),
                                          ),
                                          if (_model.selectedTimer)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: FlutterFlowTimer(
                                                initialTime: FFAppState()
                                                    .intervalTimer
                                                    .currentInterval,
                                                getDisplayTime: (value) =>
                                                    StopWatchTimer
                                                        .getDisplayTime(
                                                  value,
                                                  hours: false,
                                                  milliSecond: false,
                                                ),
                                                controller: _model
                                                    .intervalTimerController,
                                                updateStateInterval: Duration(
                                                    milliseconds: 1000),
                                                onChanged: (value, displayTime,
                                                    shouldUpdate) {
                                                  _model.intervalTimerMilliseconds =
                                                      value;
                                                  _model.intervalTimerValue =
                                                      displayTime;
                                                  if (shouldUpdate)
                                                    setState(() {});
                                                },
                                                onEnded: () async {
                                                  if (FFAppState()
                                                      .intervalTimer
                                                      .playSound) {
                                                    _model.soundPlayer ??=
                                                        AudioPlayer();
                                                    if (_model
                                                        .soundPlayer!.playing) {
                                                      await _model.soundPlayer!
                                                          .stop();
                                                    }
                                                    _model.soundPlayer!
                                                        .setVolume(1.0);
                                                    _model.soundPlayer!
                                                        .setAsset(
                                                            'assets/audios/ding.mp3')
                                                        .then((_) => _model
                                                            .soundPlayer!
                                                            .play());
                                                  }
                                                  setState(() {
                                                    FFAppState()
                                                        .updateIntervalTimerStruct(
                                                      (e) => e
                                                        ..currentInterval =
                                                            FFAppState()
                                                                        .intervalTimer
                                                                        .currentInterval ==
                                                                    FFAppState()
                                                                        .intervalTimer
                                                                        .workingInterval
                                                                ? FFAppState()
                                                                    .intervalTimer
                                                                    .restingInterval
                                                                : FFAppState()
                                                                    .intervalTimer
                                                                    .workingInterval,
                                                    );
                                                  });
                                                  if (FFAppState()
                                                          .intervalTimer
                                                          .currentInterval ==
                                                      FFAppState()
                                                          .intervalTimer
                                                          .restingInterval) {
                                                    setState(() {
                                                      FFAppState()
                                                          .updateIntervalTimerStruct(
                                                        (e) => e
                                                          ..incrementCompletedIntervals(
                                                              1),
                                                      );
                                                    });
                                                  }
                                                  _model.intervalTimerController
                                                      .timer
                                                      .setPresetTime(
                                                    mSec: FFAppState()
                                                        .intervalTimer
                                                        .currentInterval,
                                                    add: false,
                                                  );
                                                  _model.intervalTimerController
                                                      .onResetTimer();

                                                  _model.intervalTimerController
                                                      .onStartTimer();
                                                },
                                                textAlign: TextAlign.start,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily: 'Jost',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                          fontSize: 14.0,
                                                        ),
                                              ),
                                            ),
                                          if (!_model.selectedTimer)
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  '9mh31rff' /* Timer */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Jost',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '5xzomvk3' /* Elapsed */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                        FlutterFlowTimer(
                                          initialTime:
                                              _model.elapsedTimerMilliseconds,
                                          getDisplayTime: (value) =>
                                              StopWatchTimer.getDisplayTime(
                                                  value,
                                                  milliSecond: false),
                                          controller:
                                              _model.elapsedTimerController,
                                          updateStateInterval:
                                              Duration(milliseconds: 1000),
                                          onChanged: (value, displayTime,
                                              shouldUpdate) {
                                            _model.elapsedTimerMilliseconds =
                                                value;
                                            _model.elapsedTimerValue =
                                                displayTime;
                                            if (shouldUpdate) setState(() {});
                                          },
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Jost',
                                                fontSize: 14.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (_model.selectedTimer)
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (!FFAppState().intervalTimer.isOn)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                _model.intervalTimerController
                                                    .onStartTimer();
                                                _model.elapsedTimerController
                                                    .onStartTimer();
                                                setState(() {
                                                  FFAppState()
                                                      .updateIntervalTimerStruct(
                                                    (e) => e..isOn = true,
                                                  );
                                                });
                                              },
                                              text: '',
                                              icon: Icon(
                                                Icons.play_arrow_outlined,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: 40.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .success,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Jost',
                                                          fontSize: 24.0,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                          ),
                                        if (FFAppState().intervalTimer.isOn)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                setState(() {
                                                  FFAppState()
                                                      .updateIntervalTimerStruct(
                                                    (e) => e..isOn = false,
                                                  );
                                                });
                                                _model.intervalTimerController
                                                    .onStopTimer();
                                                _model.elapsedTimerController
                                                    .onStopTimer();
                                              },
                                              text: '',
                                              icon: Icon(
                                                Icons.pause,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                size: 20.0,
                                              ),
                                              options: FFButtonOptions(
                                                width: 40.0,
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .warning,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleLarge,
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              showLoadingIndicator: false,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 10.0, 0.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'i2m1flh2' /* Sets */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Jost',
                                                  fontSize: 14.0,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          FFAppState()
                                              .intervalTimer
                                              .completedIntervals
                                              .toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Jost',
                                                fontSize: 14.0,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (FFAppState().programExercises.length >= 1)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 10.0),
                            child: Builder(
                              builder: (context) {
                                final exerciseList =
                                    FFAppState().programExercises.toList();
                                if (exerciseList.isEmpty) {
                                  return Image.asset(
                                    '',
                                  );
                                }
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount: exerciseList.length,
                                  itemBuilder: (context, exerciseListIndex) {
                                    final exerciseListItem =
                                        exerciseList[exerciseListIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 5.0, 0.0, 5.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.25,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'exercise',
                                                      queryParameters: {
                                                        'exerciseId':
                                                            serializeParam(
                                                          exerciseListItem.id,
                                                          ParamType.String,
                                                        ),
                                                        'exercise':
                                                            serializeParam(
                                                          exerciseListItem.name,
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );
                                                  },
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: CachedNetworkImage(
                                                      fadeInDuration: Duration(
                                                          milliseconds: 500),
                                                      fadeOutDuration: Duration(
                                                          milliseconds: 500),
                                                      imageUrl:
                                                          '${FFAppState().exerciseBase}${exerciseListItem.id}.png?alt=media',
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      fit: BoxFit.cover,
                                                      errorWidget: (context,
                                                              error,
                                                              stackTrace) =>
                                                          Image.asset(
                                                        'assets/images/error_image.png',
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.75,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          exerciseListItem.name,
                                                          '-',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Jost',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'xj8pase6' /* Sets */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Jost',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      exerciseListItem
                                                                          .sets,
                                                                      '-',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ed2bmguh' /* Reps */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Jost',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      exerciseListItem
                                                                          .reps,
                                                                      '-',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'f99yl0no' /* Tempo */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Jost',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      exerciseListItem
                                                                          .tempo,
                                                                      '-',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'ntm5c1n4' /* Work Time */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Jost',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).accent2,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      exerciseListItem
                                                                          .workTime,
                                                                      '-',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      '81yyycmt' /* Rest Time */,
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Jost',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).error,
                                                                        ),
                                                                  ),
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      exerciseListItem
                                                                          .restTime,
                                                                      '-',
                                                                    ),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
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
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      if (!FFAppState()
                          .completedDays
                          .contains(FFAppState().selectedDayId))
                        Padding(
                          padding: EdgeInsets.all(24.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              setState(() {
                                FFAppState().addToCompletedDays(
                                    FFAppState().selectedDayId);
                              });

                              await currentUserReference!.update({
                                ...mapToFirestore(
                                  {
                                    'completedWorkouts': FieldValue.arrayUnion(
                                        [FFAppState().selectedDayId]),
                                  },
                                ),
                              });
                              if (FFAppState().leaveComments) {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return GestureDetector(
                                      onTap: () => _model
                                              .unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                      child: Padding(
                                        padding:
                                            MediaQuery.viewInsetsOf(context),
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.75,
                                          child: LeaveWorkoutCommentWidget(
                                            workoutId:
                                                FFAppState().selectedDayId,
                                            displayName: currentUserDisplayName,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              } else {
                                return;
                              }
                            },
                            text: FFLocalizations.of(context).getText(
                              'di4t2jeu' /* Complete Workout */,
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
                                    color: Colors.white,
                                    fontSize: 22.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
