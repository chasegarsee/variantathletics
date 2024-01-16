import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'endurance_center_model.dart';
export 'endurance_center_model.dart';

class EnduranceCenterWidget extends StatefulWidget {
  const EnduranceCenterWidget({Key? key}) : super(key: key);

  @override
  _EnduranceCenterWidgetState createState() => _EnduranceCenterWidgetState();
}

class _EnduranceCenterWidgetState extends State<EnduranceCenterWidget> {
  late EnduranceCenterModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EnduranceCenterModel());

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => setState(() => currentUserLocationValue = loc));
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
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: SpinKitRipple(
              color: FlutterFlowTheme.of(context).primaryText,
              size: 50.0,
            ),
          ),
        ),
      );
    }

    return StreamBuilder<List<RunsRecord>>(
      stream: queryRunsRecord(
        parent: currentUserReference,
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<RunsRecord> enduranceCenterRunsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final enduranceCenterRunsRecord =
            enduranceCenterRunsRecordList.isNotEmpty
                ? enduranceCenterRunsRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.sizeOf(context).height * 0.9,
                    child: custom_widgets.RunningRouteView(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.9,
                      iOSGoogleMapsApiKey:
                          'AIzaSyCu9PkWlJOgTrjveyy75ZyDqqCtCqYe7SQ',
                      androidGoogleMapsApiKey:
                          'AIzaSyCPj6jJroavbymhPwDS1-FTUfhPizJFJfk',
                      webGoogleMapsApiKey:
                          'AIzaSyDeeTs5AsU16nwbf4ZKdwAhsssTuDwzfss',
                      startCoordinate: currentUserLocationValue!,
                      runDetailsReference: enduranceCenterRunsRecord!.reference,
                      endCoordinate: FFAppState().tempLatLong!,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
