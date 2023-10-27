import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExercisesRecord extends FirestoreRecord {
  ExercisesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "videoId" field.
  String? _videoId;
  String get videoId => _videoId ?? '';
  bool hasVideoId() => _videoId != null;

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "workoutId" field.
  String? _workoutId;
  String get workoutId => _workoutId ?? '';
  bool hasWorkoutId() => _workoutId != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  bool hasTag() => _tag != null;

  // "imageUrl" field.
  String? _imageUrl;
  String get imageUrl => _imageUrl ?? '';
  bool hasImageUrl() => _imageUrl != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "details" field.
  List<String>? _details;
  List<String> get details => _details ?? const [];
  bool hasDetails() => _details != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _videoId = snapshotData['videoId'] as String?;
    _videoUrl = snapshotData['videoUrl'] as String?;
    _workoutId = snapshotData['workoutId'] as String?;
    _tag = snapshotData['tag'] as String?;
    _imageUrl = snapshotData['imageUrl'] as String?;
    _tags = getDataList(snapshotData['tags']);
    _id = snapshotData['id'] as String?;
    _details = getDataList(snapshotData['details']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('exercises');

  static Stream<ExercisesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExercisesRecord.fromSnapshot(s));

  static Future<ExercisesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExercisesRecord.fromSnapshot(s));

  static ExercisesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ExercisesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExercisesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExercisesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExercisesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExercisesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExercisesRecordData({
  String? name,
  String? videoId,
  String? videoUrl,
  String? workoutId,
  String? tag,
  String? imageUrl,
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'videoId': videoId,
      'videoUrl': videoUrl,
      'workoutId': workoutId,
      'tag': tag,
      'imageUrl': imageUrl,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExercisesRecordDocumentEquality implements Equality<ExercisesRecord> {
  const ExercisesRecordDocumentEquality();

  @override
  bool equals(ExercisesRecord? e1, ExercisesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.videoId == e2?.videoId &&
        e1?.videoUrl == e2?.videoUrl &&
        e1?.workoutId == e2?.workoutId &&
        e1?.tag == e2?.tag &&
        e1?.imageUrl == e2?.imageUrl &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.id == e2?.id &&
        listEquality.equals(e1?.details, e2?.details);
  }

  @override
  int hash(ExercisesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.videoId,
        e?.videoUrl,
        e?.workoutId,
        e?.tag,
        e?.imageUrl,
        e?.tags,
        e?.id,
        e?.details
      ]);

  @override
  bool isValidKey(Object? o) => o is ExercisesRecord;
}
