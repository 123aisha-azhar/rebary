import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/background_widget.dart';
import '/components/drawer_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drawer6_model.dart';
export 'drawer6_model.dart';

class Drawer6Widget extends StatefulWidget {
  const Drawer6Widget({super.key});

  static String routeName = 'drawer6';
  static String routePath = '/drawer6';

  @override
  State<Drawer6Widget> createState() => _Drawer6WidgetState();
}

class _Drawer6WidgetState extends State<Drawer6Widget> {
  late Drawer6Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Drawer6Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'drawer6'});
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
        List<DrawerDataRecord> drawer6DrawerDataRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final drawer6DrawerDataRecord = drawer6DrawerDataRecordList.isNotEmpty
            ? drawer6DrawerDataRecordList.first
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
                        'DRAWER6_PAGE_Container_v2lz7436_CALLBACK');
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
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        wrapWithModel(
                          model: _model.headerModel,
                          updateCallback: () => safeSetState(() {}),
                          child: HeaderWidget(
                            drawerAction: () async {
                              logFirebaseEvent(
                                  'DRAWER6_PAGE_Container_een48bn1_CALLBACK');
                              logFirebaseEvent('header_drawer');
                              scaffoldKey.currentState!.openDrawer();
                            },
                          ),
                        ),
                        Builder(
                          builder: (context) {
                            final videoData = drawer6DrawerDataRecord
                                    ?.guideVideos
                                    ?.toList() ??
                                [];

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: videoData.length,
                              itemBuilder: (context, videoDataIndex) {
                                final videoDataItem = videoData[videoDataIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 12.0),
                                        child: Text(
                                          videoDataItem.title,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w800,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
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
                                      FlutterFlowVideoPlayer(
                                        path: valueOrDefault<String>(
                                          videoDataItem.video,
                                          'https://assets.mixkit.co/videos/preview/mixkit-forest-stream-in-the-sunlight-529-large.mp4',
                                        ),
                                        videoType: VideoType.network,
                                        width: 340.0,
                                        height: 500.0,
                                        autoPlay: false,
                                        looping: true,
                                        showControls: true,
                                        allowFullScreen: true,
                                        allowPlaybackSpeedMenu: true,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ].addToEnd(SizedBox(height: 25.0)),
                    ),
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
