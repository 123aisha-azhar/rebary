import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryRecord extends FirestoreRecord {
  CategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "language" field.
  String? _language;
  String get language => _language ?? '';
  bool hasLanguage() => _language != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  // "sortingorder" field.
  int? _sortingorder;
  int get sortingorder => _sortingorder ?? 0;
  bool hasSortingorder() => _sortingorder != null;

  // "tags" field.
  List<String>? _tags;
  List<String> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "visibility" field.
  bool? _visibility;
  bool get visibility => _visibility ?? false;
  bool hasVisibility() => _visibility != null;

  // "pageview" field.
  int? _pageview;
  int get pageview => _pageview ?? 0;
  bool hasPageview() => _pageview != null;

  // "dd1" field.
  String? _dd1;
  String get dd1 => _dd1 ?? '';
  bool hasDd1() => _dd1 != null;

  // "dd2" field.
  String? _dd2;
  String get dd2 => _dd2 ?? '';
  bool hasDd2() => _dd2 != null;

  // "dd3" field.
  String? _dd3;
  String get dd3 => _dd3 ?? '';
  bool hasDd3() => _dd3 != null;

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

  // "reportoptions" field.
  List<String>? _reportoptions;
  List<String> get reportoptions => _reportoptions ?? const [];
  bool hasReportoptions() => _reportoptions != null;

  // "emailreportreciver" field.
  String? _emailreportreciver;
  String get emailreportreciver => _emailreportreciver ?? '';
  bool hasEmailreportreciver() => _emailreportreciver != null;

  // "senderPass" field.
  String? _senderPass;
  String get senderPass => _senderPass ?? '';
  bool hasSenderPass() => _senderPass != null;

  // "senderEmail" field.
  String? _senderEmail;
  String get senderEmail => _senderEmail ?? '';
  bool hasSenderEmail() => _senderEmail != null;

  // "search" field.
  String? _search;
  String get search => _search ?? '';
  bool hasSearch() => _search != null;

  // "showMapView" field.
  bool? _showMapView;
  bool get showMapView => _showMapView ?? false;
  bool hasShowMapView() => _showMapView != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _language = snapshotData['language'] as String?;
    _icon = snapshotData['icon'] as String?;
    _sortingorder = castToType<int>(snapshotData['sortingorder']);
    _tags = getDataList(snapshotData['tags']);
    _visibility = snapshotData['visibility'] as bool?;
    _pageview = castToType<int>(snapshotData['pageview']);
    _dd1 = snapshotData['dd1'] as String?;
    _dd2 = snapshotData['dd2'] as String?;
    _dd3 = snapshotData['dd3'] as String?;
    _dd4 = snapshotData['dd4'] as String?;
    _dd5 = snapshotData['dd5'] as String?;
    _dd6 = snapshotData['dd6'] as String?;
    _reportoptions = getDataList(snapshotData['reportoptions']);
    _emailreportreciver = snapshotData['emailreportreciver'] as String?;
    _senderPass = snapshotData['senderPass'] as String?;
    _senderEmail = snapshotData['senderEmail'] as String?;
    _search = snapshotData['search'] as String?;
    _showMapView = snapshotData['showMapView'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('category');

  static Stream<CategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryRecord.fromSnapshot(s));

  static Future<CategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryRecord.fromSnapshot(s));

  static CategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoryRecordData({
  String? name,
  String? language,
  String? icon,
  int? sortingorder,
  bool? visibility,
  int? pageview,
  String? dd1,
  String? dd2,
  String? dd3,
  String? dd4,
  String? dd5,
  String? dd6,
  String? emailreportreciver,
  String? senderPass,
  String? senderEmail,
  String? search,
  bool? showMapView,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'language': language,
      'icon': icon,
      'sortingorder': sortingorder,
      'visibility': visibility,
      'pageview': pageview,
      'dd1': dd1,
      'dd2': dd2,
      'dd3': dd3,
      'dd4': dd4,
      'dd5': dd5,
      'dd6': dd6,
      'emailreportreciver': emailreportreciver,
      'senderPass': senderPass,
      'senderEmail': senderEmail,
      'search': search,
      'showMapView': showMapView,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoryRecordDocumentEquality implements Equality<CategoryRecord> {
  const CategoryRecordDocumentEquality();

  @override
  bool equals(CategoryRecord? e1, CategoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.language == e2?.language &&
        e1?.icon == e2?.icon &&
        e1?.sortingorder == e2?.sortingorder &&
        listEquality.equals(e1?.tags, e2?.tags) &&
        e1?.visibility == e2?.visibility &&
        e1?.pageview == e2?.pageview &&
        e1?.dd1 == e2?.dd1 &&
        e1?.dd2 == e2?.dd2 &&
        e1?.dd3 == e2?.dd3 &&
        e1?.dd4 == e2?.dd4 &&
        e1?.dd5 == e2?.dd5 &&
        e1?.dd6 == e2?.dd6 &&
        listEquality.equals(e1?.reportoptions, e2?.reportoptions) &&
        e1?.emailreportreciver == e2?.emailreportreciver &&
        e1?.senderPass == e2?.senderPass &&
        e1?.senderEmail == e2?.senderEmail &&
        e1?.search == e2?.search &&
        e1?.showMapView == e2?.showMapView;
  }

  @override
  int hash(CategoryRecord? e) => const ListEquality().hash([
        e?.name,
        e?.language,
        e?.icon,
        e?.sortingorder,
        e?.tags,
        e?.visibility,
        e?.pageview,
        e?.dd1,
        e?.dd2,
        e?.dd3,
        e?.dd4,
        e?.dd5,
        e?.dd6,
        e?.reportoptions,
        e?.emailreportreciver,
        e?.senderPass,
        e?.senderEmail,
        e?.search,
        e?.showMapView
      ]);

  @override
  bool isValidKey(Object? o) => o is CategoryRecord;
}
