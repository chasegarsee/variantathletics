import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                                        '1mqrj2l6' /* Timer Type */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                    ),
                                  ),
                                ),
                                FlutterFlowDropDown<String>(
                                  controller:
                                      _model.timerTypeValueController ??=
                                          FormFieldController<String>(
                                    _model.timerTypeValue ??=
                                        FFAppState().intervalTimer.timerType,
                                  ),
                                  options: List<String>.from(
                                      ['Interval', 'Count Up', 'Count Down']),
                                  optionLabels: [
                                    FFLocalizations.of(context).getText(
                                      'sppkxchz' /* Interval */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      'uaa2odeu' /* Count Up */,
                                    ),
                                    FFLocalizations.of(context).getText(
                                      '0qbd2d5w' /* Count Down */,
                                    )
                                  ],
                                  onChanged: (val) async {
                                    setState(() => _model.timerTypeValue = val);
                                    _model.updatePage(() {
                                      FFAppState().updateIntervalTimerStruct(
                                        (e) => e
                                          ..isCountDown =
                                              _model.timerTypeValue !=
                                                      'Count Up'
                                                  ? true
                                                  : false
                                          ..timerType = _model.timerTypeValue,
                                      );
                                    });
                                  },
                                  height: 50.0,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                  hintText: FFLocalizations.of(context).getText(
                                    'kjeonm09' /* Timer Type */,
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
                          if (FFAppState().intervalTimer.isCountDown)
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
                                    controller: _model
                                            .restingIntervalValueController ??=
                                        FormFieldController<int>(
                                      _model.restingIntervalValue ??=
                                          FFAppState()
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
                                    hintText:
                                        FFLocalizations.of(context).getText(
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
                          if (FFAppState().intervalTimer.isCountDown)
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
                                          'hq97oi3z' /* Working Interval */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                                  FlutterFlowDropDown<int>(
                                    controller: _model
                                            .workingIntervalValueController ??=
                                        FormFieldController<int>(
                                      _model.workingIntervalValue ??=
                                          FFAppState()
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
                                        'y43ciydt' /* 0:10 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '806ks1at' /* 0:15 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'rqyoz3zq' /* 0:20 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'ky7btma1' /* 0:25 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'xgsv7iup' /* 0:30 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'zli4dr16' /* 0:35 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '9ag5pap8' /* 0:40 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'tjfrmcx6' /* 0:45 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'h3aqm5lz' /* 0:50 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        'l85jm4cr' /* 0:55 */,
                                      ),
                                      FFLocalizations.of(context).getText(
                                        '8y4h9ng4' /* 1:00 */,
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
                                    hintText:
                                        FFLocalizations.of(context).getText(
                                      'dmxfx4p6' /* Working Time */,
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
                          if (!FFAppState().intervalTimer.isCountDown)
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              '39ncgprk' /* Minutes */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 160.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: FlutterFlowCountController(
                                          decrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.minus,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .accent2
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            size: 20.0,
                                          ),
                                          incrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .accent2
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            size: 20.0,
                                          ),
                                          countBuilder: (count) => Text(
                                            count.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                          count: _model.minutesCountValue ??= 0,
                                          updateCount: (count) async {
                                            setState(() => _model
                                                .minutesCountValue = count);
                                            _model.updatePage(() {
                                              FFAppState()
                                                  .updateIntervalTimerStruct(
                                                (e) => e
                                                  ..workingInterval = functions
                                                      .minutesSecondsToTimeVal(
                                                          _model
                                                              .minutesCountValue!,
                                                          _model
                                                              .secondsCountValue!)
                                                  ..currentInterval = functions
                                                      .minutesSecondsToTimeVal(
                                                          _model
                                                              .minutesCountValue!,
                                                          _model
                                                              .secondsCountValue!),
                                              );
                                            });
                                          },
                                          stepSize: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'fzmc01y9' /* Seconds */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 160.0,
                                        height: 50.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                        ),
                                        child: FlutterFlowCountController(
                                          decrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.minus,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .accent2
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            size: 20.0,
                                          ),
                                          incrementIconBuilder: (enabled) =>
                                              FaIcon(
                                            FontAwesomeIcons.plus,
                                            color: enabled
                                                ? FlutterFlowTheme.of(context)
                                                    .accent2
                                                : FlutterFlowTheme.of(context)
                                                    .alternate,
                                            size: 20.0,
                                          ),
                                          countBuilder: (count) => Text(
                                            count.toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                          count: _model.secondsCountValue ??= 0,
                                          updateCount: (count) async {
                                            setState(() => _model
                                                .secondsCountValue = count);
                                            _model.updatePage(() {
                                              FFAppState()
                                                  .updateIntervalTimerStruct(
                                                (e) => e
                                                  ..workingInterval = functions
                                                      .minutesSecondsToTimeVal(
                                                          _model
                                                              .minutesCountValue!,
                                                          _model
                                                              .secondsCountValue!)
                                                  ..currentInterval = functions
                                                      .minutesSecondsToTimeVal(
                                                          _model
                                                              .minutesCountValue!,
                                                          _model
                                                              .secondsCountValue!),
                                              );
                                            });
                                          },
                                          stepSize: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
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
