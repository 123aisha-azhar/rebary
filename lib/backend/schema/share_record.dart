import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShareRecord extends FirestoreRecord {
  ShareRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "whatsappURL" field.
  String? _whatsappURL;
  String get whatsappURL => _whatsappURL ?? '';
  bool hasWhatsappURL() => _whatsappURL != null;

  void _initializeFields() {
    _whatsappURL = snapshotData['whatsappURL'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('share');

  static Stream<ShareRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShareRecord.fromSnapshot(s));

  static Future<ShareRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShareRecord.fromSnapshot(s));

  static ShareRecord fromSnapshot(DocumentSnapshot snapshot) => ShareRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShareRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShareRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShareRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShareRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShareRecordData({
  String? whatsappURL,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'whatsappURL': whatsappURL,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShareRecordDocumentEquality implements Equality<ShareRecord> {
  const ShareRecordDocumentEquality();

  @override
  bool equals(ShareRecord? e1, ShareRecord? e2) {
    return e1?.whatsappURL == e2?.whatsappURL;
  }

  @override
  int hash(ShareRecord? e) => const ListEquality().hash([e?.whatsappURL]);

  @override
  bool isValidKey(Object? o) => o is ShareRecord;
}
