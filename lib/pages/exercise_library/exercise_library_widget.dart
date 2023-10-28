import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
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
      _model.exerciseList = await queryExercisesRecordOnce(
        limit: 50,
      );
      FFAppState().update(() {
        FFAppState().exercises = functions
            .convertFBExerciseToJSON(_model.exerciseList?.toList())!
            .toList()
            .cast<dynamic>();
      });
      setState(() {
        _model.filteredExercises =
            FFAppState().exercises.toList().cast<dynamic>();
      });
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
          title: Align(
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
          actions: [],
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
                          _model.dropDownValue ??=
                              FFLocalizations.of(context).getText(
                            'ejd07cee' /* All Exercises */,
                          ),
                        ),
                        options: [
                          FFLocalizations.of(context).getText(
                            'u9wjmho0' /* All Exercises */,
                          ),
                          FFLocalizations.of(context).getText(
                            '44ij5tx8' /* Abs */,
                          ),
                          FFLocalizations.of(context).getText(
                            '3f4afs6a' /* Back */,
                          ),
                          FFLocalizations.of(context).getText(
                            '58goy4zg' /* Calves */,
                          ),
                          FFLocalizations.of(context).getText(
                            'zpg5stbe' /* Chest */,
                          ),
                          FFLocalizations.of(context).getText(
                            'ggw0bng7' /* Forearms */,
                          ),
                          FFLocalizations.of(context).getText(
                            '145pd5mr' /* Glutes */,
                          ),
                          FFLocalizations.of(context).getText(
                            'lv7xy9kv' /* Hamstrings */,
                          ),
                          FFLocalizations.of(context).getText(
                            '8bwv5aab' /* Lower Back */,
                          ),
                          FFLocalizations.of(context).getText(
                            'byi6yjzv' /* Quads */,
                          ),
                          FFLocalizations.of(context).getText(
                            '4w2g3ffe' /* Shoulders */,
                          ),
                          FFLocalizations.of(context).getText(
                            'q8yqmugf' /* Traps */,
                          ),
                          FFLocalizations.of(context).getText(
                            'udzwh0x4' /* Triceps */,
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
                                  .filterJson('tag', _model.dropDownValue,
                                      FFAppState().exercises.toList())!
                                  .toList()
                                  .cast<dynamic>();
                            });
                          }
                        },
                        width: 300.0,
                        height: 50.0,
                        searchHintTextStyle:
                            FlutterFlowTheme.of(context).labelMedium,
                        textStyle: FlutterFlowTheme.of(context).bodyMedium,
                        hintText: FFLocalizations.of(context).getText(
                          '39l0b3ne' /* Please select... */,
                        ),
                        searchHintText: FFLocalizations.of(context).getText(
                          'qr8kspru' /* Search for target muscle group */,
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
                        isSearchable: true,
                        isMultiSelect: false,
                      ),
                      Flexible(
                        child: Container(
                          width: 100.0,
                          height: MediaQuery.sizeOf(context).height * 0.7,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final filteredExercise =
                                  _model.filteredExercises.toList();
                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5.0,
                                  mainAxisSpacing: 5.0,
                                  childAspectRatio: 1.0,
                                ),
                                scrollDirection: Axis.vertical,
                                itemCount: filteredExercise.length,
                                itemBuilder: (context, filteredExerciseIndex) {
                                  final filteredExerciseItem =
                                      filteredExercise[filteredExerciseIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.0, 5.0, 5.0, 5.0),
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
                                        );
                                      },
                                      child: Stack(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              '${FFAppState().exerciseBase}${getJsonField(
                                                filteredExerciseItem,
                                                r'''$.id''',
                                              ).toString()}.png?alt=media',
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -0.81, 0.55),
                                            child: Text(
                                              getJsonField(
                                                filteredExerciseItem,
                                                r'''$.name''',
                                              ).toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium,
                                            ),
                                          ),
                                          Builder(
                                            builder: (context) {
                                              final tag = getJsonField(
                                                filteredExerciseItem,
                                                r'''$.tags''',
                                              ).toList();
                                              return SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      tag.length, (tagIndex) {
                                                    final tagItem =
                                                        tag[tagIndex];
                                                    return Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -0.80, 0.88),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 70.0,
                                                          height: 25.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                          ),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.00, 0.00),
                                                            child: Text(
                                                              tagItem
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium,
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
                if (!FFAppState().isTimerRunning)
                  Align(
                    alignment: AlignmentDirectional(-0.03, 0.99),
                    child: FFButtonWidget(
                      onPressed: FFAppState().isTimerRunning
                          ? null
                          : () async {
                              context.pushNamed('timer');
                            },
                      text: FFLocalizations.of(context).getText(
                        'd2nwpzvd' /* Timer */,
                      ),
                      options: FFButtonOptions(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).accent2,
                        textStyle:
                            FlutterFlowTheme.of(context).titleLarge.override(
                                  fontFamily: 'Jost',
                                  color: Colors.white,
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
          ),
        ),
      ),
    );
  }
}
