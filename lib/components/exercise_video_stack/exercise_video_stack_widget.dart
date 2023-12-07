import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'exercise_video_stack_model.dart';
export 'exercise_video_stack_model.dart';

class ExerciseVideoStackWidget extends StatefulWidget {
  const ExerciseVideoStackWidget({
    Key? key,
    this.parameter1,
    required this.exerciseId,
  }) : super(key: key);

  final String? parameter1;
  final String? exerciseId;

  @override
  _ExerciseVideoStackWidgetState createState() =>
      _ExerciseVideoStackWidgetState();
}

class _ExerciseVideoStackWidgetState extends State<ExerciseVideoStackWidget> {
  late ExerciseVideoStackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExerciseVideoStackModel());
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
      alignment: AlignmentDirectional(0.00, 1.00),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 1.0,
        child: Stack(
          alignment: AlignmentDirectional(0.0, 0.0),
          children: [
            Align(
              alignment: AlignmentDirectional(0.00, 0.00),
              child: Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: StreamBuilder<List<ExercisesRecord>>(
                    stream: FFAppState().exercise(
                      uniqueQueryKey: widget.exerciseId,
                      requestFn: () => queryExercisesRecord(
                        queryBuilder: (exercisesRecord) =>
                            exercisesRecord.where(
                          'id',
                          isEqualTo: widget.exerciseId,
                        ),
                        singleRecord: true,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitRipple(
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<ExercisesRecord> pageViewExercisesRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final pageViewExercisesRecord =
                          pageViewExercisesRecordList.isNotEmpty
                              ? pageViewExercisesRecordList.first
                              : null;
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: PageView(
                          controller: _model.pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.vertical,
                          children: [
                            Container(
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.sizeOf(context).height * 1.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: FlutterFlowVideoPlayer(
                                      path:
                                          '${FFAppState().exerciseBase}${pageViewExercisesRecord?.id}.MOV?alt=media',
                                      videoType: VideoType.network,
                                      width: double.infinity,
                                      autoPlay: true,
                                      looping: true,
                                      showControls: false,
                                      allowFullScreen: true,
                                      allowPlaybackSpeedMenu: false,
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  1.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              1.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x00EE8B60),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(0.00, 0.00),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            child: BackdropFilter(
                                              filter: ImageFilter.blur(
                                                sigmaX: 12.0,
                                                sigmaY: 12.0,
                                              ),
                                              child: Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                decoration: BoxDecoration(),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 20.0,
                                                          20.0, 20.0),
                                                  child: Stack(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    50.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.00,
                                                                      -1.00),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        0.0,
                                                                        20.0),
                                                                child: Text(
                                                                  pageViewExercisesRecord!
                                                                      .name,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Jost',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            30.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                            if (FFLocalizations.of(
                                                                        context)
                                                                    .languageCode !=
                                                                'th')
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final enDetails =
                                                                          pageViewExercisesRecord?.breakdown?.en?.toList() ??
                                                                              [];
                                                                      return ListView
                                                                          .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            enDetails.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                enDetailsIndex) {
                                                                          final enDetailsItem =
                                                                              enDetails[enDetailsIndex];
                                                                          return Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.00, 0.00),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                              child: Text(
                                                                                '${functions.indexPlusOne(enDetailsIndex).toString()}. ${enDetailsItem}',
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Jost',
                                                                                      color: Colors.white,
                                                                                      fontWeight: FontWeight.w600,
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
                                                            if (FFLocalizations.of(
                                                                        context)
                                                                    .languageCode ==
                                                                'th')
                                                              Flexible(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final thDetails =
                                                                          pageViewExercisesRecord?.breakdown?.th?.toList() ??
                                                                              [];
                                                                      return ListView
                                                                          .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            thDetails.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                thDetailsIndex) {
                                                                          final thDetailsItem =
                                                                              thDetails[thDetailsIndex];
                                                                          return Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.00, 0.00),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                              child: Text(
                                                                                '${functions.indexPlusOne(thDetailsIndex).toString()}. ${thDetailsItem}',
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Jost',
                                                                                      color: Colors.white,
                                                                                      fontWeight: FontWeight.w600,
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
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(0.00, 0.00),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 24.0, 12.0, 50.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -0.85, -0.93),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 0.0, 0.0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .accent2,
                                                    borderRadius: 20.0,
                                                    borderWidth: 2.0,
                                                    buttonSize: 50.0,
                                                    fillColor:
                                                        Color(0x7E000000),
                                                    icon: Icon(
                                                      Icons
                                                          .chevron_left_outlined,
                                                      color: Colors.white,
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () async {
                                                      context.safePop();
                                                    },
                                                  ),
                                                ),
                                              ),
                                              if (!functions.isFavorite(
                                                  pageViewExercisesRecord!.id,
                                                  FFAppState()
                                                      .favorites
                                                      .toList()))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 12.0),
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
                                                      setState(() {
                                                        FFAppState()
                                                            .addToFavorites(
                                                                FavoritesStruct(
                                                          name:
                                                              pageViewExercisesRecord
                                                                  ?.name,
                                                          id: pageViewExercisesRecord
                                                              ?.id,
                                                        ));
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.favorite_border,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      size: 50.0,
                                                    ),
                                                  ),
                                                ),
                                              if (functions.isFavorite(
                                                  pageViewExercisesRecord!.id,
                                                  FFAppState()
                                                      .favorites
                                                      .toList()))
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 12.0),
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
                                                      setState(() {
                                                        FFAppState()
                                                            .removeFromFavorites(
                                                                FavoritesStruct(
                                                          name:
                                                              pageViewExercisesRecord
                                                                  ?.name,
                                                          id: pageViewExercisesRecord
                                                              ?.id,
                                                        ));
                                                      });
                                                    },
                                                    child: Icon(
                                                      Icons.favorite_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .accent2,
                                                      size: 50.0,
                                                    ),
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
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
