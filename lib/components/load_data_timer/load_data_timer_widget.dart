import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'load_data_timer_model.dart';
export 'load_data_timer_model.dart';

class LoadDataTimerWidget extends StatefulWidget {
  const LoadDataTimerWidget({Key? key}) : super(key: key);

  @override
  _LoadDataTimerWidgetState createState() => _LoadDataTimerWidgetState();
}

class _LoadDataTimerWidgetState extends State<LoadDataTimerWidget> {
  late LoadDataTimerModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadDataTimerModel());

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
      getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
        value,
        hours: false,
        milliSecond: false,
      ),
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
