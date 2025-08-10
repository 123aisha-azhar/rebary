// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class VideoTitleStruct extends FFFirebaseStruct {
  VideoTitleStruct({
    String? title,
    String? video,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _video = video,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  set video(String? val) => _video = val;

  bool hasVideo() => _video != null;

  static VideoTitleStruct fromMap(Map<String, dynamic> data) =>
      VideoTitleStruct(
        title: data['title'] as String?,
        video: data['video'] as String?,
      );

  static VideoTitleStruct? maybeFromMap(dynamic data) => data is Map
      ? VideoTitleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'video': _video,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'video': serializeParam(
          _video,
          ParamType.String,
        ),
      }.withoutNulls;

  static VideoTitleStruct fromSerializableMap(Map<String, dynamic> data) =>
      VideoTitleStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        video: deserializeParam(
          data['video'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'VideoTitleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is VideoTitleStruct &&
        title == other.title &&
        video == other.video;
  }

  @override
  int get hashCode => const ListEquality().hash([title, video]);
}

VideoTitleStruct createVideoTitleStruct({
  String? title,
  String? video,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    VideoTitleStruct(
      title: title,
      video: video,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

VideoTitleStruct? updateVideoTitleStruct(
  VideoTitleStruct? videoTitle, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    videoTitle
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addVideoTitleStructData(
  Map<String, dynamic> firestoreData,
  VideoTitleStruct? videoTitle,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (videoTitle == null) {
    return;
  }
  if (videoTitle.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && videoTitle.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final videoTitleData = getVideoTitleFirestoreData(videoTitle, forFieldValue);
  final nestedData = videoTitleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = videoTitle.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getVideoTitleFirestoreData(
  VideoTitleStruct? videoTitle, [
  bool forFieldValue = false,
]) {
  if (videoTitle == null) {
    return {};
  }
  final firestoreData = mapToFirestore(videoTitle.toMap());

  // Add any Firestore field values
  videoTitle.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getVideoTitleListFirestoreData(
  List<VideoTitleStruct>? videoTitles,
) =>
    videoTitles?.map((e) => getVideoTitleFirestoreData(e, true)).toList() ?? [];
