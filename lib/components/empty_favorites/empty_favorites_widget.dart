import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'empty_favorites_model.dart';
export 'empty_favorites_model.dart';

class EmptyFavoritesWidget extends StatefulWidget {
  const EmptyFavoritesWidget({Key? key}) : super(key: key);

  @override
  _EmptyFavoritesWidgetState createState() => _EmptyFavoritesWidgetState();
}

class _EmptyFavoritesWidgetState extends State<EmptyFavoritesWidget> {
  late EmptyFavoritesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyFavoritesModel());
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
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.pushNamed(
                'exerciseLibrary',
                extra: <String, dynamic>{
                  kTransitionInfoKey: TransitionInfo(
                    hasTransition: true,
                    transitionType: PageTransitionType.leftToRight,
                  ),
                },
              );
            },
            child: RichText(
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: FFLocalizations.of(context).getText(
                      't8fkforg' /* Add  */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Jost',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  TextSpan(
                    text: FFLocalizations.of(context).getText(
                      '6r2zmrik' /* exercises  */,
                    ),
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).accent2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: FFLocalizations.of(context).getText(
                      'bw1x04z5' /* as favorites to populate list */,
                    ),
                    style: TextStyle(
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                  )
                ],
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
