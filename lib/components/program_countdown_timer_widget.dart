import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'program_countdown_timer_model.dart';
export 'program_countdown_timer_model.dart';

class ProgramCountdownTimerWidget extends StatefulWidget {
  const ProgramCountdownTimerWidget({
    Key? key,
    required this.currentTime,
    required this.liveDate,
  }) : super(key: key);

  final DateTime? currentTime;
  final DateTime? liveDate;

  @override
  _ProgramCountdownTimerWidgetState createState() =>
      _ProgramCountdownTimerWidgetState();
}

class _ProgramCountdownTimerWidgetState
    extends State<ProgramCountdownTimerWidget> {
  late ProgramCountdownTimerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgramCountdownTimerModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowTimer(
      initialTime: _model.timerMilliseconds,
      getDisplayTime: (value) =>
          StopWatchTimer.getDisplayTime(value, milliSecond: false),
      controller: _model.timerController,
      updateStateInterval: Duration(milliseconds: 1000),
      onChanged: (value, displayTime, shouldUpdate) {
        _model.timerMilliseconds = value;
        _model.timerValue = displayTime;
        if (shouldUpdate) setState(() {});
      },
      textAlign: TextAlign.start,
      style: FlutterFlowTheme.of(context).headlineSmall,
    );
  }
}
