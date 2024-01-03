import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'program_timer_model.dart';
export 'program_timer_model.dart';

class ProgramTimerWidget extends StatefulWidget {
  const ProgramTimerWidget({
    Key? key,
    required this.resetTimer,
  }) : super(key: key);

  final Future<dynamic> Function()? resetTimer;

  @override
  _ProgramTimerWidgetState createState() => _ProgramTimerWidgetState();
}

class _ProgramTimerWidgetState extends State<ProgramTimerWidget> {
  late ProgramTimerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgramTimerModel());
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
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        '1mqrj2l6' /* Working Interval */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                FlutterFlowDropDown<int>(
                                  controller:
                                      _model.workingIntervalValueController ??=
                                          FormFieldController<int>(
                                    _model.workingIntervalValue ??= FFAppState()
                                        .intervalTimer
                                        .workingInterval,
                                  ),
                                  options: List<int>.from([
                                    10000,
                                    15000,
                                    20000,
                                    25000,
                                    30000,
                                    35000,
                                    40000,
                                    45000,
                                    50000,
                                    55000,
                                    60000
                                  ]),
                                  optionLabels: [
                                    FFLocalizations.of(context).getText(
                                      'wbk34hsj' /* 0:10 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '4joc9uix' /* 0:15 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      't5z92v1s' /* 0:20 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'sppkxchz' /* 0:25 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'duwexnuq' /* 0:30 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'euvj8lfr' /* 0:35 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'kylgz5wa' /* 0:40 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'p911b89j' /* 0:45 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'jhk55wha' /* 0:50 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'rzzhqrhp' /* 0:55 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '86f3lgh8' /* 1:00 */,
                                    )
                                  ],
                                  onChanged: (val) async {
                                    setState(() =>
                                        _model.workingIntervalValue = val);
                                    _model.updatePage(() {
                                      FFAppState().updateIntervalTimerStruct(
                                        (e) => e
                                          ..workingInterval =
                                              _model.workingIntervalValue
                                          ..currentInterval =
                                              _model.workingIntervalValue,
                                      );
                                    });
                                  },
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: FFLocalizations.of(context).getText(
                                    'kjeonm09' /* Working Time */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 0.0, 5.0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'ggw8l1j4' /* Resting Interval */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                FlutterFlowDropDown<int>(
                                  controller:
                                      _model.restingIntervalValueController ??=
                                          FormFieldController<int>(
                                    _model.restingIntervalValue ??= FFAppState()
                                        .intervalTimer
                                        .restingInterval,
                                  ),
                                  options: List<int>.from([
                                    0000,
                                    5000,
                                    10000,
                                    15000,
                                    20000,
                                    25000,
                                    30000,
                                    35000,
                                    40000,
                                    45000,
                                    50000,
                                    55000,
                                    60000
                                  ]),
                                  optionLabels: [
                                    FFLocalizations.of(context).getText(
                                      'ikirw5iw' /* 0:00 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'ydztfvvv' /* 0:05 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '0z5zxomi' /* 0:10 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'eee0nmmt' /* 0:15 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'rths4cch' /* 0:20 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'pvsf2hcm' /* 0:25 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'hrmqtwpo' /* 0:30 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'i3o7p9y9' /* 0:35 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'zkz220z1' /* 0:40 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'g142a53s' /* 0:45 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'zjqvbv0a' /* 0:50 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'wid2nflp' /* 0:55 */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '0ih0pclq' /* 1:00 */,
                                    )
                                  ],
                                  onChanged: (val) async {
                                    setState(() =>
                                        _model.restingIntervalValue = val);
                                    _model.updatePage(() {
                                      FFAppState().updateIntervalTimerStruct(
                                        (e) => e
                                          ..restingInterval =
                                              _model.restingIntervalValue,
                                      );
                                    });
                                  },
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: FFLocalizations.of(context).getText(
                                    'e96je3pm' /* Rest Time */,
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 24.0,
                                  ),
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  elevation: 2.0,
                                  borderColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  borderWidth: 2.0,
                                  borderRadius: 8.0,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 4.0, 16.0, 4.0),
                                  hidesUnderline: true,
                                  isSearchable: false,
                                  isMultiSelect: false,
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
          ],
        ),
      ),
    );
  }
}
