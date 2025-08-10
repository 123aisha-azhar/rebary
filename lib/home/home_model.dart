import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/background_widget.dart';
import '/components/drawer_widget.dart';
import '/components/list_loading_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  Local state fields for this page.

  bool fulllist = true;

  String choiceData = 'null';

  String pageLanguage = 'kurdish';

  bool search = false;

  List<CategoryRecord> searchList = [];
  void addToSearchList(CategoryRecord item) => searchList.add(item);
  void removeFromSearchList(CategoryRecord item) => searchList.remove(item);
  void removeAtIndexFromSearchList(int index) => searchList.removeAt(index);
  void insertAtIndexInSearchList(int index, CategoryRecord item) =>
      searchList.insert(index, item);
  void updateSearchListAtIndex(int index, Function(CategoryRecord) updateFn) =>
      searchList[index] = updateFn(searchList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in home widget.
  List<CategoryRecord>? fullData;
  // Stores action output result for [Firestore Query - Query a collection] action in home widget.
  List<TagsRecord>? tags;
  // Model for background component.
  late BackgroundModel backgroundModel;
  // State field(s) for choiceLanguage widget.
  FormFieldController<List<String>>? choiceLanguageValueController;
  String? get choiceLanguageValue =>
      choiceLanguageValueController?.value?.firstOrNull;
  set choiceLanguageValue(String? val) =>
      choiceLanguageValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Firestore Query - Query a collection] action in choiceLanguage widget.
  List<CategoryRecord>? languageData;
  // State field(s) for tags widget.
  FormFieldController<List<String>>? tagsValueController;
  String? get tagsValue => tagsValueController?.value?.firstOrNull;
  set tagsValue(String? val) =>
      tagsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Firestore Query - Query a collection] action in tags widget.
  List<CategoryRecord>? tagData;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Model for listLoading component.
  late ListLoadingModel listLoadingModel;
  // Model for drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    backgroundModel = createModel(context, () => BackgroundModel());
    listLoadingModel = createModel(context, () => ListLoadingModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    backgroundModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listLoadingModel.dispose();
    drawerModel.dispose();
  }
}
