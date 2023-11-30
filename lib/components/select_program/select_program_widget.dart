import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/no_comments_to_display/no_comments_to_display_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(1.00, -1.00),
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
                      child: StreamBuilder<List<ProgramsRecord>>(
                        stream: FFAppState().programsList(
                          requestFn: () => queryProgramsRecord(
                            queryBuilder: (programsRecord) =>
                                programsRecord.where(
                              'isLive',
                              isEqualTo: true,
                            ),
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
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<ProgramsRecord> listViewProgramsRecordList =
                              snapshot.data!;
                          if (listViewProgramsRecordList.isEmpty) {
                            return NoCommentsToDisplayWidget();
                          }
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: listViewProgramsRecordList.length,
                            separatorBuilder: (_, __) => SizedBox(width: 12.0),
                            itemBuilder: (context, listViewIndex) {
                              final listViewProgramsRecord =
                                  listViewProgramsRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 12.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      currentProgram: listViewProgramsRecord.id,
                                    ));
                                    setState(() {
                                      FFAppState().selectedWeek =
                                          listViewProgramsRecord
                                              .weeks.first.weekNumber;
                                      FFAppState().days = functions
                                          .setDays(listViewProgramsRecord.weeks
                                              .toList())
                                          .toList()
                                          .cast<DaysStruct>();
                                      FFAppState().programExercises = functions
                                          .setExercises(WeeksStruct())
                                          .toList()
                                          .cast<ProgramExercisesStruct>();
                                      FFAppState().selectedDayName =
                                          listViewProgramsRecord
                                              .weeks.first.days.first.name;
                                      FFAppState().selectedDay =
                                          listViewProgramsRecord
                                              .weeks.first.days.first.day;
                                      FFAppState().selectedDayId =
                                          listViewProgramsRecord
                                              .weeks.first.days.first.id;
                                      FFAppState().weeks =
                                          listViewProgramsRecord.weeks
                                              .toList()
                                              .cast<WeeksStruct>();
                                      FFAppState().currentProgram =
                                          listViewProgramsRecord.name;
                                      FFAppState().currentProgramId =
                                          listViewProgramsRecord.reference.id;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 12.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 100.0,
                                            height: 100.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl:
                                                  'https://firebasestorage.googleapis.com/v0/b/variant-3baaf.appspot.com/o/programs%2F${listViewProgramsRecord.id}.png?alt=media',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Text(
                                            listViewProgramsRecord.name,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
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
          ],
        ),
      ),
    );
  }
}
