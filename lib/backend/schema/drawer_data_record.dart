import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DrawerDataRecord extends FirestoreRecord {
  DrawerDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "contributors" field.
  List<ImageTitleStruct>? _contributors;
  List<ImageTitleStruct> get contributors => _contributors ?? const [];
  bool hasContributors() => _contributors != null;

  // "guideVideos" field.
  List<VideoTitleStruct>? _guideVideos;
  List<VideoTitleStruct> get guideVideos => _guideVideos ?? const [];
  bool hasGuideVideos() => _guideVideos != null;

  // "whatsAppUrl" field.
  String? _whatsAppUrl;
  String get whatsAppUrl => _whatsAppUrl ?? '';
  bool hasWhatsAppUrl() => _whatsAppUrl != null;

  // "text1" field.
  String? _text1;
  String get text1 => _text1 ?? '';
  bool hasText1() => _text1 != null;

  // "text2" field.
  String? _text2;
  String get text2 => _text2 ?? '';
  bool hasText2() => _text2 != null;

  // "text3" field.
  String? _text3;
  String get text3 => _text3 ?? '';
  bool hasText3() => _text3 != null;

  // "text4" field.
  String? _text4;
  String get text4 => _text4 ?? '';
  bool hasText4() => _text4 != null;

  void _initializeFields() {
    _contributors = getStructList(
      snapshotData['contributors'],
      ImageTitleStruct.fromMap,
    );
    _guideVideos = getStructList(
      snapshotData['guideVideos'],
      VideoTitleStruct.fromMap,
    );
    _whatsAppUrl = snapshotData['whatsAppUrl'] as String?;
    _text1 = snapshotData['text1'] as String?;
    _text2 = snapshotData['text2'] as String?;
    _text3 = snapshotData['text3'] as String?;
    _text4 = snapshotData['text4'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('drawerData');

  static Stream<DrawerDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DrawerDataRecord.fromSnapshot(s));

  static Future<DrawerDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DrawerDataRecord.fromSnapshot(s));

  static DrawerDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DrawerDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DrawerDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DrawerDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DrawerDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DrawerDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDrawerDataRecordData({
  String? whatsAppUrl,
  String? text1,
  String? text2,
  String? text3,
  String? text4,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'whatsAppUrl': whatsAppUrl,
      'text1': text1,
      'text2': text2,
      'text3': text3,
      'text4': text4,
    }.withoutNulls,
  );

  return firestoreData;
}

class DrawerDataRecordDocumentEquality implements Equality<DrawerDataRecord> {
  const DrawerDataRecordDocumentEquality();

  @override
  bool equals(DrawerDataRecord? e1, DrawerDataRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.contributors, e2?.contributors) &&
        listEquality.equals(e1?.guideVideos, e2?.guideVideos) &&
        e1?.whatsAppUrl == e2?.whatsAppUrl &&
        e1?.text1 == e2?.text1 &&
        e1?.text2 == e2?.text2 &&
        e1?.text3 == e2?.text3 &&
        e1?.text4 == e2?.text4;
  }

  @override
  int hash(DrawerDataRecord? e) => const ListEquality().hash([
        e?.contributors,
        e?.guideVideos,
        e?.whatsAppUrl,
        e?.text1,
        e?.text2,
        e?.text3,
        e?.text4
      ]);

  @override
  bool isValidKey(Object? o) => o is DrawerDataRecord;
}
