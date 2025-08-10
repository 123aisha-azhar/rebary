import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/background_widget.dart';
import '/components/drawer_widget.dart';
import '/components/header_widget.dart';
import '/components/list_loading_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'list_view_widget.dart' show ListViewWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ListViewModel extends FlutterFlowModel<ListViewWidget> {
  ///  Local state fields for this page.

  bool showfullList = true;

  List<ServicesRecord> list = [];
  void addToList(ServicesRecord item) => list.add(item);
  void removeFromList(ServicesRecord item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, ServicesRecord item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(ServicesRecord) updateFn) =>
      list[index] = updateFn(list[index]);

  List<ServicesRecord> showList = [];
  void addToShowList(ServicesRecord item) => showList.add(item);
  void removeFromShowList(ServicesRecord item) => showList.remove(item);
  void removeAtIndexFromShowList(int index) => showList.removeAt(index);
  void insertAtIndexInShowList(int index, ServicesRecord item) =>
      showList.insert(index, item);
  void updateShowListAtIndex(int index, Function(ServicesRecord) updateFn) =>
      showList[index] = updateFn(showList[index]);

  int listCount = 2;

  bool containerBool = true;

  bool isMap = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in listView widget.
  List<ServicesRecord>? fulldatalist;
  // Stores action output result for [Firestore Query - Query a collection] action in listView widget.
  int? searchcount;
  // Stores action output result for [Firestore Query - Query a collection] action in listView widget.
  int? dd1Count;
  // Model for background component.
  late BackgroundModel backgroundModel;
  // Model for header component.
  late HeaderModel headerModel;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<ServicesRecord>? city;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  int? dd2Count;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<ServicesRecord>? title;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  int? dd3Count;
  // State field(s) for DropDown widget.
  String? dropDownValue3;
  FormFieldController<String>? dropDownValueController3;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  int? dd4Count;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<ServicesRecord>? dd3;
  // State field(s) for DropDown widget.
  String? dropDownValue4;
  FormFieldController<String>? dropDownValueController4;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<ServicesRecord>? dd4;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  int? dd5Count;
  // State field(s) for DropDown widget.
  String? dropDownValue5;
  FormFieldController<String>? dropDownValueController5;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<ServicesRecord>? dd5;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  int? dd6Count;
  // State field(s) for DropDown widget.
  String? dropDownValue6;
  FormFieldController<String>? dropDownValueController6;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<ServicesRecord>? dd6;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  ServicesRecord? ref;
  // Model for listLoading component.
  late ListLoadingModel listLoadingModel;
  // Model for drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    backgroundModel = createModel(context, () => BackgroundModel());
    headerModel = createModel(context, () => HeaderModel());
    listLoadingModel = createModel(context, () => ListLoadingModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    backgroundModel.dispose();
    headerModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    listLoadingModel.dispose();
    drawerModel.dispose();
  }
}
