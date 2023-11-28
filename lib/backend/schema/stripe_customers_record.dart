import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StripeCustomersRecord extends FirestoreRecord {
  StripeCustomersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "checkoutSessionId" field.
  String? _checkoutSessionId;
  String get checkoutSessionId => _checkoutSessionId ?? '';
  bool hasCheckoutSessionId() => _checkoutSessionId != null;

  // "paymentStatus" field.
  String? _paymentStatus;
  String get paymentStatus => _paymentStatus ?? '';
  bool hasPaymentStatus() => _paymentStatus != null;

  // "amountTotal" field.
  String? _amountTotal;
  String get amountTotal => _amountTotal ?? '';
  bool hasAmountTotal() => _amountTotal != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  void _initializeFields() {
    _checkoutSessionId = snapshotData['checkoutSessionId'] as String?;
    _paymentStatus = snapshotData['paymentStatus'] as String?;
    _amountTotal = snapshotData['amountTotal'] as String?;
    _email = snapshotData['email'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stripeCustomers');

  static Stream<StripeCustomersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StripeCustomersRecord.fromSnapshot(s));

  static Future<StripeCustomersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StripeCustomersRecord.fromSnapshot(s));

  static StripeCustomersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StripeCustomersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StripeCustomersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StripeCustomersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StripeCustomersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StripeCustomersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStripeCustomersRecordData({
  String? checkoutSessionId,
  String? paymentStatus,
  String? amountTotal,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'checkoutSessionId': checkoutSessionId,
      'paymentStatus': paymentStatus,
      'amountTotal': amountTotal,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class StripeCustomersRecordDocumentEquality
    implements Equality<StripeCustomersRecord> {
  const StripeCustomersRecordDocumentEquality();

  @override
  bool equals(StripeCustomersRecord? e1, StripeCustomersRecord? e2) {
    return e1?.checkoutSessionId == e2?.checkoutSessionId &&
        e1?.paymentStatus == e2?.paymentStatus &&
        e1?.amountTotal == e2?.amountTotal &&
        e1?.email == e2?.email;
  }

  @override
  int hash(StripeCustomersRecord? e) => const ListEquality()
      .hash([e?.checkoutSessionId, e?.paymentStatus, e?.amountTotal, e?.email]);

  @override
  bool isValidKey(Object? o) => o is StripeCustomersRecord;
}
