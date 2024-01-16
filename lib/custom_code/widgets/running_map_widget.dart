// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;

class RunningMapWidget extends StatefulWidget {
  const RunningMapWidget({
    Key? key,
    required this.startLocationLat,
    required this.startLocationLng,
    required this.endLocationLat,
    required this.endLocationLng,
  }) : super(key: key);

  final String startLocationLat;
  final String startLocationLng;
  final String endLocationLat;
  final String endLocationLng;

  @override
  _RunningMapWidgetState createState() => _RunningMapWidgetState();
}

class _RunningMapWidgetState extends State<RunningMapWidget> {
  late gmaps.GoogleMapController mapController;
  late gmaps.Polyline polyline;

  @override
  void initState() {
    super.initState();
    _createPolyline();
  }

  void _createPolyline() {
    var startLat = double.parse(widget.startLocationLat);
    var startLng = double.parse(widget.startLocationLng);
    var endLat = double.parse(widget.endLocationLat);
    var endLng = double.parse(widget.endLocationLng);

    polyline = gmaps.Polyline(
      polylineId: gmaps.PolylineId('running_route'),
      color: Colors.blue,
      points: [
        gmaps.LatLng(startLat, startLng),
        gmaps.LatLng(endLat, endLng),
      ],
      width: 5,
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return gmaps.GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: gmaps.CameraPosition(
        target: gmaps.LatLng(
          double.parse(widget.startLocationLat),
          double.parse(widget.startLocationLng),
        ),
        zoom: 14.0,
      ),
      polylines: {polyline},
    );
  }
}
