import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'days_placeholder_model.dart';
export 'days_placeholder_model.dart';

class DaysPlaceholderWidget extends StatefulWidget {
  const DaysPlaceholderWidget({Key? key}) : super(key: key);

  @override
  _DaysPlaceholderWidgetState createState() => _DaysPlaceholderWidgetState();
}

class _DaysPlaceholderWidgetState extends State<DaysPlaceholderWidget> {
  late DaysPlaceholderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DaysPlaceholderModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
          child: Material(
            color: Colors.transparent,
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              width: 30.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0x9D545454),
                borderRadius: BorderRadius.circular(5.0),
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '48otjann' /* D-1 */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Jost',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
          child: Material(
            color: Colors.transparent,
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              width: 30.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0x9D545454),
                borderRadius: BorderRadius.circular(5.0),
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'lz75stmz' /* D-2 */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Jost',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
          child: Material(
            color: Colors.transparent,
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              width: 30.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0x9D545454),
                borderRadius: BorderRadius.circular(5.0),
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '0i3waa86' /* D-3 */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Jost',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
          child: Material(
            color: Colors.transparent,
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              width: 30.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0x9D545454),
                borderRadius: BorderRadius.circular(5.0),
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'qspbidd5' /* D-4 */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Jost',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
          child: Material(
            color: Colors.transparent,
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              width: 30.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0x9D545454),
                borderRadius: BorderRadius.circular(5.0),
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'o09oktwo' /* D-5 */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Jost',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
          child: Material(
            color: Colors.transparent,
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              width: 30.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0x9D545454),
                borderRadius: BorderRadius.circular(5.0),
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'oasq6mrb' /* D-6 */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Jost',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
          child: Material(
            color: Colors.transparent,
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Container(
              width: 30.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: Color(0x9D545454),
                borderRadius: BorderRadius.circular(5.0),
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    'vwg66sbq' /* D-7 */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Jost',
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
