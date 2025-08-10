import '/backend/backend.dart';
import '/components/background_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'user_block_widget.dart' show UserBlockWidget;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserBlockModel extends FlutterFlowModel<UserBlockWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for background component.
  late BackgroundModel backgroundModel;
  // Model for header component.
  late HeaderModel headerModel;

  @override
  void initState(BuildContext context) {
    backgroundModel = createModel(context, () => BackgroundModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    backgroundModel.dispose();
    headerModel.dispose();
  }
}
