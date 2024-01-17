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

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;

class RunRouteView extends StatefulWidget {
  final double? width;
  final double? height;
  final Color lineColor;
  final String? startAddress;
  final String? destinationAddress;
  final String startCoordinateLat;
  final String startCoordinateLng;
  final String endCoordinateLat;
  final String endCoordinateLng;
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;
  final DocumentReference runDetailsReference;

  const RunRouteView({
    Key? key,
    this.width,
    this.height,
    this.lineColor = Colors.black,
    this.startAddress,
    this.destinationAddress,
    required this.startCoordinateLat,
    required this.startCoordinateLng,
    required this.endCoordinateLat,
    required this.endCoordinateLng,
    required this.iOSGoogleMapsApiKey,
    required this.androidGoogleMapsApiKey,
    required this.webGoogleMapsApiKey,
    required this.runDetailsReference,
  }) : super(key: key);

  @override
  _RunRouteViewState createState() => _RunRouteViewState();
}

class _RunRouteViewState extends State<RunRouteView> {
  late final gmaps.CameraPosition _initialLocation;
  gmaps.GoogleMapController? mapController;
  Set<gmaps.Marker> markers = {};
  Map<gmaps.PolylineId, gmaps.Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    _initialLocation = gmaps.CameraPosition(
      target: gmaps.LatLng(
        double.parse(widget.startCoordinateLat),
        double.parse(widget.startCoordinateLng),
      ),
      zoom: 14.4746,
    );

    widget.runDetailsReference.snapshots().listen((snapshot) {
      if (snapshot != null && snapshot.exists) {
        RunRecord runRecord = RunRecord.fromSnapshot(snapshot);
        _createMarkers(runRecord);
        _drawRunRoute(runRecord);
      }
    });
  }

  void _createMarkers(RunRecord runRecord) {
    setState(() {
      markers.clear();
      markers.add(gmaps.Marker(
        markerId: gmaps.MarkerId('startMarker'),
        position: gmaps.LatLng(
          runRecord.startLocation.latitude,
          runRecord.startLocation.longitude,
        ),
        infoWindow: gmaps.InfoWindow(title: 'Start Point'),
      ));
      markers.add(gmaps.Marker(
        markerId: gmaps.MarkerId('endMarker'),
        position: gmaps.LatLng(
          runRecord.endLocation.latitude,
          runRecord.endLocation.longitude,
        ),
        infoWindow: gmaps.InfoWindow(title: 'End Point'),
      ));
    });
  }

  void _drawRunRoute(RunRecord runRecord) {
    List<gmaps.LatLng> routePoints = runRecord.route
        .map((geoPoint) => gmaps.LatLng(
              geoPoint.latitude,
              geoPoint.longitude,
            ))
        .toList();

    gmaps.PolylineId id = gmaps.PolylineId('runRoute');
    gmaps.Polyline polyline = gmaps.Polyline(
      polylineId: id,
      color: widget.lineColor,
      points: routePoints,
      width: 5,
    );

    setState(() {
      polylines[id] = polyline;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: gmaps.GoogleMap(
        markers: markers,
        initialCameraPosition: _initialLocation,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        mapType: gmaps.MapType.normal,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: false,
        polylines: Set<gmaps.Polyline>.of(polylines.values),
        onMapCreated: (gmaps.GoogleMapController controller) {
          mapController = controller;
        },
      ),
    );
  }
}

class RunRecord {
  final Timestamp startTime;
  final Timestamp endTime;
  final num? totalDistance;
  final List<GeoPoint> route;
  final num? duration;
  final num? averagePace;
  final num? caloriesBurned;
  final GeoPoint startLocation;
  final GeoPoint endLocation;
  final String runTitle;
  final String notes;

  RunRecord({
    required this.startTime,
    required this.endTime,
    this.totalDistance,
    required this.route,
    this.duration,
    this.averagePace,
    this.caloriesBurned,
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
      totalDistance: data['totalDistance'] as num?,
      route: (data['route'] as List)
          .map((e) => GeoPoint(e.latitude, e.longitude))
          .toList(),
      duration: data['duration'] as num?,
      averagePace: data['averagePace'] as num?,
      caloriesBurned: data['caloriesBurned'] as num?,
      startLocation: GeoPoint(
          data['startLocation'].latitude, data['startLocation'].longitude),
      endLocation:
          GeoPoint(data['endLocation'].latitude, data['endLocation'].longitude),
      runTitle: data['runTitle'],
      notes: data['notes'],
    );
  }
}
