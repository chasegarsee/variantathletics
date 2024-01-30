import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RunsRecord extends FirestoreRecord {
  RunsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "averagePace" field.
  int? _averagePace;
  int get averagePace => _averagePace ?? 0;
  bool hasAveragePace() => _averagePace != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  // "endLocation" field.
  LatLng? _endLocation;
  LatLng? get endLocation => _endLocation;
  bool hasEndLocation() => _endLocation != null;

  // "endTime" field.
  DateTime? _endTime;
  DateTime? get endTime => _endTime;
  bool hasEndTime() => _endTime != null;

  // "notes" field.
  String? _notes;
  String get notes => _notes ?? '';
  bool hasNotes() => _notes != null;

  // "route" field.
  List<LatLng>? _route;
  List<LatLng> get route => _route ?? const [];
  bool hasRoute() => _route != null;

  // "runTitle" field.
  String? _runTitle;
  String get runTitle => _runTitle ?? '';
  bool hasRunTitle() => _runTitle != null;

  // "startLocation" field.
  LatLng? _startLocation;
  LatLng? get startLocation => _startLocation;
  bool hasStartLocation() => _startLocation != null;

  // "startTime" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "totalDistance" field.
  double? _totalDistance;
  double get totalDistance => _totalDistance ?? 0.0;
  bool hasTotalDistance() => _totalDistance != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _averagePace = castToType<int>(snapshotData['averagePace']);
    _duration = castToType<int>(snapshotData['duration']);
    _endLocation = snapshotData['endLocation'] as LatLng?;
    _endTime = snapshotData['endTime'] as DateTime?;
    _notes = snapshotData['notes'] as String?;
    _route = getDataList(snapshotData['route']);
    _runTitle = snapshotData['runTitle'] as String?;
    _startLocation = snapshotData['startLocation'] as LatLng?;
    _startTime = snapshotData['startTime'] as DateTime?;
    _totalDistance = castToType<double>(snapshotData['totalDistance']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('runs')
          : FirebaseFirestore.instance.collectionGroup('runs');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('runs').doc(id);

  static Stream<RunsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RunsRecord.fromSnapshot(s));

  static Future<RunsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RunsRecord.fromSnapshot(s));

  static RunsRecord fromSnapshot(DocumentSnapshot snapshot) => RunsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RunsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RunsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RunsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RunsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRunsRecordData({
  int? averagePace,
  int? duration,
  LatLng? endLocation,
  DateTime? endTime,
  String? notes,
  String? runTitle,
  LatLng? startLocation,
  DateTime? startTime,
  double? totalDistance,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'averagePace': averagePace,
      'duration': duration,
      'endLocation': endLocation,
      'endTime': endTime,
      'notes': notes,
      'runTitle': runTitle,
      'startLocation': startLocation,
      'startTime': startTime,
      'totalDistance': totalDistance,
    }.withoutNulls,
  );

  return firestoreData;
}

class RunsRecordDocumentEquality implements Equality<RunsRecord> {
  const RunsRecordDocumentEquality();

  @override
  bool equals(RunsRecord? e1, RunsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.averagePace == e2?.averagePace &&
        e1?.duration == e2?.duration &&
        e1?.endLocation == e2?.endLocation &&
        e1?.endTime == e2?.endTime &&
        e1?.notes == e2?.notes &&
        listEquality.equals(e1?.route, e2?.route) &&
        e1?.runTitle == e2?.runTitle &&
        e1?.startLocation == e2?.startLocation &&
        e1?.startTime == e2?.startTime &&
        e1?.totalDistance == e2?.totalDistance;
  }

  @override
  int hash(RunsRecord? e) => const ListEquality().hash([
        e?.averagePace,
        e?.duration,
        e?.endLocation,
        e?.endTime,
        e?.notes,
        e?.route,
        e?.runTitle,
        e?.startLocation,
        e?.startTime,
        e?.totalDistance
      ]);

  @override
  bool isValidKey(Object? o) => o is RunsRecord;
}
