import '/backend/backend.dart';
import '/components/background_widget.dart';
import '/components/drawer_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'drawer245_widget.dart' show Drawer245Widget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Drawer245Model extends FlutterFlowModel<Drawer245Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for background component.
  late BackgroundModel backgroundModel;
  // Model for header component.
  late HeaderModel headerModel;
  // Model for drawer component.
  late DrawerModel drawerModel;

  @override
  void initState(BuildContext context) {
    backgroundModel = createModel(context, () => BackgroundModel());
    headerModel = createModel(context, () => HeaderModel());
    drawerModel = createModel(context, () => DrawerModel());
  }

  @override
  void dispose() {
    backgroundModel.dispose();
    headerModel.dispose();
    drawerModel.dispose();
  }
}
