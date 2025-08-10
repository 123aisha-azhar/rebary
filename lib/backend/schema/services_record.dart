import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServicesRecord extends FirestoreRecord {
  ServicesRecord._(
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

  // "dd3" field.
  String? _dd3;
  String get dd3 => _dd3 ?? '';
  bool hasDd3() => _dd3 != null;

  // "search" field.
  String? _search;
  String get search => _search ?? '';
  bool hasSearch() => _search != null;

  // "providedby" field.
  String? _providedby;
  String get providedby => _providedby ?? '';
  bool hasProvidedby() => _providedby != null;

  // "viber" field.
  String? _viber;
  String get viber => _viber ?? '';
  bool hasViber() => _viber != null;

  // "youtube" field.
  String? _youtube;
  String get youtube => _youtube ?? '';
  bool hasYoutube() => _youtube != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "telegram" field.
  String? _telegram;
  String get telegram => _telegram ?? '';
  bool hasTelegram() => _telegram != null;

  // "phone3" field.
  String? _phone3;
  String get phone3 => _phone3 ?? '';
  bool hasPhone3() => _phone3 != null;

  // "info3" field.
  String? _info3;
  String get info3 => _info3 ?? '';
  bool hasInfo3() => _info3 != null;

  // "info4" field.
  String? _info4;
  String get info4 => _info4 ?? '';
  bool hasInfo4() => _info4 != null;

  // "latlng" field.
  LatLng? _latlng;
  LatLng? get latlng => _latlng;
  bool hasLatlng() => _latlng != null;

  // "dd4" field.
  String? _dd4;
  String get dd4 => _dd4 ?? '';
  bool hasDd4() => _dd4 != null;

  // "dd5" field.
  String? _dd5;
  String get dd5 => _dd5 ?? '';
  bool hasDd5() => _dd5 != null;

  // "dd6" field.
  String? _dd6;
  String get dd6 => _dd6 ?? '';
  bool hasDd6() => _dd6 != null;

  // "recorddate" field.
  DateTime? _recorddate;
  DateTime? get recorddate => _recorddate;
  bool hasRecorddate() => _recorddate != null;

  // "phone1clickcount" field.
  int? _phone1clickcount;
  int get phone1clickcount => _phone1clickcount ?? 0;
  bool hasPhone1clickcount() => _phone1clickcount != null;

  // "phone2clickcount" field.
  int? _phone2clickcount;
  int get phone2clickcount => _phone2clickcount ?? 0;
  bool hasPhone2clickcount() => _phone2clickcount != null;

  // "phone3clickcount" field.
  int? _phone3clickcount;
  int get phone3clickcount => _phone3clickcount ?? 0;
  bool hasPhone3clickcount() => _phone3clickcount != null;

  // "whatsappclickcount" field.
  int? _whatsappclickcount;
  int get whatsappclickcount => _whatsappclickcount ?? 0;
  bool hasWhatsappclickcount() => _whatsappclickcount != null;

  // "viberclickcount" field.
  int? _viberclickcount;
  int get viberclickcount => _viberclickcount ?? 0;
  bool hasViberclickcount() => _viberclickcount != null;

  // "insagaramclickcount" field.
  int? _insagaramclickcount;
  int get insagaramclickcount => _insagaramclickcount ?? 0;
  bool hasInsagaramclickcount() => _insagaramclickcount != null;

  // "telegramclickcount" field.
  int? _telegramclickcount;
  int get telegramclickcount => _telegramclickcount ?? 0;
  bool hasTelegramclickcount() => _telegramclickcount != null;

  // "facebookclickcount" field.
  int? _facebookclickcount;
  int get facebookclickcount => _facebookclickcount ?? 0;
  bool hasFacebookclickcount() => _facebookclickcount != null;

  // "snapchatclickcount" field.
  int? _snapchatclickcount;
  int get snapchatclickcount => _snapchatclickcount ?? 0;
  bool hasSnapchatclickcount() => _snapchatclickcount != null;

  // "tiktokclickcount" field.
  int? _tiktokclickcount;
  int get tiktokclickcount => _tiktokclickcount ?? 0;
  bool hasTiktokclickcount() => _tiktokclickcount != null;

  // "youtubeclickcount" field.
  int? _youtubeclickcount;
  int get youtubeclickcount => _youtubeclickcount ?? 0;
  bool hasYoutubeclickcount() => _youtubeclickcount != null;

  // "websiteclickcount" field.
  int? _websiteclickcount;
  int get websiteclickcount => _websiteclickcount ?? 0;
  bool hasWebsiteclickcount() => _websiteclickcount != null;

  // "googlemapclickcount" field.
  int? _googlemapclickcount;
  int get googlemapclickcount => _googlemapclickcount ?? 0;
  bool hasGooglemapclickcount() => _googlemapclickcount != null;

  // "wazemapclickcount" field.
  int? _wazemapclickcount;
  int get wazemapclickcount => _wazemapclickcount ?? 0;
  bool hasWazemapclickcount() => _wazemapclickcount != null;

  // "emailclickcount" field.
  int? _emailclickcount;
  int get emailclickcount => _emailclickcount ?? 0;
  bool hasEmailclickcount() => _emailclickcount != null;

  // "comments" field.
  List<String>? _comments;
  List<String> get comments => _comments ?? const [];
  bool hasComments() => _comments != null;

  // "phone4" field.
  String? _phone4;
  String get phone4 => _phone4 ?? '';
  bool hasPhone4() => _phone4 != null;

  // "phone4clickcount" field.
  int? _phone4clickcount;
  int get phone4clickcount => _phone4clickcount ?? 0;
  bool hasPhone4clickcount() => _phone4clickcount != null;

  // "phone1Text" field.
  String? _phone1Text;
  String get phone1Text => _phone1Text ?? '';
  bool hasPhone1Text() => _phone1Text != null;

  // "phone2Text" field.
  String? _phone2Text;
  String get phone2Text => _phone2Text ?? '';
  bool hasPhone2Text() => _phone2Text != null;

  // "phone3Text" field.
  String? _phone3Text;
  String get phone3Text => _phone3Text ?? '';
  bool hasPhone3Text() => _phone3Text != null;

  // "phone4Text" field.
  String? _phone4Text;
  String get phone4Text => _phone4Text ?? '';
  bool hasPhone4Text() => _phone4Text != null;

  // "playstore" field.
  String? _playstore;
  String get playstore => _playstore ?? '';
  bool hasPlaystore() => _playstore != null;

  // "appleStore" field.
  String? _appleStore;
  String get appleStore => _appleStore ?? '';
  bool hasAppleStore() => _appleStore != null;

  // "playstoreClickCount" field.
  int? _playstoreClickCount;
  int get playstoreClickCount => _playstoreClickCount ?? 0;
  bool hasPlaystoreClickCount() => _playstoreClickCount != null;

  // "appleStoreClickCount" field.
  int? _appleStoreClickCount;
  int get appleStoreClickCount => _appleStoreClickCount ?? 0;
  bool hasAppleStoreClickCount() => _appleStoreClickCount != null;

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
    _dd3 = snapshotData['dd3'] as String?;
    _search = snapshotData['search'] as String?;
    _providedby = snapshotData['providedby'] as String?;
    _viber = snapshotData['viber'] as String?;
    _youtube = snapshotData['youtube'] as String?;
    _email = snapshotData['email'] as String?;
    _telegram = snapshotData['telegram'] as String?;
    _phone3 = snapshotData['phone3'] as String?;
    _info3 = snapshotData['info3'] as String?;
    _info4 = snapshotData['info4'] as String?;
    _latlng = snapshotData['latlng'] as LatLng?;
    _dd4 = snapshotData['dd4'] as String?;
    _dd5 = snapshotData['dd5'] as String?;
    _dd6 = snapshotData['dd6'] as String?;
    _recorddate = snapshotData['recorddate'] as DateTime?;
    _phone1clickcount = castToType<int>(snapshotData['phone1clickcount']);
    _phone2clickcount = castToType<int>(snapshotData['phone2clickcount']);
    _phone3clickcount = castToType<int>(snapshotData['phone3clickcount']);
    _whatsappclickcount = castToType<int>(snapshotData['whatsappclickcount']);
    _viberclickcount = castToType<int>(snapshotData['viberclickcount']);
    _insagaramclickcount = castToType<int>(snapshotData['insagaramclickcount']);
    _telegramclickcount = castToType<int>(snapshotData['telegramclickcount']);
    _facebookclickcount = castToType<int>(snapshotData['facebookclickcount']);
    _snapchatclickcount = castToType<int>(snapshotData['snapchatclickcount']);
    _tiktokclickcount = castToType<int>(snapshotData['tiktokclickcount']);
    _youtubeclickcount = castToType<int>(snapshotData['youtubeclickcount']);
    _websiteclickcount = castToType<int>(snapshotData['websiteclickcount']);
    _googlemapclickcount = castToType<int>(snapshotData['googlemapclickcount']);
    _wazemapclickcount = castToType<int>(snapshotData['wazemapclickcount']);
    _emailclickcount = castToType<int>(snapshotData['emailclickcount']);
    _comments = getDataList(snapshotData['comments']);
    _phone4 = snapshotData['phone4'] as String?;
    _phone4clickcount = castToType<int>(snapshotData['phone4clickcount']);
    _phone1Text = snapshotData['phone1Text'] as String?;
    _phone2Text = snapshotData['phone2Text'] as String?;
    _phone3Text = snapshotData['phone3Text'] as String?;
    _phone4Text = snapshotData['phone4Text'] as String?;
    _playstore = snapshotData['playstore'] as String?;
    _appleStore = snapshotData['appleStore'] as String?;
    _playstoreClickCount = castToType<int>(snapshotData['playstoreClickCount']);
    _appleStoreClickCount =
        castToType<int>(snapshotData['appleStoreClickCount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('services');

  static Stream<ServicesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServicesRecord.fromSnapshot(s));

  static Future<ServicesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ServicesRecord.fromSnapshot(s));

  static ServicesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServicesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServicesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServicesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServicesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServicesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServicesRecordData({
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
  String? dd3,
  String? search,
  String? providedby,
  String? viber,
  String? youtube,
  String? email,
  String? telegram,
  String? phone3,
  String? info3,
  String? info4,
  LatLng? latlng,
  String? dd4,
  String? dd5,
  String? dd6,
  DateTime? recorddate,
  int? phone1clickcount,
  int? phone2clickcount,
  int? phone3clickcount,
  int? whatsappclickcount,
  int? viberclickcount,
  int? insagaramclickcount,
  int? telegramclickcount,
  int? facebookclickcount,
  int? snapchatclickcount,
  int? tiktokclickcount,
  int? youtubeclickcount,
  int? websiteclickcount,
  int? googlemapclickcount,
  int? wazemapclickcount,
  int? emailclickcount,
  String? phone4,
  int? phone4clickcount,
  String? phone1Text,
  String? phone2Text,
  String? phone3Text,
  String? phone4Text,
  String? playstore,
  String? appleStore,
  int? playstoreClickCount,
  int? appleStoreClickCount,
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
      'dd3': dd3,
      'search': search,
      'providedby': providedby,
      'viber': viber,
      'youtube': youtube,
      'email': email,
      'telegram': telegram,
      'phone3': phone3,
      'info3': info3,
      'info4': info4,
      'latlng': latlng,
      'dd4': dd4,
      'dd5': dd5,
      'dd6': dd6,
      'recorddate': recorddate,
      'phone1clickcount': phone1clickcount,
      'phone2clickcount': phone2clickcount,
      'phone3clickcount': phone3clickcount,
      'whatsappclickcount': whatsappclickcount,
      'viberclickcount': viberclickcount,
      'insagaramclickcount': insagaramclickcount,
      'telegramclickcount': telegramclickcount,
      'facebookclickcount': facebookclickcount,
      'snapchatclickcount': snapchatclickcount,
      'tiktokclickcount': tiktokclickcount,
      'youtubeclickcount': youtubeclickcount,
      'websiteclickcount': websiteclickcount,
      'googlemapclickcount': googlemapclickcount,
      'wazemapclickcount': wazemapclickcount,
      'emailclickcount': emailclickcount,
      'phone4': phone4,
      'phone4clickcount': phone4clickcount,
      'phone1Text': phone1Text,
      'phone2Text': phone2Text,
      'phone3Text': phone3Text,
      'phone4Text': phone4Text,
      'playstore': playstore,
      'appleStore': appleStore,
      'playstoreClickCount': playstoreClickCount,
      'appleStoreClickCount': appleStoreClickCount,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServicesRecordDocumentEquality implements Equality<ServicesRecord> {
  const ServicesRecordDocumentEquality();

  @override
  bool equals(ServicesRecord? e1, ServicesRecord? e2) {
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
        e1?.dd3 == e2?.dd3 &&
        e1?.search == e2?.search &&
        e1?.providedby == e2?.providedby &&
        e1?.viber == e2?.viber &&
        e1?.youtube == e2?.youtube &&
        e1?.email == e2?.email &&
        e1?.telegram == e2?.telegram &&
        e1?.phone3 == e2?.phone3 &&
        e1?.info3 == e2?.info3 &&
        e1?.info4 == e2?.info4 &&
        e1?.latlng == e2?.latlng &&
        e1?.dd4 == e2?.dd4 &&
        e1?.dd5 == e2?.dd5 &&
        e1?.dd6 == e2?.dd6 &&
        e1?.recorddate == e2?.recorddate &&
        e1?.phone1clickcount == e2?.phone1clickcount &&
        e1?.phone2clickcount == e2?.phone2clickcount &&
        e1?.phone3clickcount == e2?.phone3clickcount &&
        e1?.whatsappclickcount == e2?.whatsappclickcount &&
        e1?.viberclickcount == e2?.viberclickcount &&
        e1?.insagaramclickcount == e2?.insagaramclickcount &&
        e1?.telegramclickcount == e2?.telegramclickcount &&
        e1?.facebookclickcount == e2?.facebookclickcount &&
        e1?.snapchatclickcount == e2?.snapchatclickcount &&
        e1?.tiktokclickcount == e2?.tiktokclickcount &&
        e1?.youtubeclickcount == e2?.youtubeclickcount &&
        e1?.websiteclickcount == e2?.websiteclickcount &&
        e1?.googlemapclickcount == e2?.googlemapclickcount &&
        e1?.wazemapclickcount == e2?.wazemapclickcount &&
        e1?.emailclickcount == e2?.emailclickcount &&
        listEquality.equals(e1?.comments, e2?.comments) &&
        e1?.phone4 == e2?.phone4 &&
        e1?.phone4clickcount == e2?.phone4clickcount &&
        e1?.phone1Text == e2?.phone1Text &&
        e1?.phone2Text == e2?.phone2Text &&
        e1?.phone3Text == e2?.phone3Text &&
        e1?.phone4Text == e2?.phone4Text &&
        e1?.playstore == e2?.playstore &&
        e1?.appleStore == e2?.appleStore &&
        e1?.playstoreClickCount == e2?.playstoreClickCount &&
        e1?.appleStoreClickCount == e2?.appleStoreClickCount;
  }

  @override
  int hash(ServicesRecord? e) => const ListEquality().hash([
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
        e?.dd3,
        e?.search,
        e?.providedby,
        e?.viber,
        e?.youtube,
        e?.email,
        e?.telegram,
        e?.phone3,
        e?.info3,
        e?.info4,
        e?.latlng,
        e?.dd4,
        e?.dd5,
        e?.dd6,
        e?.recorddate,
        e?.phone1clickcount,
        e?.phone2clickcount,
        e?.phone3clickcount,
        e?.whatsappclickcount,
        e?.viberclickcount,
        e?.insagaramclickcount,
        e?.telegramclickcount,
        e?.facebookclickcount,
        e?.snapchatclickcount,
        e?.tiktokclickcount,
        e?.youtubeclickcount,
        e?.websiteclickcount,
        e?.googlemapclickcount,
        e?.wazemapclickcount,
        e?.emailclickcount,
        e?.comments,
        e?.phone4,
        e?.phone4clickcount,
        e?.phone1Text,
        e?.phone2Text,
        e?.phone3Text,
        e?.phone4Text,
        e?.playstore,
        e?.appleStore,
        e?.playstoreClickCount,
        e?.appleStoreClickCount
      ]);

  @override
  bool isValidKey(Object? o) => o is ServicesRecord;
}
