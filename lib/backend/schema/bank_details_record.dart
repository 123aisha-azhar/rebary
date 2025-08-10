import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BankDetailsRecord extends FirestoreRecord {
  BankDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "paymnetdetail" field.
  String? _paymnetdetail;
  String get paymnetdetail => _paymnetdetail ?? '';
  bool hasPaymnetdetail() => _paymnetdetail != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _paymnetdetail = snapshotData['paymnetdetail'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bankDetails');

  static Stream<BankDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BankDetailsRecord.fromSnapshot(s));

  static Future<BankDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BankDetailsRecord.fromSnapshot(s));

  static BankDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BankDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BankDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BankDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BankDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BankDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBankDetailsRecordData({
  String? type,
  String? paymnetdetail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'paymnetdetail': paymnetdetail,
    }.withoutNulls,
  );

  return firestoreData;
}

class BankDetailsRecordDocumentEquality implements Equality<BankDetailsRecord> {
  const BankDetailsRecordDocumentEquality();

  @override
  bool equals(BankDetailsRecord? e1, BankDetailsRecord? e2) {
    return e1?.type == e2?.type && e1?.paymnetdetail == e2?.paymnetdetail;
  }

  @override
  int hash(BankDetailsRecord? e) =>
      const ListEquality().hash([e?.type, e?.paymnetdetail]);

  @override
  bool isValidKey(Object? o) => o is BankDetailsRecord;
}
