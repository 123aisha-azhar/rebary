import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/background_widget.dart';
import '/components/list_loading_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'donations_widget.dart' show DonationsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DonationsModel extends FlutterFlowModel<DonationsWidget> {
  ///  Local state fields for this page.

  bool conntainer = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in donations widget.
  List<BankDetailsRecord>? bankdata;
  // Model for background component.
  late BackgroundModel backgroundModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  BankDetailsRecord? singleBankdata;
  // Model for listLoading component.
  late ListLoadingModel listLoadingModel;

  @override
  void initState(BuildContext context) {
    backgroundModel = createModel(context, () => BackgroundModel());
    listLoadingModel = createModel(context, () => ListLoadingModel());
  }

  @override
  void dispose() {
    backgroundModel.dispose();
    listLoadingModel.dispose();
  }
}
