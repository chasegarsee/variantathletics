import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/no_comments_to_display/no_comments_to_display_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'select_program_model.dart';
export 'select_program_model.dart';

class SelectProgramWidget extends StatefulWidget {
  const SelectProgramWidget({Key? key}) : super(key: key);

  @override
  _SelectProgramWidgetState createState() => _SelectProgramWidgetState();
}

class _SelectProgramWidgetState extends State<SelectProgramWidget> {
  late SelectProgramModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SelectProgramModel());
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
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close_sharp,
                              color: FlutterFlowTheme.of(context).accent2,
                              size: 36.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: StreamBuilder<List<ProgramsRecord>>(
                              stream: FFAppState().programsList(
                                requestFn: () => queryProgramsRecord(),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: SpinKitRipple(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 50.0,
                                      ),
                                    ),
                                  );
                                }
                                List<ProgramsRecord>
                                    listViewProgramsRecordList = snapshot.data!;
                                if (listViewProgramsRecordList.isEmpty) {
                                  return NoCommentsToDisplayWidget();
                                }
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: listViewProgramsRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(width: 12.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewProgramsRecord =
                                        listViewProgramsRecordList[
                                            listViewIndex];
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Container(
                                            height: 100.0,
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
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
                                                          if (listViewProgramsRecord
                                                                  .id ==
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.currentProgramId,
                                                                  '')) {
                                                            Navigator.pop(
                                                                context);
                                                            return;
                                                          } else {
                                                            if (listViewProgramsRecord
                                                                .isLive) {
                                                              await currentUserReference!
                                                                  .update(
                                                                      createUsersRecordData(
                                                                currentProgram:
                                                                    listViewProgramsRecord
                                                                        .id,
                                                              ));
                                                              _model.updatePage(
                                                                  () {
                                                                FFAppState()
                                                                        .selectedWeek =
                                                                    listViewProgramsRecord
                                                                        .weeks
                                                                        .first
                                                                        .weekNumber;
                                                                FFAppState().days = functions
                                                                    .setDays(listViewProgramsRecord
                                                                        .weeks
                                                                        .toList())
                                                                    .toList()
                                                                    .cast<
                                                                        DaysStruct>();
                                                                FFAppState().programExercises = functions
                                                                    .setExercises(
                                                                        listViewProgramsRecord
                                                                            .weeks
                                                                            .first)
                                                                    .toList()
                                                                    .cast<
                                                                        ProgramExercisesStruct>();
                                                                FFAppState()
                                                                        .selectedDayName =
                                                                    listViewProgramsRecord
                                                                        .weeks
                                                                        .first
                                                                        .days
                                                                        .first
                                                                        .name;
                                                                FFAppState()
                                                                        .selectedDay =
                                                                    listViewProgramsRecord
                                                                        .weeks
                                                                        .first
                                                                        .days
                                                                        .first
                                                                        .day;
                                                                FFAppState()
                                                                        .selectedDayId =
                                                                    listViewProgramsRecord
                                                                        .weeks
                                                                        .first
                                                                        .days
                                                                        .first
                                                                        .id;
                                                                FFAppState()
                                                                        .weeks =
                                                                    listViewProgramsRecord
                                                                        .weeks
                                                                        .toList()
                                                                        .cast<
                                                                            WeeksStruct>();
                                                                FFAppState()
                                                                        .currentProgram =
                                                                    listViewProgramsRecord
                                                                        .name;
                                                                FFAppState()
                                                                        .currentProgramId =
                                                                    listViewProgramsRecord
                                                                        .reference
                                                                        .id;
                                                                FFAppState()
                                                                    .completedDays = [];
                                                                FFAppState()
                                                                    .completedWeeks = [];
                                                                FFAppState()
                                                                        .showAllWeeks =
                                                                    false;
                                                                FFAppState()
                                                                        .isDaily =
                                                                    listViewProgramsRecord
                                                                        .isDaily;
                                                              });
                                                              if (listViewProgramsRecord
                                                                  .isDaily) {
                                                                setState(() {
                                                                  FFAppState()
                                                                          .showAllDays =
                                                                      true;
                                                                  FFAppState()
                                                                          .isDailySelectedDay =
                                                                      dateTimeFromSecondsSinceEpoch(
                                                                          getCurrentTimestamp
                                                                              .secondsSinceEpoch);
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  FFAppState()
                                                                          .showAllDays =
                                                                      false;
                                                                });
                                                              }

                                                              Navigator.pop(
                                                                  context);
                                                              return;
                                                            } else {
                                                              return;
                                                            }
                                                          }
                                                        },
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: 100.0,
                                                                height: 100.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  fadeInDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  fadeOutDuration:
                                                                      Duration(
                                                                          milliseconds:
                                                                              500),
                                                                  imageUrl:
                                                                      listViewProgramsRecord
                                                                          .thumbnailURL,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorWidget: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.png',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                if (listViewProgramsRecord
                                                        .isLive ==
                                                    false)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -0.06),
                                                    child: ClipOval(
                                                      child: BackdropFilter(
                                                        filter:
                                                            ImageFilter.blur(
                                                          sigmaX: 3.0,
                                                          sigmaY: 3.0,
                                                        ),
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          3.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'xyz0e2ce' /* COMING SOON */,
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                if (listViewProgramsRecord.id ==
                                                    valueOrDefault(
                                                        currentUserDocument
                                                            ?.currentProgram,
                                                        ''))
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, -1.0),
                                                    child: AuthUserStreamWidget(
                                                      builder: (context) =>
                                                          Container(
                                                        width: 30.0,
                                                        height: 30.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent1,
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .checkDouble,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Text(
                                          listViewProgramsRecord.name,
                                          maxLines: 2,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Jost',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                        ),
                                      ]
                                          .divide(SizedBox(height: 1.0))
                                          .around(SizedBox(height: 1.0)),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
