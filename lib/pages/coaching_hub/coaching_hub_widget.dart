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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'coaching_hub_model.dart';
export 'coaching_hub_model.dart';

class CoachingHubWidget extends StatefulWidget {
  const CoachingHubWidget({super.key});

  @override
  State<CoachingHubWidget> createState() => _CoachingHubWidgetState();
}

class _CoachingHubWidgetState extends State<CoachingHubWidget> {
  late CoachingHubModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoachingHubModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.users = await queryUsersRecordOnce(
        queryBuilder: (usersRecord) => usersRecord
            .where(
              'isSubbed',
              isEqualTo: true,
            )
            .where(
              'display_name',
              isNotEqualTo: null,
            ),
      );
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

    return StreamBuilder<List<ProgramsRecord>>(
      stream: queryProgramsRecord(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<ProgramsRecord> coachingHubProgramsRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: true,
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
                FFLocalizations.of(context).getText(
                  'f1t9l6hs' /* Coaching Hub */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Jost',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                    ),
              ),
              actions: [
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
                                height:
                                    MediaQuery.sizeOf(context).height * 0.75,
                                child: AddProgramWidget(),
                              ),
                            ),
                          );
                        },
                      ).then((value) => safeSetState(() {}));
                    },
                    child: Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).accent2,
                      size: 40.0,
                    ),
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final program = coachingHubProgramsRecordList.toList();
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: program.length,
                          itemBuilder: (context, programIndex) {
                            final programItem = program[programIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 5.0, 0.0, 5.0),
                              child: Material(
                                color: Colors.transparent,
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  height: 250.0,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          setState(() {
                                            FFAppState().editProgramDays =
                                                functions
                                                    .detDaysFromFirstWeek(
                                                        programItem.weeks
                                                            .toList())
                                                    .toList()
                                                    .cast<DaysStruct>();
                                            FFAppState()
                                                .editProgramSelectedWeek = 1;
                                            FFAppState()
                                                .editProgramSelectedDayIndex = 0;
                                            FFAppState()
                                                .editProgramSelectedWeekIndex = 0;
                                          });

                                          context.pushNamed(
                                            'editProgram',
                                            queryParameters: {
                                              'program': serializeParam(
                                                programItem,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'program': programItem,
                                            },
                                          );
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.25,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              setState(() {
                                                FFAppState().editProgramDays =
                                                    functions
                                                        .detDaysFromFirstWeek(
                                                            programItem.weeks
                                                                .toList())
                                                        .toList()
                                                        .cast<DaysStruct>();
                                                FFAppState()
                                                    .editProgramSelectedWeek = 1;
                                                FFAppState()
                                                    .editProgramSelectedDayIndex = 0;
                                                FFAppState()
                                                    .editProgramSelectedWeekIndex = 0;
                                              });

                                              context.pushNamed(
                                                'editProgram',
                                                queryParameters: {
                                                  'program': serializeParam(
                                                    programItem,
                                                    ParamType.Document,
                                                  ),
                                                }.withoutNulls,
                                                extra: <String, dynamic>{
                                                  'program': programItem,
                                                },
                                              );
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl:
                                                    programItem.thumbnailURL,
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                fit: BoxFit.cover,
                                                errorWidget: (context, error,
                                                        stackTrace) =>
                                                    Image.asset(
                                                  'assets/images/error_image.png',
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                programItem.name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily: 'Jost',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryText,
                                                        ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'vtqok2xm' /* Live */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Jost',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                    ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Theme(
                                                                  data:
                                                                      ThemeData(
                                                                    checkboxTheme:
                                                                        CheckboxThemeData(
                                                                      visualDensity:
                                                                          VisualDensity
                                                                              .compact,
                                                                      materialTapTargetSize:
                                                                          MaterialTapTargetSize
                                                                              .shrinkWrap,
                                                                      shape:
                                                                          RoundedRectangleBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(4.0),
                                                                      ),
                                                                    ),
                                                                    unselectedWidgetColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .error,
                                                                  ),
                                                                  child:
                                                                      Checkbox(
                                                                    value: _model
                                                                            .checkboxValueMap1[programItem] ??=
                                                                        programItem
                                                                            .isLive,
                                                                    onChanged:
                                                                        (newValue) async {
                                                                      setState(() =>
                                                                          _model.checkboxValueMap1[programItem] =
                                                                              newValue!);
                                                                      if (newValue!) {
                                                                        await programItem
                                                                            .reference
                                                                            .update(createProgramsRecordData(
                                                                          isLive:
                                                                              true,
                                                                        ));
                                                                      } else {
                                                                        await programItem
                                                                            .reference
                                                                            .update(createProgramsRecordData(
                                                                          isLive:
                                                                              false,
                                                                        ));
                                                                      }
                                                                    },
                                                                    activeColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .accent2,
                                                                    checkColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .info,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                                'd4sspstf' /* Daily */,
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Jost',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                                  ),
                                                            ),
                                                            Theme(
                                                              data: ThemeData(
                                                                checkboxTheme:
                                                                    CheckboxThemeData(
                                                                  visualDensity:
                                                                      VisualDensity
                                                                          .compact,
                                                                  materialTapTargetSize:
                                                                      MaterialTapTargetSize
                                                                          .shrinkWrap,
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            4.0),
                                                                  ),
                                                                ),
                                                                unselectedWidgetColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                              ),
                                                              child: Checkbox(
                                                                value: _model
                                                                            .checkboxValueMap2[
                                                                        programItem] ??=
                                                                    programItem
                                                                        .isDaily,
                                                                onChanged: true
                                                                    ? null
                                                                    : (newValue) async {
                                                                        setState(() =>
                                                                            _model.checkboxValueMap2[programItem] =
                                                                                newValue!);
                                                                      },
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent2,
                                                                checkColor: true
                                                                    ? programItem
                                                                            .isDaily
                                                                        ? FlutterFlowTheme.of(context)
                                                                            .accent2
                                                                        : FlutterFlowTheme.of(context)
                                                                            .error
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .info,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'stn6vrbh' /* For Clients */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Jost',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                    ),
                                                              ),
                                                              Theme(
                                                                data: ThemeData(
                                                                  checkboxTheme:
                                                                      CheckboxThemeData(
                                                                    visualDensity:
                                                                        VisualDensity
                                                                            .compact,
                                                                    materialTapTargetSize:
                                                                        MaterialTapTargetSize
                                                                            .shrinkWrap,
                                                                    shape:
                                                                        RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4.0),
                                                                    ),
                                                                  ),
                                                                  unselectedWidgetColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                ),
                                                                child: Checkbox(
                                                                  value: _model
                                                                              .checkboxValueMap3[
                                                                          programItem] ??=
                                                                      programItem
                                                                          .isPersonalTraining,
                                                                  onChanged:
                                                                      (newValue) async {
                                                                    setState(() =>
                                                                        _model.checkboxValueMap3[programItem] =
                                                                            newValue!);
                                                                    if (newValue!) {
                                                                      await programItem
                                                                          .reference
                                                                          .update(
                                                                              createProgramsRecordData(
                                                                        isPersonalTraining:
                                                                            true,
                                                                      ));
                                                                    } else {
                                                                      await programItem
                                                                          .reference
                                                                          .update(
                                                                              createProgramsRecordData(
                                                                        isPersonalTraining:
                                                                            false,
                                                                      ));
                                                                    }
                                                                  },
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                  checkColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              wrapWithModel(
                                                model: _model
                                                    .subbedUserListModels
                                                    .getModel(
                                                  programItem.id,
                                                  programIndex,
                                                ),
                                                updateCallback: () =>
                                                    setState(() {}),
                                                child: SubbedUserListWidget(
                                                  key: Key(
                                                    'Key8e6_${programItem.id}',
                                                  ),
                                                  displayNames: _model.users!
                                                      .map((e) => e.displayName)
                                                      .toList(),
                                                  userIds: _model.users!
                                                      .map((e) => e.uid)
                                                      .toList(),
                                                  programUserIds:
                                                      programItem.clientIds,
                                                  programId:
                                                      programItem.reference,
                                                ),
                                              ),
                                              Builder(
                                                builder: (context) {
                                                  final clients = programItem
                                                      .clientIds
                                                      .toList();
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: List.generate(
                                                        clients.length,
                                                        (clientsIndex) {
                                                      final clientsItem =
                                                          clients[clientsIndex];
                                                      return Text(
                                                        clientsItem,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                      );
                                                    }),
                                                  );
                                                },
                                              ),
                                            ].divide(SizedBox(height: 5.0)),
                                          ),
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
