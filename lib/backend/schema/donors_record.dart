import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DonorsRecord extends FirestoreRecord {
  DonorsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "donaterdetail" field.
  String? _donaterdetail;
  String get donaterdetail => _donaterdetail ?? '';
  bool hasDonaterdetail() => _donaterdetail != null;

  void _initializeFields() {
    _userName = snapshotData['userName'] as String?;
    _image = snapshotData['image'] as String?;
    _donaterdetail = snapshotData['donaterdetail'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('donors');

  static Stream<DonorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DonorsRecord.fromSnapshot(s));

  static Future<DonorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DonorsRecord.fromSnapshot(s));

  static DonorsRecord fromSnapshot(DocumentSnapshot snapshot) => DonorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DonorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DonorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DonorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DonorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDonorsRecordData({
  String? userName,
  String? image,
  String? donaterdetail,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userName': userName,
      'image': image,
      'donaterdetail': donaterdetail,
    }.withoutNulls,
  );

  return firestoreData;
}

class DonorsRecordDocumentEquality implements Equality<DonorsRecord> {
  const DonorsRecordDocumentEquality();

  @override
  bool equals(DonorsRecord? e1, DonorsRecord? e2) {
    return e1?.userName == e2?.userName &&
        e1?.image == e2?.image &&
        e1?.donaterdetail == e2?.donaterdetail;
  }

  @override
  int hash(DonorsRecord? e) =>
      const ListEquality().hash([e?.userName, e?.image, e?.donaterdetail]);

  @override
  bool isValidKey(Object? o) => o is DonorsRecord;
}
