import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rev_cat_paywall_model.dart';
export 'rev_cat_paywall_model.dart';

class RevCatPaywallWidget extends StatefulWidget {
  const RevCatPaywallWidget({
    Key? key,
    this.navigateTo,
  }) : super(key: key);

  final String? navigateTo;

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

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(0.0),
          child: Image.asset(
            'assets/images/Untitled_design_(20).png',
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            fit: BoxFit.cover,
          ),
        ),
        Column(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              's79a6uqz' /* Become a VARIANT and reach you... */,
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Jost',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'wvfr82d3' /* Purchase for lifetime access */,
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Jost',
                                  color: FlutterFlowTheme.of(context).accent2,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(150.0, 0.0, 0.0, 0.0),
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.trophy,
                                  color: FlutterFlowTheme.of(context).accent2,
                                  size: 30.0,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '1i1a8uv0' /* Unlimited access to app functi... */,
                                          ),
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Jost',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.folder_copy,
                                  color: FlutterFlowTheme.of(context).accent2,
                                  size: 30.0,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'bz5sfcu5' /* Unlimited access to VARIANT pr... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Jost',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.calculate,
                                  color: FlutterFlowTheme.of(context).accent2,
                                  size: 30.0,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'w6r79tif' /* Custom Macro Calculator */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Jost',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.comments,
                                  color: FlutterFlowTheme.of(context).accent2,
                                  size: 30.0,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            '5nsu9132' /* Exclusive Facebook Group */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Jost',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.video_collection,
                                  color: FlutterFlowTheme.of(context).accent2,
                                  size: 30.0,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'v040zuat' /* Lifetime access to exercise li... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Jost',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.picture_as_pdf,
                                  color: FlutterFlowTheme.of(context).accent2,
                                  size: 30.0,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'q7f9i6mw' /* Calorie Counting Diet Guide 10... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Jost',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.weightHanging,
                                  color: FlutterFlowTheme.of(context).accent2,
                                  size: 30.0,
                                ),
                                Flexible(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          FFLocalizations.of(context).getText(
                                            'cxc6mdxu' /* Science based training Methodo... */,
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge
                                              .override(
                                                fontFamily: 'Jost',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.00, 0.96),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(0.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 2.0,
                                sigmaY: 2.0,
                              ),
                              child: Align(
                                alignment: AlignmentDirectional(-1.00, 0.00),
                                child: Container(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.899,
                                  height: 29.0,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.transparent,
                                        Color(0x25000000)
                                      ],
                                      stops: [0.0, 1.0],
                                      begin: AlignmentDirectional(1.0, 0.0),
                                      end: AlignmentDirectional(-1.0, 0),
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: RichText(
                                textScaleFactor:
                                    MediaQuery.of(context).textScaleFactor,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: FFLocalizations.of(context).getText(
                                        '4a5xgdoq' /* Full access for just  */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Jost',
                                            color: FlutterFlowTheme.of(context)
                                                .info,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    TextSpan(
                                      text: valueOrDefault<String>(
                                        revenue_cat
                                            .offerings!
                                            .current!
                                            .availablePackages
                                            .first
                                            .storeProduct
                                            .price
                                            .toString(),
                                        '-',
                                      ),
                                      style: TextStyle(),
                                    )
                                  ],
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Jost',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                      ),
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            FFButtonWidget(
                              onPressed: () async {
                                var _shouldSetState = false;
                                _model.purchaseResponse = await revenue_cat
                                    .purchasePackage('\$rc_lifetime');
                                _shouldSetState = true;
                                if (_model.purchaseResponse!) {
                                  unawaited(
                                    () async {
                                      await currentUserReference!
                                          .update(createUsersRecordData(
                                        isSubbed: true,
                                      ));
                                    }(),
                                  );
                                  Navigator.pop(context);
                                  if (widget.navigateTo == 'timer') {
                                    context.pushNamed('timer');

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else if (widget.navigateTo == 'program') {
                                    context.pushNamed('program');

                                    if (_shouldSetState) setState(() {});
                                    return;
                                  } else {
                                    if (_shouldSetState) setState(() {});
                                    return;
                                  }
                                } else {
                                  if (_shouldSetState) setState(() {});
                                  return;
                                }

                                if (_shouldSetState) setState(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'qscd8ud1' /* Become a VARIANT */,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 1.0,
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
                                      color: Colors.white,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: AlignmentDirectional(0.96, -0.93),
          child: Icon(
            Icons.close,
            color: FlutterFlowTheme.of(context).accent2,
            size: 30.0,
          ),
        ),
      ],
    );
  }
}
