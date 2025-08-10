// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ImageTitleStruct extends FFFirebaseStruct {
  ImageTitleStruct({
    String? title,
    String? image,
    String? url,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _image = image,
        _url = url,
        super(firestoreUtilData);

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  static ImageTitleStruct fromMap(Map<String, dynamic> data) =>
      ImageTitleStruct(
        title: data['Title'] as String?,
        image: data['image'] as String?,
        url: data['url'] as String?,
      );

  static ImageTitleStruct? maybeFromMap(dynamic data) => data is Map
      ? ImageTitleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Title': _title,
        'image': _image,
        'url': _url,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Title': serializeParam(
          _title,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
      }.withoutNulls;

  static ImageTitleStruct fromSerializableMap(Map<String, dynamic> data) =>
      ImageTitleStruct(
        title: deserializeParam(
          data['Title'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ImageTitleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ImageTitleStruct &&
        title == other.title &&
        image == other.image &&
        url == other.url;
  }

  @override
  int get hashCode => const ListEquality().hash([title, image, url]);
}

ImageTitleStruct createImageTitleStruct({
  String? title,
  String? image,
  String? url,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ImageTitleStruct(
      title: title,
      image: image,
      url: url,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ImageTitleStruct? updateImageTitleStruct(
  ImageTitleStruct? imageTitle, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    imageTitle
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addImageTitleStructData(
  Map<String, dynamic> firestoreData,
  ImageTitleStruct? imageTitle,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (imageTitle == null) {
    return;
  }
  if (imageTitle.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && imageTitle.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final imageTitleData = getImageTitleFirestoreData(imageTitle, forFieldValue);
  final nestedData = imageTitleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = imageTitle.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getImageTitleFirestoreData(
  ImageTitleStruct? imageTitle, [
  bool forFieldValue = false,
]) {
  if (imageTitle == null) {
    return {};
  }
  final firestoreData = mapToFirestore(imageTitle.toMap());

  // Add any Firestore field values
  imageTitle.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getImageTitleListFirestoreData(
  List<ImageTitleStruct>? imageTitles,
) =>
    imageTitles?.map((e) => getImageTitleFirestoreData(e, true)).toList() ?? [];
