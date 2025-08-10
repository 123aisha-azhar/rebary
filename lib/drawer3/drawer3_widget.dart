import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/background_widget.dart';
import '/components/drawer_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drawer3_model.dart';
export 'drawer3_model.dart';

class Drawer3Widget extends StatefulWidget {
  const Drawer3Widget({super.key});

  static String routeName = 'drawer3';
  static String routePath = '/drawer3';

  @override
  State<Drawer3Widget> createState() => _Drawer3WidgetState();
}

class _Drawer3WidgetState extends State<Drawer3Widget> {
  late Drawer3Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Drawer3Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'drawer3'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DrawerDataRecord>>(
      stream: queryDrawerDataRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<DrawerDataRecord> drawer3DrawerDataRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final drawer3DrawerDataRecord = drawer3DrawerDataRecordList.isNotEmpty
            ? drawer3DrawerDataRecordList.first
            : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            drawer: Drawer(
              elevation: 16.0,
              child: wrapWithModel(
                model: _model.drawerModel,
                updateCallback: () => safeSetState(() {}),
                child: DrawerWidget(
                  closeDrawer: () async {
                    logFirebaseEvent(
                        'DRAWER3_PAGE_Container_gms09gmg_CALLBACK');
                    logFirebaseEvent('drawer_drawer');
                    if (scaffoldKey.currentState!.isDrawerOpen ||
                        scaffoldKey.currentState!.isEndDrawerOpen) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ),
            ),
            body: Stack(
              children: [
                wrapWithModel(
                  model: _model.backgroundModel,
                  updateCallback: () => safeSetState(() {}),
                  child: BackgroundWidget(),
                ),
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderWidget(
                          drawerAction: () async {
                            logFirebaseEvent(
                                'DRAWER3_PAGE_Container_jxzw72ov_CALLBACK');
                            logFirebaseEvent('header_drawer');
                            scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          final imageData =
                              drawer3DrawerDataRecord?.contributors?.toList() ??
                                  [];

                          return ListView.builder(
                            padding: EdgeInsets.fromLTRB(
                              0,
                              0,
                              0,
                              15.0,
                            ),
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: imageData.length,
                            itemBuilder: (context, imageDataIndex) {
                              final imageDataItem = imageData[imageDataIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'DRAWER3_PAGE_CircleImage_y88spjv0_ON_TAP');
                                      logFirebaseEvent(
                                          'CircleImage_launch_u_r_l');
                                      await launchURL(imageDataItem.url);
                                    },
                                    child: Container(
                                      width: 200.0,
                                      height: 200.0,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      child: Image.network(
                                        valueOrDefault<String>(
                                          imageDataItem.image,
                                          'https://picsum.photos/seed/673/600',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Text(
                                      imageDataItem.title,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w800,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF042072),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ].addToEnd(SizedBox(height: 15.0)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
