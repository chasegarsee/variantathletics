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

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:tuple/tuple.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'package:variant_exercise_library/flutter_flow/lat_lng.dart' as flow;

class RunRouteView extends StatefulWidget {
  const RunRouteView({
    Key? key,
    this.width,
    this.height,
    this.lineColor,
    this.startAddress,
    this.destinationAddress,
    required this.startLocation,
    required this.endLocation,
    required this.iOSGoogleMapsApiKey,
    required this.androidGoogleMapsApiKey,
    required this.webGoogleMapsApiKey,
    required this.runDetailsReference,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? lineColor;
  final String? startAddress;
  final String? destinationAddress;
  final gmaps.LatLng startLocation;
  final gmaps.LatLng endLocation;
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;
  final DocumentReference runDetailsReference;

  @override
  _RunRouteViewState createState() => _RunRouteViewState();
}

class _RunRouteViewState extends State<RunRouteView> {
  late final gmaps.CameraPosition _initialLocation;
  gmaps.GoogleMapController? mapController;
  Set<gmaps.Marker> markers = {};
  Map<gmaps.PolylineId, gmaps.Polyline> initialPolylines = {};

  @override
  void initState() {
    super.initState();
    flow.LatLng variantLatLng = widget.startLocation!
        as LatLng; // This is your original LatLng from variant_exercise_library
    gmaps.LatLng googleLatLng = gmaps.LatLng(variantLatLng.latitude,
        variantLatLng.longitude); // Convert to google_maps_flutter LatLng
    _initialLocation = gmaps.CameraPosition(
      target: googleLatLng,
      zoom: 14.4746,
    );
  }

  void _createMarkers(RunRecord runRecord) {
    markers.clear();
    markers.add(gmaps.Marker(
      markerId: gmaps.MarkerId('startMarker'),
      position: gmaps.LatLng(
          runRecord.startLocation.latitude, runRecord.startLocation.longitude),
      infoWindow: gmaps.InfoWindow(title: 'Start Point'),
    ));
    markers.add(gmaps.Marker(
      markerId: gmaps.MarkerId('endMarker'),
      position: gmaps.LatLng(
          runRecord.endLocation.latitude, runRecord.endLocation.longitude),
      infoWindow: gmaps.InfoWindow(title: 'End Point'),
    ));
  }

  void _drawRunRoute(RunRecord runRecord) {
    List<gmaps.LatLng> routePoints = runRecord.route
        .map((geoPoint) => gmaps.LatLng(geoPoint.latitude, geoPoint.longitude))
        .toList();

    gmaps.PolylineId id = gmaps.PolylineId('runRoute');
    gmaps.Polyline polyline = gmaps.Polyline(
      polylineId: id,
      color: Colors.blue,
      points: routePoints,
      width: 5,
    );

    setState(() {
      initialPolylines[id] = polyline;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: widget.runDetailsReference.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          RunRecord runRecord = RunRecord.fromSnapshot(snapshot.data!);
          _createMarkers(runRecord);
          _drawRunRoute(runRecord);

          return gmaps.GoogleMap(
            markers: markers,
            initialCameraPosition: _initialLocation,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapType: gmaps.MapType.normal,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            polylines: Set<gmaps.Polyline>.of(initialPolylines.values),
            onMapCreated: (gmaps.GoogleMapController controller) {
              mapController = controller;
            },
          );
        },
      ),
    );
  }
}

class RunRecord {
  final Timestamp startTime;
  final Timestamp endTime;
  final num totalDistance;
  final List<GeoPoint> route;
  final num duration;
  final num averagePace;
  final num caloriesBurned;
  final gmaps.LatLng startLocation;
  final gmaps.LatLng endLocation;
  final String runTitle;
  final String notes;

  RunRecord({
    required this.startTime,
    required this.endTime,
    required this.totalDistance,
    required this.route,
    required this.duration,
    required this.averagePace,
    required this.caloriesBurned,
    required this.startLocation,
    required this.endLocation,
    required this.runTitle,
    required this.notes,
  });

  factory RunRecord.fromSnapshot(DocumentSnapshot snapshot) {
    var data = snapshot.data() as Map<String, dynamic>;
    return RunRecord(
      startTime: data['startTime'],
      endTime: data['endTime'],
      totalDistance: data['totalDistance'],
      route: (data['route'] as List)
          .map((e) => GeoPoint(e.latitude, e.longitude))
          .toList(),
      duration: data['duration'],
      averagePace: data['averagePace'],
      caloriesBurned: data['caloriesBurned'],
      startLocation: gmaps.LatLng(
          data['startLocation'].latitude, data['startLocation'].longitude),
      endLocation: gmaps.LatLng(
          data['endLocation'].latitude, data['endLocation'].longitude),
      runTitle: data['runTitle'],
      notes: data['notes'],
    );
  }
}
