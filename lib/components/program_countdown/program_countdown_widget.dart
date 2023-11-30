import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'program_countdown_model.dart';
export 'program_countdown_model.dart';

class ProgramCountdownWidget extends StatefulWidget {
  const ProgramCountdownWidget({
    Key? key,
    required this.currentTime,
    required this.liveDate,
  }) : super(key: key);

  final DateTime? currentTime;
  final DateTime? liveDate;

  @override
  _ProgramCountdownWidgetState createState() => _ProgramCountdownWidgetState();
}

class _ProgramCountdownWidgetState extends State<ProgramCountdownWidget> {
  late ProgramCountdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProgramCountdownModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.countdown = await actions.programCountdownTimer(
        widget.currentTime!,
        widget.liveDate!,
      );
    });
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Text(
      _model.countdown!,
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Jost',
            color: FlutterFlowTheme.of(context).primaryText,
          ),
    );
  }
}
