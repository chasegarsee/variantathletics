// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StripeCustomersStruct extends FFFirebaseStruct {
  StripeCustomersStruct({
    String? email,
    String? checkoutSessionId,
    String? amountTotal,
    String? paymentStatus,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _email = email,
        _checkoutSessionId = checkoutSessionId,
        _amountTotal = amountTotal,
        _paymentStatus = paymentStatus,
        super(firestoreUtilData);

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "checkoutSessionId" field.
  String? _checkoutSessionId;
  String get checkoutSessionId => _checkoutSessionId ?? '';
  set checkoutSessionId(String? val) => _checkoutSessionId = val;
  bool hasCheckoutSessionId() => _checkoutSessionId != null;

  // "amountTotal" field.
  String? _amountTotal;
  String get amountTotal => _amountTotal ?? '';
  set amountTotal(String? val) => _amountTotal = val;
  bool hasAmountTotal() => _amountTotal != null;

  // "paymentStatus" field.
  String? _paymentStatus;
  String get paymentStatus => _paymentStatus ?? '';
  set paymentStatus(String? val) => _paymentStatus = val;
  bool hasPaymentStatus() => _paymentStatus != null;

  static StripeCustomersStruct fromMap(Map<String, dynamic> data) =>
      StripeCustomersStruct(
        email: data['email'] as String?,
        checkoutSessionId: data['checkoutSessionId'] as String?,
        amountTotal: data['amountTotal'] as String?,
        paymentStatus: data['paymentStatus'] as String?,
      );

  static StripeCustomersStruct? maybeFromMap(dynamic data) => data is Map
      ? StripeCustomersStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'checkoutSessionId': _checkoutSessionId,
        'amountTotal': _amountTotal,
        'paymentStatus': _paymentStatus,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'checkoutSessionId': serializeParam(
          _checkoutSessionId,
          ParamType.String,
        ),
        'amountTotal': serializeParam(
          _amountTotal,
          ParamType.String,
        ),
        'paymentStatus': serializeParam(
          _paymentStatus,
          ParamType.String,
        ),
      }.withoutNulls;

  static StripeCustomersStruct fromSerializableMap(Map<String, dynamic> data) =>
      StripeCustomersStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        checkoutSessionId: deserializeParam(
          data['checkoutSessionId'],
          ParamType.String,
          false,
        ),
        amountTotal: deserializeParam(
          data['amountTotal'],
          ParamType.String,
          false,
        ),
        paymentStatus: deserializeParam(
          data['paymentStatus'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StripeCustomersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StripeCustomersStruct &&
        email == other.email &&
        checkoutSessionId == other.checkoutSessionId &&
        amountTotal == other.amountTotal &&
        paymentStatus == other.paymentStatus;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([email, checkoutSessionId, amountTotal, paymentStatus]);
}

StripeCustomersStruct createStripeCustomersStruct({
  String? email,
  String? checkoutSessionId,
  String? amountTotal,
  String? paymentStatus,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StripeCustomersStruct(
      email: email,
      checkoutSessionId: checkoutSessionId,
      amountTotal: amountTotal,
      paymentStatus: paymentStatus,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StripeCustomersStruct? updateStripeCustomersStruct(
  StripeCustomersStruct? stripeCustomers, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stripeCustomers
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStripeCustomersStructData(
  Map<String, dynamic> firestoreData,
  StripeCustomersStruct? stripeCustomers,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stripeCustomers == null) {
    return;
  }
  if (stripeCustomers.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stripeCustomers.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stripeCustomersData =
      getStripeCustomersFirestoreData(stripeCustomers, forFieldValue);
  final nestedData =
      stripeCustomersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stripeCustomers.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStripeCustomersFirestoreData(
  StripeCustomersStruct? stripeCustomers, [
  bool forFieldValue = false,
]) {
  if (stripeCustomers == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stripeCustomers.toMap());

  // Add any Firestore field values
  stripeCustomers.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStripeCustomersListFirestoreData(
  List<StripeCustomersStruct>? stripeCustomerss,
) =>
    stripeCustomerss
        ?.map((e) => getStripeCustomersFirestoreData(e, true))
        .toList() ??
    [];
