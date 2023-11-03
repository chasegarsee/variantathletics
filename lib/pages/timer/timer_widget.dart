import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'timer_model.dart';
export 'timer_model.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late TimerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimerModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.currentInterval = _model.workingInterval;
      });
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
        backgroundColor: Color(0x00FFFFFF),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                FFLocalizations.of(context).getText(
                  'jc36azpj' /* VARIANT */,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Jost',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 32.0,
                    ),
              ),
            ],
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.sizeOf(context).height * 0.8,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primary,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.00, 0.00),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FlutterFlowTimer(
                              initialTime: _model.currentInterval!,
                              getDisplayTime: (value) =>
                                  StopWatchTimer.getDisplayTime(
                                value,
                                hours: false,
                                milliSecond: false,
                              ),
                              controller: _model.timerController1,
                              updateStateInterval: Duration(milliseconds: 1000),
                              onChanged: (value, displayTime, shouldUpdate) {
                                _model.timerMilliseconds1 = value;
                                _model.timerValue1 = displayTime;
                                if (shouldUpdate) setState(() {});
                              },
                              onEnded: () async {
                                setState(() {
                                  _model.currentInterval =
                                      _model.currentInterval ==
                                              _model.workingInterval
                                          ? _model.restingInterval
                                          : _model.workingInterval;
                                });
                                if (FFAppState().playSound) {
                                  _model.soundPlayer ??= AudioPlayer();
                                  if (_model.soundPlayer!.playing) {
                                    await _model.soundPlayer!.stop();
                                  }
                                  _model.soundPlayer!.setVolume(1.0);
                                  _model.soundPlayer!
                                      .setAsset('assets/audios/ding.mp3')
                                      .then((_) => _model.soundPlayer!.play());
                                }
                                if (_model.currentInterval ==
                                    _model.restingInterval) {
                                  setState(() {
                                    _model.completedIntervals =
                                        _model.completedIntervals + 1;
                                  });
                                }
                                _model.timerController1.timer.setPresetTime(
                                  mSec: _model.currentInterval!,
                                  add: false,
                                );
                                _model.timerController1.onResetTimer();

                                _model.timerController1.onStartTimer();
                              },
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Jost',
                                    color: _model.currentInterval ==
                                            _model.workingInterval
                                        ? FlutterFlowTheme.of(context).success
                                        : FlutterFlowTheme.of(context).error,
                                    fontSize: 60.0,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'oqqtirpo' /* Elapsed */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                      FlutterFlowTimer(
                                        initialTime: _model.timerMilliseconds2,
                                        getDisplayTime: (value) =>
                                            StopWatchTimer.getDisplayTime(value,
                                                milliSecond: false),
                                        controller: _model.timerController2,
                                        updateStateInterval:
                                            Duration(milliseconds: 1000),
                                        onChanged:
                                            (value, displayTime, shouldUpdate) {
                                          _model.timerMilliseconds2 = value;
                                          _model.timerValue2 = displayTime;
                                          if (shouldUpdate) setState(() {});
                                        },
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Jost',
                                              fontSize: 20.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 10.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          FFLocalizations.of(context).getText(
                                            'cwfm3jpz' /* Sets */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Jost',
                                                fontSize: 20.0,
                                              ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: Text(
                                          _model.completedIntervals.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Jost',
                                                fontSize: 20.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment: AlignmentDirectional(
                                                -1.00, 0.00),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                              child: Text(
                                                FFLocalizations.of(context)
                                                    .getText(
                                                  'kmnfcmrh' /* Working Interval */,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium,
                                              ),
                                            ),
                                          ),
                                          FlutterFlowDropDown<int>(
                                            controller: _model
                                                    .workingIntervalValueController ??=
                                                FormFieldController<int>(
                                              _model.workingIntervalValue ??=
                                                  20000,
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
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'vnkpip5l' /* 0:10 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ogvpf1sh' /* 0:15 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'uhgjokn5' /* 0:20 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'cs9zcyre' /* 0:25 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'wnoi0abl' /* 0:30 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'bv5whw9a' /* 0:35 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '5z7ufov8' /* 0:40 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'dhg24t6h' /* 0:45 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ahpblc9b' /* 0:50 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'nkv4nzmi' /* 0:55 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '17x0elhu' /* 1:00 */,
                                              )
                                            ],
                                            onChanged: (val) async {
                                              setState(() => _model
                                                  .workingIntervalValue = val);
                                              setState(() {
                                                _model.workingInterval = _model
                                                    .workingIntervalValue!;
                                                _model.currentInterval =
                                                    _model.workingIntervalValue;
                                              });
                                              _model.timerController1.timer
                                                  .setPresetTime(
                                                mSec: _model
                                                    .workingIntervalValue!,
                                                add: false,
                                              );
                                              _model.timerController1
                                                  .onResetTimer();
                                            },
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.45,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              'jhthqy4p' /* Working Time */,
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            disabled:
                                                FFAppState().isTimerRunning,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 5.0),
                                          child: Text(
                                            FFLocalizations.of(context).getText(
                                              'kb2s1ruc' /* Resting Interval */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  10.0, 0.0, 0.0, 0.0),
                                          child: FlutterFlowDropDown<int>(
                                            controller: _model
                                                    .restingIntervalValueController ??=
                                                FormFieldController<int>(
                                              _model.restingIntervalValue ??=
                                                  40000,
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
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '1y90fhqr' /* 0:10 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'yjqd77tp' /* 0:15 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'unrhcqna' /* 0:20 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '0y81k3a1' /* 0:25 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'q3mk9tin' /* 0:30 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'dsh2ob8b' /* 0:35 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'ovlfqsj2' /* 0:40 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'alzu9twu' /* 0:45 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                'j5qbzxrm' /* 0:50 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '7w7zkzq4' /* 0:55 */,
                                              ),
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '2p6tsv1j' /* 1:00 */,
                                              )
                                            ],
                                            onChanged: (val) async {
                                              setState(() => _model
                                                  .restingIntervalValue = val);
                                              setState(() {
                                                _model.restingInterval = _model
                                                    .restingIntervalValue!;
                                              });
                                            },
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.45,
                                            height: 50.0,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium,
                                            hintText:
                                                FFLocalizations.of(context)
                                                    .getText(
                                              '8ji21fpx' /* Rest Time */,
                                            ),
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            borderWidth: 2.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    16.0, 4.0, 16.0, 4.0),
                                            hidesUnderline: true,
                                            disabled:
                                                FFAppState().isTimerRunning,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  if (!_model.isCounting)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          _model.timerController1
                                              .onStartTimer();
                                          _model.timerController2
                                              .onStartTimer();
                                          setState(() {
                                            _model.isCounting = true;
                                          });
                                          setState(() {
                                            FFAppState().isTimerRunning = true;
                                          });
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.play_arrow_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.5,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
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
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  if (_model.isCounting)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          setState(() {
                                            _model.isCounting = false;
                                          });
                                          _model.timerController1.onStopTimer();
                                          _model.timerController2.onStopTimer();
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.pause,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.5,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
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
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                  if (_model.isCounting)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.00, 0.00),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          setState(() {
                                            _model.isCounting = false;
                                          });
                                          _model.timerController1.onStopTimer();
                                          _model.timerController2.onStopTimer();
                                          setState(() {
                                            FFAppState().isTimerRunning = false;
                                          });
                                        },
                                        text: '',
                                        icon: FaIcon(
                                          FontAwesomeIcons.stop,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        options: FFButtonOptions(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.25,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  24.0, 0.0, 24.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge,
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
                            Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (FFAppState().playSound)
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 50.0,
                                        borderWidth: 1.0,
                                        buttonSize: 50.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .success,
                                        icon: FaIcon(
                                          FontAwesomeIcons.solidBell,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 25.0,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            FFAppState().playSound =
                                                !FFAppState().playSound;
                                          });
                                        },
                                      ),
                                    if (!FFAppState().playSound)
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 50.0,
                                        borderWidth: 1.0,
                                        buttonSize: 50.0,
                                        fillColor:
                                            FlutterFlowTheme.of(context).error,
                                        icon: FaIcon(
                                          FontAwesomeIcons.bellSlash,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 20.0,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            FFAppState().playSound =
                                                !FFAppState().playSound;
                                          });
                                        },
                                      ),
                                    FlutterFlowIconButton(
                                      borderColor: Colors.transparent,
                                      borderRadius: 50.0,
                                      borderWidth: 1.0,
                                      buttonSize: 50.0,
                                      fillColor:
                                          FlutterFlowTheme.of(context).error,
                                      icon: Icon(
                                        Icons.replay,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        setState(() {
                                          _model.completedIntervals = 0;
                                          _model.isCounting = false;
                                          _model.currentInterval =
                                              _model.workingInterval;
                                        });
                                        _model.timerController1.onStopTimer();
                                        _model.timerController2.onStopTimer();
                                        _model.timerController1.timer
                                            .setPresetTime(
                                          mSec: _model.workingInterval,
                                          add: false,
                                        );
                                        _model.timerController1.onResetTimer();

                                        _model.timerController2.onResetTimer();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          context.pushNamed('exerciseLibrary');
                        },
                        text: FFLocalizations.of(context).getText(
                          'g8h1ojsm' /* Exercise Library */,
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
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                          elevation: 5.0,
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
            ],
          ),
        ),
      ),
    );
  }
}
