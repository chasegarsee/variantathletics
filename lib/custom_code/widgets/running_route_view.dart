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

class RunningRouteView extends StatefulWidget {
  const RunningRouteView({
    Key? key,
    this.width,
    this.height,
    this.lineColor,
    this.startAddress,
    this.destinationAddress,
    required this.startCoordinate,
    required this.endCoordinate,
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
  final LatLng startCoordinate;
  final LatLng endCoordinate;
  final String iOSGoogleMapsApiKey;
  final String androidGoogleMapsApiKey;
  final String webGoogleMapsApiKey;
  final DocumentReference runDetailsReference;

  @override
  _RunRouteViewState createState() => _RunRouteViewState();
}

class _RunRouteViewState extends State<RunRouteView> {
  late final CameraPosition _initialLocation;
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  Map<PolylineId, Polyline> initialPolylines = {};

  @override
  void initState() {
    super.initState();
    _initialLocation = CameraPosition(
      target: widget.startCoordinate,
      zoom: 14.4746,
    );
  }

  void _createMarkers(RunRecord runRecord) {
    markers.clear();
    markers.add(Marker(
      markerId: MarkerId('startMarker'),
      position: LatLng(
          runRecord.startLocation.latitude, runRecord.startLocation.longitude),
      infoWindow: InfoWindow(title: 'Start Point'),
    ));
    markers.add(Marker(
      markerId: MarkerId('endMarker'),
      position: LatLng(
          runRecord.endLocation.latitude, runRecord.endLocation.longitude),
      infoWindow: InfoWindow(title: 'End Point'),
    ));
  }

  void _drawRunRoute(RunRecord runRecord) {
    List<LatLng> routePoints = runRecord.route
        .map((geoPoint) => LatLng(geoPoint.latitude, geoPoint.longitude))
        .toList();

    PolylineId id = PolylineId('runRoute');
    Polyline polyline = Polyline(
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

          return GoogleMap(
            markers: markers,
            initialCameraPosition: _initialLocation,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            polylines: Set<Polyline>.of(initialPolylines.values),
            onMapCreated: (GoogleMapController controller) {
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
  final GeoPoint startLocation;
  final GeoPoint endLocation;
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
      startLocation: GeoPoint(
          data['startLocation'].latitude, data['startLocation'].longitude),
      endLocation:
          GeoPoint(data['endLocation'].latitude, data['endLocation'].longitude),
      runTitle: data['runTitle'],
      notes: data['notes'],
    );
  }
}
