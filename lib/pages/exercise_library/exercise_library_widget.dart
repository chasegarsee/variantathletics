import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/rev_cat_paywall/rev_cat_paywall_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'exercise_library_model.dart';
export 'exercise_library_model.dart';

class ExerciseLibraryWidget extends StatefulWidget {
  const ExerciseLibraryWidget({Key? key}) : super(key: key);

  @override
  _ExerciseLibraryWidgetState createState() => _ExerciseLibraryWidgetState();
}

class _ExerciseLibraryWidgetState extends State<ExerciseLibraryWidget> {
  late ExerciseLibraryModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExerciseLibraryModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().exercises.length <= 0) {
        _model.exerciseList = await queryExercisesRecordOnce();
        FFAppState().update(() {
          FFAppState().exercises = functions
              .convertFBExerciseToJSON(_model.exerciseList?.toList())!
              .toList()
              .cast<dynamic>();
          FFAppState().isInitialLoad = false;
        });
        setState(() {
          _model.filteredExercises =
              FFAppState().exercises.toList().cast<dynamic>();
        });
        return;
      } else {
        FFAppState().update(() {
          FFAppState().exercises =
              FFAppState().exercises.toList().cast<dynamic>();
          FFAppState().isInitialLoad = false;
        });
        setState(() {
          _model.filteredExercises =
              FFAppState().exercises.toList().cast<dynamic>();
        });
        return;
      }
    });
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
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'rvjg82nr' /* VARIANT */,
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Jost',
                        fontSize: 32.0,
                      ),
                ),
              ),
            ],
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 20.0,
              borderWidth: 0.0,
              buttonSize: 40.0,
              icon: Icon(
                Icons.person,
                color: FlutterFlowTheme.of(context).accent2,
                size: 25.0,
              ),
              onPressed: () async {
                context.pushNamed('profile');
              },
            ),
            Visibility(
              visible: !FFAppState().isTimerRunning,
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 0.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.timer,
                  color: FlutterFlowTheme.of(context).accent2,
                  size: 25.0,
                ),
                onPressed: () async {
                  final isEntitled =
                      await revenue_cat.isEntitled('all_access') ?? false;
                  if (!isEntitled) {
                    await revenue_cat.loadOfferings();
                  }

                  if (isEntitled) {
                    context.pushNamed(
                      'timer',
                      queryParameters: {
                        'isFromProgram': serializeParam(
                          false,
                          ParamType.bool,
                        ),
                      }.withoutNulls,
                    );

                    return;
                  } else {
                    if (valueOrDefault<bool>(
                        currentUserDocument?.isSubbed, false)) {
                      context.pushNamed(
                        'timer',
                        queryParameters: {
                          'isFromProgram': serializeParam(
                            false,
                            ParamType.bool,
                          ),
                        }.withoutNulls,
                      );

                      return;
                    } else {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        useSafeArea: true,
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
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: RevCatPaywallWidget(
                                  navigateTo: 'timer',
                                ),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));

                      return;
                    }
                  }
                },
              ),
            ),
            Visibility(
              visible: !FFAppState().isTimerRunning,
              child: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 20.0,
                borderWidth: 0.0,
                buttonSize: 40.0,
                icon: Icon(
                  Icons.library_books,
                  color: FlutterFlowTheme.of(context).accent2,
                  size: 25.0,
                ),
                onPressed: () async {
                  final isEntitled =
                      await revenue_cat.isEntitled('all_access') ?? false;
                  if (!isEntitled) {
                    await revenue_cat.loadOfferings();
                  }

                  if (isEntitled) {
                    context.pushNamed(
                      'program',
                      queryParameters: {
                        'isFromTimer': serializeParam(
                          false,
                          ParamType.bool,
                        ),
                      }.withoutNulls,
                    );

                    return;
                  } else {
                    if (valueOrDefault<bool>(
                        currentUserDocument?.isSubbed, false)) {
                      context.pushNamed(
                        'program',
                        queryParameters: {
                          'isFromTimer': serializeParam(
                            false,
                            ParamType.bool,
                          ),
                        }.withoutNulls,
                      );

                      return;
                    } else {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        useSafeArea: true,
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
                                height: MediaQuery.sizeOf(context).height * 1.0,
                                child: RevCatPaywallWidget(
                                  navigateTo: 'program',
                                ),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));

                      return;
                    }
                  }
                },
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Container(
            height: MediaQuery.sizeOf(context).height * 1.0,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FlutterFlowDropDown<String>(
                        controller: _model.dropDownValueController ??=
                            FormFieldController<String>(
                          _model.dropDownValue ??= 'All Exercises',
                        ),
                        options: List<String>.from([
                          'All Exercises',
                          'Legs',
                          'Back',
                          'Arms',
                          'Chest',
                          'Forearms',
                          'Glutes',
                          'Hamstrings',
                          'Lower Back',
                          'Quads',
                          'Shoulders',
                          'Traps',
                          'Triceps',
                          'Biceps',
                          'Abs',
                          'Calves'
                        ]),
                        optionLabels: [
                          FFLocalizations.of(context).getText(
                            'lrfgewuu' /* All Exercises */,
                          ),
                          FFLocalizations.of(context).getText(
                            '4ukyq9iy' /* Legs */,
                          ),
                          FFLocalizations.of(context).getText(
                            't2al7jx7' /* Back */,
                          ),
                          FFLocalizations.of(context).getText(
                            'iuhonn55' /* Arms */,
                          ),
                          FFLocalizations.of(context).getText(
                            '32qi5kdz' /* Chest */,
                          ),
                          FFLocalizations.of(context).getText(
                            '3vxvvy6i' /* Forearms */,
                          ),
                          FFLocalizations.of(context).getText(
                            '4mz6lzbm' /* Glutes */,
                          ),
                          FFLocalizations.of(context).getText(
                            'b9r4gz4p' /* Hamstrings */,
                          ),
                          FFLocalizations.of(context).getText(
                            'xo0oy3qa' /* Lower Back */,
                          ),
                          FFLocalizations.of(context).getText(
                            'husp00m8' /* Quads */,
                          ),
                          FFLocalizations.of(context).getText(
                            'kf3wmhcs' /* Shoulders */,
                          ),
                          FFLocalizations.of(context).getText(
                            'erzvebqr' /* Traps */,
                          ),
                          FFLocalizations.of(context).getText(
                            'alwez0i5' /* Triceps */,
                          ),
                          FFLocalizations.of(context).getText(
                            'le2bq9v5' /* Biceps */,
                          ),
                          FFLocalizations.of(context).getText(
                            'thqv0eis' /* Abs */,
                          ),
                          FFLocalizations.of(context).getText(
                            '4gppe0hd' /* Calvs */,
                          )
                        ],
                        onChanged: (val) async {
                          setState(() => _model.dropDownValue = val);
                          if (_model.dropDownValue == 'All Exercises') {
                            setState(() {
                              _model.filteredExercises = FFAppState()
                                  .exercises
                                  .toList()
                                  .cast<dynamic>();
                            });
                          } else {
                            setState(() {
                              _model.filteredExercises = functions
                                  .filterJsonCopy(
                                      FFAppState().exercises.toList(),
                                      _model.dropDownValue!)!
                                  .toList()
                                  .cast<dynamic>();
                            });
                          }
                        },
                        width: 300.0,
                        height: 50.0,
                        searchHintTextStyle: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                              fontFamily: 'Jost',
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        hintText: FFLocalizations.of(context).getText(
                          'r7x3za7i' /* select a muscle group... */,
                        ),
                        searchHintText: FFLocalizations.of(context).getText(
                          'cj4l599l' /* Search for target muscle group */,
                        ),
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        fillColor: FlutterFlowTheme.of(context).primary,
                        elevation: 2.0,
                        borderColor: FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2.0,
                        borderRadius: 8.0,
                        margin: EdgeInsetsDirectional.fromSTEB(
                            16.0, 4.0, 16.0, 4.0),
                        hidesUnderline: true,
                        isSearchable: true,
                        isMultiSelect: false,
                      ),
                      Flexible(
                        child: Container(
                          width: 100.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final filteredExercise =
                                  _model.filteredExercises.toList();
                              return RefreshIndicator(
                                color: FlutterFlowTheme.of(context).accent2,
                                onRefresh: () async {
                                  _model.exerciseListRefresh =
                                      await queryExercisesRecordOnce();
                                  FFAppState().update(() {
                                    FFAppState().exercises = functions
                                        .convertFBExerciseToJSON(_model
                                            .exerciseListRefresh
                                            ?.toList())!
                                        .toList()
                                        .cast<dynamic>();
                                  });
                                  setState(() {
                                    _model.filteredExercises = FFAppState()
                                        .exercises
                                        .toList()
                                        .cast<dynamic>();
                                  });
                                },
                                child: GridView.builder(
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 5.0,
                                    childAspectRatio: 1.0,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: filteredExercise.length,
                                  itemBuilder:
                                      (context, filteredExerciseIndex) {
                                    final filteredExerciseItem =
                                        filteredExercise[filteredExerciseIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 5.0, 5.0, 5.0),
                                      child: Material(
                                        color: Colors.transparent,
                                        elevation: 3.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              context.pushNamed(
                                                'exercise',
                                                queryParameters: {
                                                  'exerciseId': serializeParam(
                                                    getJsonField(
                                                      filteredExerciseItem,
                                                      r'''$.id''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                  'exercise': serializeParam(
                                                    getJsonField(
                                                      filteredExerciseItem,
                                                      r'''$.name''',
                                                    ).toString(),
                                                    ParamType.String,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  kTransitionInfoKey:
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType
                                                            .rightToLeft,
                                                  ),
                                                },
                                              );
                                            },
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 500),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 500),
                                                    imageUrl:
                                                        '${FFAppState().exerciseBase}${getJsonField(
                                                      filteredExerciseItem,
                                                      r'''$.id''',
                                                    ).toString()}.png?alt=media',
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        1.0,
                                                    fit: BoxFit.cover,
                                                    errorWidget: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.png',
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      height: MediaQuery.sizeOf(
                                                                  context)
                                                              .height *
                                                          1.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 5.0, 5.0, 10.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -0.81, 0.55),
                                                        child: Material(
                                                          color: Colors
                                                              .transparent,
                                                          elevation: 3.0,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Container(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              gradient:
                                                                  LinearGradient(
                                                                colors: [
                                                                  Color(
                                                                      0x16000000),
                                                                  Color(
                                                                      0x7E000000)
                                                                ],
                                                                stops: [
                                                                  0.1,
                                                                  0.3
                                                                ],
                                                                begin:
                                                                    AlignmentDirectional(
                                                                        1.0,
                                                                        0.0),
                                                                end:
                                                                    AlignmentDirectional(
                                                                        -1.0,
                                                                        0),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          5.0,
                                                                          5.0,
                                                                          5.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  filteredExerciseItem,
                                                                  r'''$.name''',
                                                                ).toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 2,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Jost',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      fontSize:
                                                                          14.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Builder(
                                                        builder: (context) {
                                                          final tag =
                                                              getJsonField(
                                                            filteredExerciseItem,
                                                            r'''$.tags''',
                                                          ).toList();
                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children:
                                                                  List.generate(
                                                                      tag.length,
                                                                      (tagIndex) {
                                                                final tagItem =
                                                                    tag[tagIndex];
                                                                return Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -0.80,
                                                                          0.88),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        setState(
                                                                            () {
                                                                          _model
                                                                              .dropDownValueController
                                                                              ?.value = functions.capitalize(tagItem.toString());
                                                                        });
                                                                      },
                                                                      child:
                                                                          Material(
                                                                        color: Colors
                                                                            .transparent,
                                                                        elevation:
                                                                            10.0,
                                                                        shape:
                                                                            RoundedRectangleBorder(
                                                                          borderRadius:
                                                                              BorderRadius.circular(50.0),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              70.0,
                                                                          height:
                                                                              25.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).accent2,
                                                                            borderRadius:
                                                                                BorderRadius.circular(50.0),
                                                                          ),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.00, 0.00),
                                                                            child:
                                                                                Text(
                                                                              tagItem.toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Jost',
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            ),
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
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (_model.showDialoge)
                  Align(
                    alignment: AlignmentDirectional(-0.00, -0.18),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(0.0),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 2.0,
                          sigmaY: 2.0,
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(0.00, 0.00),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 20.0, 20.0, 20.0),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                elevation: 4.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 20.0, 20.0, 20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Flexible(
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  -1.00, 0.00),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'rjfasw7r' /* Oops! */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleLarge,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                1.00, -1.00),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                setState(() {
                                                  _model.showDialoge = false;
                                                });
                                              },
                                              child: Icon(
                                                Icons.close_sharp,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .accent2,
                                                size: 36.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'vf1zei5h' /* It looks like you dont have ac... */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 24.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            setState(() {
                                              _model.showDialoge = false;
                                            });
                                            await launchURL(
                                                'https://iamvariant.com');
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '90oxmmck' /* Get Access! */,
                                          ),
                                          options: FFButtonOptions(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 40.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .accent2,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Jost',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
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
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
