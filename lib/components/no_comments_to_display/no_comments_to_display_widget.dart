import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_comments_to_display_model.dart';
export 'no_comments_to_display_model.dart';

class NoCommentsToDisplayWidget extends StatefulWidget {
  const NoCommentsToDisplayWidget({Key? key}) : super(key: key);

  @override
  _NoCommentsToDisplayWidgetState createState() =>
      _NoCommentsToDisplayWidgetState();
}

class _NoCommentsToDisplayWidgetState extends State<NoCommentsToDisplayWidget> {
  late NoCommentsToDisplayModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoCommentsToDisplayModel());
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
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Text(
        FFLocalizations.of(context).getText(
          '6qrsj6aw' /* No comments to display */,
        ),
        style: FlutterFlowTheme.of(context).bodyMedium.override(
              fontFamily: 'Jost',
              color: FlutterFlowTheme.of(context).primaryText,
            ),
      ),
    );
  }
}
