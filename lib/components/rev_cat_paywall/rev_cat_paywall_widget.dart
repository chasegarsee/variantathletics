import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rev_cat_paywall_model.dart';
export 'rev_cat_paywall_model.dart';

class RevCatPaywallWidget extends StatefulWidget {
  const RevCatPaywallWidget({Key? key}) : super(key: key);

  @override
  _RevCatPaywallWidgetState createState() => _RevCatPaywallWidgetState();
}

class _RevCatPaywallWidgetState extends State<RevCatPaywallWidget> {
  late RevCatPaywallModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RevCatPaywallModel());
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
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(1.00, -1.00),
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
                    Text(
                      valueOrDefault<String>(
                        revenue_cat.offerings!.current!.identifier,
                        '-',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Text(
                      valueOrDefault<String>(
                        revenue_cat.offerings!.current!
                            .getPackage('Lifetime')!
                            .storeProduct
                            .identifier,
                        '-',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Text(
                      valueOrDefault<String>(
                        revenue_cat.offerings!.current!
                            .getPackage('Lifetime')!
                            .storeProduct
                            .priceString,
                        '-',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                    Text(
                      valueOrDefault<String>(
                        revenue_cat.offerings!.current!
                            .getPackage('Lifetime')!
                            .storeProduct
                            .price
                            .toString(),
                        '-',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium,
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
