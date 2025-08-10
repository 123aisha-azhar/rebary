import '/backend/backend.dart';
import '/components/background_widget.dart';
import '/components/drawer_widget.dart';
import '/components/header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'drawer245_model.dart';
export 'drawer245_model.dart';

class Drawer245Widget extends StatefulWidget {
  const Drawer245Widget({
    super.key,
    int? index,
  }) : this.index = index ?? 2;

  final int index;

  static String routeName = 'drawer2-4-5';
  static String routePath = '/drawer245';

  @override
  State<Drawer245Widget> createState() => _Drawer245WidgetState();
}

class _Drawer245WidgetState extends State<Drawer245Widget> {
  late Drawer245Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Drawer245Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'drawer2-4-5'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF3767EC),
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.drawerModel,
            updateCallback: () => safeSetState(() {}),
            child: DrawerWidget(
              closeDrawer: () async {
                logFirebaseEvent('DRAWER2_4_5_Container_nfqwte04_CALLBACK');
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
            StreamBuilder<List<DrawerDataRecord>>(
              stream: queryDrawerDataRecord(
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<DrawerDataRecord> columnDrawerDataRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                final columnDrawerDataRecord =
                    columnDrawerDataRecordList.isNotEmpty
                        ? columnDrawerDataRecordList.first
                        : null;

                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.headerModel,
                        updateCallback: () => safeSetState(() {}),
                        child: HeaderWidget(
                          drawerAction: () async {
                            logFirebaseEvent(
                                'DRAWER2_4_5_Container_mjtxed6y_CALLBACK');
                            logFirebaseEvent('header_drawer');
                            scaffoldKey.currentState!.openDrawer();
                          },
                        ),
                      ),
                      if (widget!.index == 2)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 16.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              columnDrawerDataRecord?.text1,
                              'تکایه خۆتۆمارکردن تنها بۆ خاوەن دەستی کاره (وەستا + کۆمپانیا + دکتۆر + مامۆستا و هتا دوایی) بۆ خۆتۆمارکردن تکایه نەم زانیاریانه‌ی خواروه بنیره بۆ واتساپ',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF042072),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w800,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                  shadows: [
                                    Shadow(
                                      color: Color(0xFFA9A9A9),
                                      offset: Offset(1.0, 1.0),
                                      blurRadius: 5.0,
                                    )
                                  ],
                                  lineHeight: 2.0,
                                ),
                          ),
                        ),
                      if (widget!.index == 2)
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                columnDrawerDataRecord?.text2,
                                'ناو پیشە شار ژمارەی مۆبایل ناونیشان (گەرهێنت) قابەدەر (گەرهێنت) بەینی فەیسبووک (گەرهێنت) ئینستاگرام (گەرهێنت) لۆکەیشن (گەرهێنت) سناپ چات (گەرهێنت) تیک توک (گەرهێنت)',
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF042072),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    shadows: [
                                      Shadow(
                                        color: Color(0xFFA9A9A9),
                                        offset: Offset(1.0, 1.0),
                                        blurRadius: 5.0,
                                      )
                                    ],
                                    lineHeight: 2.0,
                                  ),
                            ),
                          ),
                        ),
                      if (widget!.index == 4)
                        Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                columnDrawerDataRecord?.text3,
                                'بەرنامەی رێبدەری بۆ ئاسانکردنی ژیان دروستکراوە، ئامانجی ئەم بەرنامە خزمەتکردنی بەکارھێنەرانه و بارمەتیانە بۆ دۆزینەوەی ھەر کەسێک کە پێویستە نەگەڕ هر سکالایەکەان ھیە لەسەر ھەر سەبیسکەرایەک لەناو فایلیك پێشکەشدە، تکایە لە ریگای واتس ئەمە بکەوە بێنەوە، بەپەیوەندی بکەن شێنبێی كە بۆ بەشداری بەرنامەی رێبدەری تکەر ژیانتر ئەمەی سکالامان دەست بكەوێت لەدەسەر ھەر بەشداریبەیەك لەناو تیمی بەرنامەی پێیەی لیكۆلینەوە لە بەرنامە بكەین و ڕێوشوێن بگەیەنێن، تكەر تیمەكەمان بەرێزدا ھەبێت بەشداریبەکەت پەسندكراوە، تواو بە تاوەری پەردی بەشداریبەوە کە دەگەڕێنەوە',
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w800,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF042072),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w800,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    shadows: [
                                      Shadow(
                                        color: Color(0xFFA9A9A9),
                                        offset: Offset(1.0, 1.0),
                                        blurRadius: 5.0,
                                      )
                                    ],
                                    lineHeight: 2.0,
                                  ),
                            ),
                          ),
                        ),
                      if (widget!.index == 5)
                        Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 0.0),
                            child: Text(
                              valueOrDefault<String>(
                                columnDrawerDataRecord?.text4,
                                'رێبدەری کوردستان دروستکراوە لە ساڵی 2022 بۆ خزمەتکردن و کارئاسانکردن لەکاتی بونی هەر کێشەیەک تکایە پەیوەندی بکە بە',
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF042072),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                    shadows: [
                                      Shadow(
                                        color: Color(0xFFA9A9A9),
                                        offset: Offset(1.0, 1.0),
                                        blurRadius: 5.0,
                                      )
                                    ],
                                    lineHeight: 2.0,
                                  ),
                            ),
                          ),
                        ),
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 16.0, 0.0, 0.0),
                          child: StreamBuilder<List<DrawerDataRecord>>(
                            stream: queryDrawerDataRecord(
                              queryBuilder: (drawerDataRecord) =>
                                  drawerDataRecord.where(
                                'whatsAppUrl',
                                isNotEqualTo: '',
                              ),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        FlutterFlowTheme.of(context).primary,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<DrawerDataRecord> imageDrawerDataRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final imageDrawerDataRecord =
                                  imageDrawerDataRecordList.isNotEmpty
                                      ? imageDrawerDataRecordList.first
                                      : null;

                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'DRAWER2_4_5_PAGE_Image_cf74gael_ON_TAP');
                                  logFirebaseEvent('Image_launch_u_r_l');
                                  await launchURL(
                                      imageDrawerDataRecord!.whatsAppUrl);
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/Group_13.png',
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      if (widget!.index == 2)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 20.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent('DRAWER2_4_5_PAGE__BTN_ON_TAP');
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(Drawer6Widget.routeName);
                            },
                            text: FFLocalizations.of(context).getText(
                              'lfs3z48h' /* ڕێنماییەکان */,
                            ),
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFF042072),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                    ].addToEnd(SizedBox(height: 10.0)),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
