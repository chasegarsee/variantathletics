import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/edit_exercise/edit_exercise_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'edit_workout_model.dart';
export 'edit_workout_model.dart';

class EditWorkoutWidget extends StatefulWidget {
  const EditWorkoutWidget({
    Key? key,
    required this.program,
  }) : super(key: key);

  final ProgramsRecord? program;

  @override
  _EditWorkoutWidgetState createState() => _EditWorkoutWidgetState();
}

class _EditWorkoutWidgetState extends State<EditWorkoutWidget> {
  late EditWorkoutModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditWorkoutModel());
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
            FFLocalizations.of(context).getText(
              'ayu9eej9' /* Edit Workout */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Jost',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
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
                    final exercises =
                        FFAppState().editProgramSelectedDay.exercises.toList();
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children:
                            List.generate(exercises.length, (exercisesIndex) {
                          final exercisesItem = exercises[exercisesIndex];
                          return wrapWithModel(
                            model: _model.editExerciseModels.getModel(
                              exercisesIndex.toString(),
                              exercisesIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            updateOnChange: true,
                            child: EditExerciseWidget(
                              key: Key(
                                'Keym30_${exercisesIndex.toString()}',
                              ),
                              name: valueOrDefault<String>(
                                exercisesItem.name,
                                '-',
                              ),
                              sets: valueOrDefault<String>(
                                exercisesItem.sets,
                                '-',
                              ),
                              reps: valueOrDefault<String>(
                                exercisesItem.reps,
                                '-',
                              ),
                              tempo: valueOrDefault<String>(
                                exercisesItem.tempo,
                                '-',
                              ),
                              workTime: valueOrDefault<String>(
                                exercisesItem.workTime,
                                '-',
                              ),
                              restTime: valueOrDefault<String>(
                                exercisesItem.restTime,
                                '-',
                              ),
                              index: exercisesIndex,
                            ),
                          );
                        }),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(25.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    await actions.updateProgramDay(
                      widget.program!.reference.id,
                      FFAppState().editProgramSelectedWeekIndex,
                      FFAppState().editProgramSelectedDayIndex,
                      FFAppState().editProgramSelectedDay,
                    );
                  },
                  text: FFLocalizations.of(context).getText(
                    'kmwtb6k3' /* Update */,
                  ),
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).accent2,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
    );
  }
}
