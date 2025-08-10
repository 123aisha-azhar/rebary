import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WastaRecord extends FirestoreRecord {
  WastaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "visibility" field.
  bool? _visibility;
  bool get visibility => _visibility ?? false;
  bool hasVisibility() => _visibility != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "jobtitle" field.
  String? _jobtitle;
  String get jobtitle => _jobtitle ?? '';
  bool hasJobtitle() => _jobtitle != null;

  // "job" field.
  String? _job;
  String get job => _job ?? '';
  bool hasJob() => _job != null;

  // "pageview" field.
  int? _pageview;
  int get pageview => _pageview ?? 0;
  bool hasPageview() => _pageview != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "gallery" field.
  List<String>? _gallery;
  List<String> get gallery => _gallery ?? const [];
  bool hasGallery() => _gallery != null;

  // "phone1" field.
  String? _phone1;
  String get phone1 => _phone1 ?? '';
  bool hasPhone1() => _phone1 != null;

  // "phone2" field.
  String? _phone2;
  String get phone2 => _phone2 ?? '';
  bool hasPhone2() => _phone2 != null;

  // "whatsapp" field.
  String? _whatsapp;
  String get whatsapp => _whatsapp ?? '';
  bool hasWhatsapp() => _whatsapp != null;

  // "facebook" field.
  String? _facebook;
  String get facebook => _facebook ?? '';
  bool hasFacebook() => _facebook != null;

  // "instagaram" field.
  String? _instagaram;
  String get instagaram => _instagaram ?? '';
  bool hasInstagaram() => _instagaram != null;

  // "googlemap" field.
  String? _googlemap;
  String get googlemap => _googlemap ?? '';
  bool hasGooglemap() => _googlemap != null;

  // "wazemap" field.
  String? _wazemap;
  String get wazemap => _wazemap ?? '';
  bool hasWazemap() => _wazemap != null;

  // "snapchat" field.
  String? _snapchat;
  String get snapchat => _snapchat ?? '';
  bool hasSnapchat() => _snapchat != null;

  // "tiktok" field.
  String? _tiktok;
  String get tiktok => _tiktok ?? '';
  bool hasTiktok() => _tiktok != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "valid" field.
  String? _valid;
  String get valid => _valid ?? '';
  bool hasValid() => _valid != null;

  // "info1" field.
  String? _info1;
  String get info1 => _info1 ?? '';
  bool hasInfo1() => _info1 != null;

  // "info2" field.
  String? _info2;
  String get info2 => _info2 ?? '';
  bool hasInfo2() => _info2 != null;

  // "categoryref" field.
  DocumentReference? _categoryref;
  DocumentReference? get categoryref => _categoryref;
  bool hasCategoryref() => _categoryref != null;

  // "search" field.
  String? _search;
  String get search => _search ?? '';
  bool hasSearch() => _search != null;

  // "viber" field.
  int? _viber;
  int get viber => _viber ?? 0;
  bool hasViber() => _viber != null;

  void _initializeFields() {
    _visibility = snapshotData['visibility'] as bool?;
    _city = snapshotData['city'] as String?;
    _title = snapshotData['title'] as String?;
    _name = snapshotData['name'] as String?;
    _jobtitle = snapshotData['jobtitle'] as String?;
    _job = snapshotData['job'] as String?;
    _pageview = castToType<int>(snapshotData['pageview']);
    _image = snapshotData['image'] as String?;
    _gallery = getDataList(snapshotData['gallery']);
    _phone1 = snapshotData['phone1'] as String?;
    _phone2 = snapshotData['phone2'] as String?;
    _whatsapp = snapshotData['whatsapp'] as String?;
    _facebook = snapshotData['facebook'] as String?;
    _instagaram = snapshotData['instagaram'] as String?;
    _googlemap = snapshotData['googlemap'] as String?;
    _wazemap = snapshotData['wazemap'] as String?;
    _snapchat = snapshotData['snapchat'] as String?;
    _tiktok = snapshotData['tiktok'] as String?;
    _website = snapshotData['website'] as String?;
    _valid = snapshotData['valid'] as String?;
    _info1 = snapshotData['info1'] as String?;
    _info2 = snapshotData['info2'] as String?;
    _categoryref = snapshotData['categoryref'] as DocumentReference?;
    _search = snapshotData['search'] as String?;
    _viber = castToType<int>(snapshotData['viber']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wasta');

  static Stream<WastaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WastaRecord.fromSnapshot(s));

  static Future<WastaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WastaRecord.fromSnapshot(s));

  static WastaRecord fromSnapshot(DocumentSnapshot snapshot) => WastaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WastaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WastaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WastaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WastaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWastaRecordData({
  bool? visibility,
  String? city,
  String? title,
  String? name,
  String? jobtitle,
  String? job,
  int? pageview,
  String? image,
  String? phone1,
  String? phone2,
  String? whatsapp,
  String? facebook,
  String? instagaram,
  String? googlemap,
  String? wazemap,
  String? snapchat,
  String? tiktok,
  String? website,
  String? valid,
  String? info1,
  String? info2,
  DocumentReference? categoryref,
  String? search,
  int? viber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'visibility': visibility,
      'city': city,
      'title': title,
      'name': name,
      'jobtitle': jobtitle,
      'job': job,
      'pageview': pageview,
      'image': image,
      'phone1': phone1,
      'phone2': phone2,
      'whatsapp': whatsapp,
      'facebook': facebook,
      'instagaram': instagaram,
      'googlemap': googlemap,
      'wazemap': wazemap,
      'snapchat': snapchat,
      'tiktok': tiktok,
      'website': website,
      'valid': valid,
      'info1': info1,
      'info2': info2,
      'categoryref': categoryref,
      'search': search,
      'viber': viber,
    }.withoutNulls,
  );

  return firestoreData;
}

class WastaRecordDocumentEquality implements Equality<WastaRecord> {
  const WastaRecordDocumentEquality();

  @override
  bool equals(WastaRecord? e1, WastaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.visibility == e2?.visibility &&
        e1?.city == e2?.city &&
        e1?.title == e2?.title &&
        e1?.name == e2?.name &&
        e1?.jobtitle == e2?.jobtitle &&
        e1?.job == e2?.job &&
        e1?.pageview == e2?.pageview &&
        e1?.image == e2?.image &&
        listEquality.equals(e1?.gallery, e2?.gallery) &&
        e1?.phone1 == e2?.phone1 &&
        e1?.phone2 == e2?.phone2 &&
        e1?.whatsapp == e2?.whatsapp &&
        e1?.facebook == e2?.facebook &&
        e1?.instagaram == e2?.instagaram &&
        e1?.googlemap == e2?.googlemap &&
        e1?.wazemap == e2?.wazemap &&
        e1?.snapchat == e2?.snapchat &&
        e1?.tiktok == e2?.tiktok &&
        e1?.website == e2?.website &&
        e1?.valid == e2?.valid &&
        e1?.info1 == e2?.info1 &&
        e1?.info2 == e2?.info2 &&
        e1?.categoryref == e2?.categoryref &&
        e1?.search == e2?.search &&
        e1?.viber == e2?.viber;
  }

  @override
  int hash(WastaRecord? e) => const ListEquality().hash([
        e?.visibility,
        e?.city,
        e?.title,
        e?.name,
        e?.jobtitle,
        e?.job,
        e?.pageview,
        e?.image,
        e?.gallery,
        e?.phone1,
        e?.phone2,
        e?.whatsapp,
        e?.facebook,
        e?.instagaram,
        e?.googlemap,
        e?.wazemap,
        e?.snapchat,
        e?.tiktok,
        e?.website,
        e?.valid,
        e?.info1,
        e?.info2,
        e?.categoryref,
        e?.search,
        e?.viber
      ]);

  @override
  bool isValidKey(Object? o) => o is WastaRecord;
}
