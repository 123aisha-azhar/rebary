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
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_view_model.dart';
export 'list_view_model.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({
    super.key,
    this.categoryref,
    required this.isShow,
  });

  final DocumentReference? categoryref;
  final bool? isShow;

  static String routeName = 'listView';
  static String routePath = '/listView';

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  late ListViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListViewModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'listView'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('LIST_VIEW_PAGE_listView_ON_INIT_STATE');
      logFirebaseEvent('listView_update_page_state');
      _model.containerBool = true;
      safeSetState(() {});
      logFirebaseEvent('listView_firestore_query');
      _model.fulldatalist = await queryServicesRecordOnce(
        queryBuilder: (servicesRecord) => servicesRecord
            .where(
              'visibility',
              isEqualTo: true,
            )
            .where(
              'categoryref',
              isEqualTo: widget!.categoryref,
            ),
      );
      logFirebaseEvent('listView_update_app_state');
      FFAppState().show = false;
      safeSetState(() {});
      logFirebaseEvent('listView_firestore_query');
      _model.searchcount = await queryServicesRecordCount(
        queryBuilder: (servicesRecord) => servicesRecord
            .where(
              'visibility',
              isEqualTo: true,
            )
            .where(
              'search',
              isNotEqualTo: '',
            )
            .where(
              'categoryref',
              isEqualTo: widget!.categoryref,
            ),
      );
      if (_model.searchcount! > 0) {
        logFirebaseEvent('listView_update_app_state');
        FFAppState().search = true;
        safeSetState(() {});
      } else {
        logFirebaseEvent('listView_update_app_state');
        FFAppState().search = false;
        safeSetState(() {});
      }

      logFirebaseEvent('listView_update_page_state');
      _model.list = functions
          .shuffleList(_model.fulldatalist?.toList(), FFAppState().isShuffle)!
          .toList()
          .cast<ServicesRecord>();
      _model.showfullList = true;
      safeSetState(() {});
      logFirebaseEvent('listView_update_page_state');
      _model.showList =
          _model.list.take(12).toList().toList().cast<ServicesRecord>();
      safeSetState(() {});
      logFirebaseEvent('listView_update_page_state');
      _model.containerBool = false;
      safeSetState(() {});
      logFirebaseEvent('listView_firestore_query');
      _model.dd1Count = await queryServicesRecordCount(
        queryBuilder: (servicesRecord) => servicesRecord
            .where(
              'visibility',
              isEqualTo: true,
            )
            .where(
              'city',
              isNotEqualTo: '',
            )
            .where(
              'categoryref',
              isEqualTo: widget!.categoryref,
            ),
      );
      if (_model.dd1Count! > 0) {
        logFirebaseEvent('listView_update_app_state');
        FFAppState().dd1 = true;
        safeSetState(() {});
      } else {
        logFirebaseEvent('listView_update_app_state');
        FFAppState().dd1 = false;
        safeSetState(() {});
      }
    });

    getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0), cached: true)
        .then((loc) => safeSetState(() => currentUserLocationValue = loc));
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();
    if (currentUserLocationValue == null) {
      return Container(
        color: FlutterFlowTheme.of(context).primaryBackground,
        child: Center(
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
                logFirebaseEvent('LIST_VIEW_Container_9588z47v_CALLBACK');
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
                  if (!_model.containerBool)
                    wrapWithModel(
                      model: _model.headerModel,
                      updateCallback: () => safeSetState(() {}),
                      child: HeaderWidget(
                        isShow: true,
                        count: _model.showfullList
                            ? (_model.list.isNotEmpty
                                ? functions.countServicesView(
                                    _model.list.map((e) => e.pageview).toList())
                                : 0)
                            : (_model.showList.isNotEmpty
                                ? functions.countServicesView(_model.showList
                                    .map((e) => e.pageview)
                                    .toList())
                                : 0),
                        drawerAction: () async {
                          logFirebaseEvent(
                              'LIST_VIEW_Container_n9nqa4gc_CALLBACK');
                          logFirebaseEvent('header_drawer');
                          scaffoldKey.currentState!.openDrawer();
                        },
                      ),
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                    child: StreamBuilder<CategoryRecord>(
                      stream: CategoryRecord.getDocument(widget!.categoryref!),
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

                        final rowCategoryRecord = snapshot.data!;

                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  5.0, 12.0, 5.0, 0.0),
                              child: Wrap(
                                spacing: 5.0,
                                runSpacing: 5.0,
                                alignment: WrapAlignment.spaceEvenly,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.vertical,
                                runAlignment: WrapAlignment.spaceEvenly,
                                verticalDirection: VerticalDirection.down,
                                clipBehavior: Clip.antiAlias,
                                children: [
                                  if (FFAppState().dd1)
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child:
                                          StreamBuilder<List<ServicesRecord>>(
                                        stream: queryServicesRecord(
                                          queryBuilder: (servicesRecord) =>
                                              servicesRecord
                                                  .where(
                                                    'visibility',
                                                    isEqualTo: true,
                                                  )
                                                  .where(
                                                    'categoryref',
                                                    isEqualTo:
                                                        widget!.categoryref,
                                                  ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ServicesRecord>
                                              dropDownServicesRecordList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController1 ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: functions.uniqueList(
                                                dropDownServicesRecordList
                                                    .map((e) => e.city)
                                                    .toList())!,
                                            onChanged: (val) async {
                                              safeSetState(() =>
                                                  _model.dropDownValue1 = val);
                                              logFirebaseEvent(
                                                  'LIST_VIEW_DropDown_77j8tiy8_ON_FORM_WIDG');
                                              logFirebaseEvent(
                                                  'DropDown_clear_text_fields_pin_codes');
                                              safeSetState(() {
                                                _model.textController?.clear();
                                              });
                                              logFirebaseEvent(
                                                  'DropDown_reset_form_fields');
                                              safeSetState(() {
                                                _model.dropDownValueController2
                                                    ?.reset();
                                                _model.dropDownValueController3
                                                    ?.reset();
                                                _model.dropDownValueController4
                                                    ?.reset();
                                                _model.dropDownValueController5
                                                    ?.reset();
                                                _model.dropDownValueController6
                                                    ?.reset();
                                              });
                                              logFirebaseEvent(
                                                  'DropDown_update_app_state');
                                              FFAppState().isShuffle = true;
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'DropDown_firestore_query');
                                              _model.city =
                                                  await queryServicesRecordOnce(
                                                queryBuilder:
                                                    (servicesRecord) =>
                                                        servicesRecord
                                                            .where(
                                                              'visibility',
                                                              isEqualTo: true,
                                                            )
                                                            .where(
                                                              'categoryref',
                                                              isEqualTo: widget!
                                                                  .categoryref,
                                                            )
                                                            .where(
                                                              'city',
                                                              isEqualTo: _model
                                                                  .dropDownValue1,
                                                            ),
                                              );
                                              logFirebaseEvent(
                                                  'DropDown_update_page_state');
                                              _model.showfullList = false;
                                              _model.listCount = 2;
                                              _model.showList = functions
                                                  .shuffleList(
                                                      _model.city?.toList(),
                                                      FFAppState().isShuffle)!
                                                  .toList()
                                                  .cast<ServicesRecord>();
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'DropDown_firestore_query');
                                              _model.dd2Count =
                                                  await queryServicesRecordCount(
                                                queryBuilder:
                                                    (servicesRecord) =>
                                                        servicesRecord
                                                            .where(
                                                              'visibility',
                                                              isEqualTo: true,
                                                            )
                                                            .where(
                                                              'city',
                                                              isEqualTo: _model
                                                                  .dropDownValue1,
                                                            )
                                                            .where(
                                                              'categoryref',
                                                              isEqualTo: widget!
                                                                  .categoryref,
                                                            )
                                                            .where(
                                                              'title',
                                                              isNotEqualTo: '',
                                                            ),
                                              );
                                              if (_model.dd2Count! > 0) {
                                                logFirebaseEvent(
                                                    'DropDown_update_app_state');
                                                FFAppState().dd2 = true;
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'DropDown_update_app_state');
                                                FFAppState().dd2 = false;
                                                safeSetState(() {});
                                              }

                                              safeSetState(() {});
                                            },
                                            width: 300.0,
                                            height: 29.0,
                                            maxHeight: 300.0,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            hintText: rowCategoryRecord.dd1,
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Color(0xFF57636C),
                                              size: 22.0,
                                            ),
                                            fillColor: Colors.white,
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 10.0, 0.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  if ((_model.dropDownValue1 != null &&
                                          _model.dropDownValue1 != '') &&
                                      FFAppState().dd2)
                                    StreamBuilder<List<ServicesRecord>>(
                                      stream: queryServicesRecord(
                                        queryBuilder: (servicesRecord) =>
                                            servicesRecord
                                                .where(
                                                  'visibility',
                                                  isEqualTo: true,
                                                )
                                                .where(
                                                  'categoryref',
                                                  isEqualTo:
                                                      widget!.categoryref,
                                                )
                                                .where(
                                                  'city',
                                                  isEqualTo:
                                                      _model.dropDownValue1,
                                                ),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<ServicesRecord>
                                            dropDownServicesRecordList =
                                            snapshot.data!;

                                        return FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController2 ??=
                                              FormFieldController<String>(null),
                                          options: functions.uniqueList(
                                              dropDownServicesRecordList
                                                  .map((e) => e.title)
                                                  .toList())!,
                                          onChanged: (val) async {
                                            safeSetState(() =>
                                                _model.dropDownValue2 = val);
                                            logFirebaseEvent(
                                                'LIST_VIEW_DropDown_ohd6ldms_ON_FORM_WIDG');
                                            logFirebaseEvent(
                                                'DropDown_reset_form_fields');
                                            safeSetState(() {
                                              _model.dropDownValueController3
                                                  ?.reset();
                                              _model.dropDownValueController4
                                                  ?.reset();
                                              _model.dropDownValueController5
                                                  ?.reset();
                                              _model.dropDownValueController6
                                                  ?.reset();
                                            });
                                            logFirebaseEvent(
                                                'DropDown_firestore_query');
                                            _model.title =
                                                await queryServicesRecordOnce(
                                              queryBuilder: (servicesRecord) =>
                                                  servicesRecord
                                                      .where(
                                                        'visibility',
                                                        isEqualTo: true,
                                                      )
                                                      .where(
                                                        'categoryref',
                                                        isEqualTo:
                                                            widget!.categoryref,
                                                      )
                                                      .where(
                                                        'city',
                                                        isEqualTo: _model
                                                            .dropDownValue1,
                                                      )
                                                      .where(
                                                        'title',
                                                        isEqualTo: _model
                                                            .dropDownValue2,
                                                      ),
                                            );
                                            logFirebaseEvent(
                                                'DropDown_update_page_state');
                                            _model.showList = functions
                                                .shuffleList(
                                                    _model.title?.toList(),
                                                    FFAppState().isShuffle)!
                                                .toList()
                                                .cast<ServicesRecord>();
                                            safeSetState(() {});
                                            logFirebaseEvent(
                                                'DropDown_firestore_query');
                                            _model.dd3Count =
                                                await queryServicesRecordCount(
                                              queryBuilder: (servicesRecord) =>
                                                  servicesRecord
                                                      .where(
                                                        'visibility',
                                                        isEqualTo: true,
                                                      )
                                                      .where(
                                                        'city',
                                                        isEqualTo: _model
                                                            .dropDownValue1,
                                                      )
                                                      .where(
                                                        'categoryref',
                                                        isEqualTo:
                                                            widget!.categoryref,
                                                      )
                                                      .where(
                                                        'title',
                                                        isEqualTo: _model
                                                            .dropDownValue2,
                                                      )
                                                      .where(
                                                        'dd3',
                                                        isNotEqualTo: '',
                                                      ),
                                            );
                                            if (_model.dd3Count! > 0) {
                                              logFirebaseEvent(
                                                  'DropDown_update_app_state');
                                              FFAppState().ddr3 = true;
                                              safeSetState(() {});
                                            } else {
                                              logFirebaseEvent(
                                                  'DropDown_update_app_state');
                                              FFAppState().ddr3 = false;
                                              safeSetState(() {});
                                            }

                                            safeSetState(() {});
                                          },
                                          width: 300.0,
                                          height: 29.0,
                                          maxHeight: 300.0,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.roboto(
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color: Colors.black,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                          hintText: rowCategoryRecord.dd2,
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Color(0xFF57636C),
                                            size: 22.0,
                                          ),
                                          fillColor: Colors.white,
                                          elevation: 2.0,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12.0, 0.0, 12.0, 0.0),
                                          hidesUnderline: true,
                                          disabled:
                                              _model.dropDownValue1 == null ||
                                                  _model.dropDownValue1 == '',
                                          isOverButton: false,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        );
                                      },
                                    ),
                                  if ((_model.dropDownValue2 != null &&
                                          _model.dropDownValue2 != '') &&
                                      FFAppState().ddr3)
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child:
                                          StreamBuilder<List<ServicesRecord>>(
                                        stream: queryServicesRecord(
                                          queryBuilder: (servicesRecord) =>
                                              servicesRecord
                                                  .where(
                                                    'visibility',
                                                    isEqualTo: true,
                                                  )
                                                  .where(
                                                    'categoryref',
                                                    isEqualTo:
                                                        widget!.categoryref,
                                                  )
                                                  .where(
                                                    'title',
                                                    isEqualTo:
                                                        _model.dropDownValue2 !=
                                                                ''
                                                            ? _model
                                                                .dropDownValue2
                                                            : null,
                                                  )
                                                  .where(
                                                    'city',
                                                    isEqualTo:
                                                        _model.dropDownValue1 !=
                                                                ''
                                                            ? _model
                                                                .dropDownValue1
                                                            : null,
                                                  ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ServicesRecord>
                                              dropDownServicesRecordList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController3 ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: functions.uniqueList(
                                                dropDownServicesRecordList
                                                    .map((e) => e.dd3)
                                                    .toList())!,
                                            onChanged: (val) async {
                                              safeSetState(() =>
                                                  _model.dropDownValue3 = val);
                                              logFirebaseEvent(
                                                  'LIST_VIEW_DropDown_scn9xp3p_ON_FORM_WIDG');
                                              logFirebaseEvent(
                                                  'DropDown_reset_form_fields');
                                              safeSetState(() {
                                                _model.dropDownValueController4
                                                    ?.reset();
                                                _model.dropDownValueController5
                                                    ?.reset();
                                                _model.dropDownValueController6
                                                    ?.reset();
                                              });
                                              logFirebaseEvent(
                                                  'DropDown_firestore_query');
                                              _model.dd4Count =
                                                  await queryServicesRecordCount(
                                                queryBuilder:
                                                    (servicesRecord) =>
                                                        servicesRecord
                                                            .where(
                                                              'visibility',
                                                              isEqualTo: true,
                                                            )
                                                            .where(
                                                              'city',
                                                              isEqualTo: _model
                                                                  .dropDownValue1,
                                                            )
                                                            .where(
                                                              'categoryref',
                                                              isEqualTo: widget!
                                                                  .categoryref,
                                                            )
                                                            .where(
                                                              'title',
                                                              isEqualTo: _model
                                                                  .dropDownValue2,
                                                            )
                                                            .where(
                                                              'dd3',
                                                              isEqualTo: _model
                                                                  .dropDownValue3,
                                                            )
                                                            .where(
                                                              'dd4',
                                                              isNotEqualTo: '',
                                                            ),
                                              );
                                              if (_model.dd4Count! > 0) {
                                                logFirebaseEvent(
                                                    'DropDown_update_app_state');
                                                FFAppState().dd4 = true;
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'DropDown_update_app_state');
                                                FFAppState().dd4 = false;
                                                safeSetState(() {});
                                              }

                                              logFirebaseEvent(
                                                  'DropDown_firestore_query');
                                              _model.dd3 =
                                                  await queryServicesRecordOnce(
                                                queryBuilder:
                                                    (servicesRecord) =>
                                                        servicesRecord
                                                            .where(
                                                              'visibility',
                                                              isEqualTo: true,
                                                            )
                                                            .where(
                                                              'categoryref',
                                                              isEqualTo: widget!
                                                                  .categoryref,
                                                            )
                                                            .where(
                                                              'city',
                                                              isEqualTo: _model
                                                                  .dropDownValue1,
                                                            )
                                                            .where(
                                                              'title',
                                                              isEqualTo: _model
                                                                  .dropDownValue2,
                                                            )
                                                            .where(
                                                              'dd3',
                                                              isEqualTo: _model
                                                                  .dropDownValue3,
                                                            ),
                                              );
                                              logFirebaseEvent(
                                                  'DropDown_update_page_state');
                                              _model.showList = functions
                                                  .shuffleList(
                                                      _model.dd3?.toList(),
                                                      FFAppState().isShuffle)!
                                                  .toList()
                                                  .cast<ServicesRecord>();
                                              safeSetState(() {});

                                              safeSetState(() {});
                                            },
                                            width: 300.0,
                                            height: 29.0,
                                            maxHeight: 300.0,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            hintText: rowCategoryRecord.dd3,
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Color(0xFF57636C),
                                              size: 22.0,
                                            ),
                                            fillColor: Colors.white,
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            disabled: (_model.dropDownValue2 ==
                                                        null ||
                                                    _model.dropDownValue2 ==
                                                        '') &&
                                                (functions
                                                        .uniqueList(
                                                            dropDownServicesRecordList
                                                                .map((e) =>
                                                                    e.dd3)
                                                                .toList())!
                                                        .length >
                                                    0),
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  if ((_model.dropDownValue3 != null &&
                                          _model.dropDownValue3 != '') &&
                                      FFAppState().dd4)
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child:
                                          StreamBuilder<List<ServicesRecord>>(
                                        stream: queryServicesRecord(
                                          queryBuilder: (servicesRecord) =>
                                              servicesRecord
                                                  .where(
                                                    'visibility',
                                                    isEqualTo: true,
                                                  )
                                                  .where(
                                                    'categoryref',
                                                    isEqualTo:
                                                        widget!.categoryref,
                                                  )
                                                  .where(
                                                    'title',
                                                    isEqualTo:
                                                        _model.dropDownValue2,
                                                  )
                                                  .where(
                                                    'city',
                                                    isEqualTo:
                                                        _model.dropDownValue1,
                                                  )
                                                  .where(
                                                    'dd3',
                                                    isEqualTo:
                                                        _model.dropDownValue3,
                                                  ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ServicesRecord>
                                              dropDownServicesRecordList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController4 ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: functions.uniqueList(
                                                dropDownServicesRecordList
                                                    .map((e) => e.dd4)
                                                    .toList())!,
                                            onChanged: (val) async {
                                              safeSetState(() =>
                                                  _model.dropDownValue4 = val);
                                              logFirebaseEvent(
                                                  'LIST_VIEW_DropDown_87cawlu0_ON_FORM_WIDG');
                                              logFirebaseEvent(
                                                  'DropDown_reset_form_fields');
                                              safeSetState(() {
                                                _model.dropDownValueController5
                                                    ?.reset();
                                                _model.dropDownValueController6
                                                    ?.reset();
                                              });
                                              logFirebaseEvent(
                                                  'DropDown_firestore_query');
                                              _model.dd4 =
                                                  await queryServicesRecordOnce(
                                                queryBuilder:
                                                    (servicesRecord) =>
                                                        servicesRecord
                                                            .where(
                                                              'visibility',
                                                              isEqualTo: true,
                                                            )
                                                            .where(
                                                              'categoryref',
                                                              isEqualTo: widget!
                                                                  .categoryref,
                                                            )
                                                            .where(
                                                              'city',
                                                              isEqualTo: _model
                                                                  .dropDownValue1,
                                                            )
                                                            .where(
                                                              'title',
                                                              isEqualTo: _model
                                                                  .dropDownValue2,
                                                            )
                                                            .where(
                                                              'dd3',
                                                              isEqualTo: _model
                                                                  .dropDownValue3,
                                                            )
                                                            .where(
                                                              'dd4',
                                                              isEqualTo: _model
                                                                  .dropDownValue4,
                                                            ),
                                              );
                                              logFirebaseEvent(
                                                  'DropDown_update_page_state');
                                              _model.showList = functions
                                                  .shuffleList(
                                                      _model.dd4?.toList(),
                                                      FFAppState().isShuffle)!
                                                  .toList()
                                                  .cast<ServicesRecord>();
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'DropDown_firestore_query');
                                              _model.dd5Count =
                                                  await queryServicesRecordCount(
                                                queryBuilder:
                                                    (servicesRecord) =>
                                                        servicesRecord
                                                            .where(
                                                              'visibility',
                                                              isEqualTo: true,
                                                            )
                                                            .where(
                                                              'city',
                                                              isEqualTo: _model
                                                                  .dropDownValue1,
                                                            )
                                                            .where(
                                                              'categoryref',
                                                              isEqualTo: widget!
                                                                  .categoryref,
                                                            )
                                                            .where(
                                                              'title',
                                                              isEqualTo: _model
                                                                  .dropDownValue2,
                                                            )
                                                            .where(
                                                              'dd3',
                                                              isEqualTo: _model
                                                                  .dropDownValue3,
                                                            )
                                                            .where(
                                                              'dd4',
                                                              isEqualTo: _model
                                                                  .dropDownValue4,
                                                            )
                                                            .where(
                                                              'dd5',
                                                              isNotEqualTo: '',
                                                            ),
                                              );
                                              if (_model.dd5Count! > 0) {
                                                logFirebaseEvent(
                                                    'DropDown_update_app_state');
                                                FFAppState().dd5 = true;
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'DropDown_update_app_state');
                                                FFAppState().dd5 = false;
                                                safeSetState(() {});
                                              }

                                              safeSetState(() {});
                                            },
                                            width: 300.0,
                                            height: 29.0,
                                            maxHeight: 300.0,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            hintText: rowCategoryRecord.dd4,
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Color(0xFF57636C),
                                              size: 22.0,
                                            ),
                                            fillColor: Colors.white,
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            disabled:
                                                _model.dropDownValue3 == null ||
                                                    _model.dropDownValue3 == '',
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  if ((_model.dropDownValue4 != null &&
                                          _model.dropDownValue4 != '') &&
                                      FFAppState().dd5)
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child:
                                          StreamBuilder<List<ServicesRecord>>(
                                        stream: queryServicesRecord(
                                          queryBuilder: (servicesRecord) =>
                                              servicesRecord
                                                  .where(
                                                    'visibility',
                                                    isEqualTo: true,
                                                  )
                                                  .where(
                                                    'categoryref',
                                                    isEqualTo:
                                                        widget!.categoryref,
                                                  )
                                                  .where(
                                                    'title',
                                                    isEqualTo:
                                                        _model.dropDownValue2,
                                                  )
                                                  .where(
                                                    'city',
                                                    isEqualTo:
                                                        _model.dropDownValue1,
                                                  )
                                                  .where(
                                                    'dd3',
                                                    isEqualTo:
                                                        _model.dropDownValue3,
                                                  )
                                                  .where(
                                                    'dd4',
                                                    isEqualTo:
                                                        _model.dropDownValue4,
                                                  ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ServicesRecord>
                                              dropDownServicesRecordList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController5 ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: functions.uniqueList(
                                                dropDownServicesRecordList
                                                    .map((e) => e.dd5)
                                                    .toList())!,
                                            onChanged: (val) async {
                                              safeSetState(() =>
                                                  _model.dropDownValue5 = val);
                                              logFirebaseEvent(
                                                  'LIST_VIEW_DropDown_n8puec7f_ON_FORM_WIDG');
                                              logFirebaseEvent(
                                                  'DropDown_reset_form_fields');
                                              safeSetState(() {
                                                _model.dropDownValueController6
                                                    ?.reset();
                                              });
                                              logFirebaseEvent(
                                                  'DropDown_firestore_query');
                                              _model.dd5 =
                                                  await queryServicesRecordOnce(
                                                queryBuilder:
                                                    (servicesRecord) =>
                                                        servicesRecord
                                                            .where(
                                                              'visibility',
                                                              isEqualTo: true,
                                                            )
                                                            .where(
                                                              'city',
                                                              isEqualTo: _model
                                                                  .dropDownValue1,
                                                            )
                                                            .where(
                                                              'categoryref',
                                                              isEqualTo: widget!
                                                                  .categoryref,
                                                            )
                                                            .where(
                                                              'title',
                                                              isEqualTo: _model
                                                                  .dropDownValue2,
                                                            )
                                                            .where(
                                                              'dd3',
                                                              isEqualTo: _model
                                                                  .dropDownValue3,
                                                            )
                                                            .where(
                                                              'dd4',
                                                              isEqualTo: _model
                                                                  .dropDownValue4,
                                                            )
                                                            .where(
                                                              'dd5',
                                                              isEqualTo: _model
                                                                  .dropDownValue5,
                                                            ),
                                              );
                                              logFirebaseEvent(
                                                  'DropDown_update_page_state');
                                              _model.showList = functions
                                                  .shuffleList(
                                                      _model.dd5?.toList(),
                                                      FFAppState().isShuffle)!
                                                  .toList()
                                                  .cast<ServicesRecord>();
                                              safeSetState(() {});
                                              logFirebaseEvent(
                                                  'DropDown_firestore_query');
                                              _model.dd6Count =
                                                  await queryServicesRecordCount(
                                                queryBuilder:
                                                    (servicesRecord) =>
                                                        servicesRecord
                                                            .where(
                                                              'visibility',
                                                              isEqualTo: true,
                                                            )
                                                            .where(
                                                              'city',
                                                              isEqualTo: _model
                                                                  .dropDownValue1,
                                                            )
                                                            .where(
                                                              'categoryref',
                                                              isEqualTo: widget!
                                                                  .categoryref,
                                                            )
                                                            .where(
                                                              'title',
                                                              isEqualTo: _model
                                                                  .dropDownValue2,
                                                            )
                                                            .where(
                                                              'dd3',
                                                              isEqualTo: _model
                                                                  .dropDownValue3,
                                                            )
                                                            .where(
                                                              'dd4',
                                                              isEqualTo: _model
                                                                  .dropDownValue4,
                                                            )
                                                            .where(
                                                              'dd5',
                                                              isEqualTo: _model
                                                                  .dropDownValue5,
                                                            )
                                                            .where(
                                                              'dd6',
                                                              isNotEqualTo: '',
                                                            ),
                                              );
                                              if (_model.dd6Count! > 0) {
                                                logFirebaseEvent(
                                                    'DropDown_update_app_state');
                                                FFAppState().dd6 = true;
                                                safeSetState(() {});
                                              } else {
                                                logFirebaseEvent(
                                                    'DropDown_update_app_state');
                                                FFAppState().dd6 = false;
                                                safeSetState(() {});
                                              }

                                              safeSetState(() {});
                                            },
                                            width: 300.0,
                                            height: 29.0,
                                            maxHeight: 300.0,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            hintText: rowCategoryRecord.dd5,
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Color(0xFF57636C),
                                              size: 22.0,
                                            ),
                                            fillColor: Colors.white,
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            disabled:
                                                _model.dropDownValue4 == null ||
                                                    _model.dropDownValue4 == '',
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  if ((_model.dropDownValue5 != null &&
                                          _model.dropDownValue5 != '') &&
                                      FFAppState().dd6)
                                    Align(
                                      alignment: AlignmentDirectional(1.0, 0.0),
                                      child:
                                          StreamBuilder<List<ServicesRecord>>(
                                        stream: queryServicesRecord(
                                          queryBuilder: (servicesRecord) =>
                                              servicesRecord
                                                  .where(
                                                    'visibility',
                                                    isEqualTo: true,
                                                  )
                                                  .where(
                                                    'categoryref',
                                                    isEqualTo:
                                                        widget!.categoryref,
                                                  )
                                                  .where(
                                                    'title',
                                                    isEqualTo:
                                                        _model.dropDownValue2,
                                                  )
                                                  .where(
                                                    'city',
                                                    isEqualTo:
                                                        _model.dropDownValue1,
                                                  )
                                                  .where(
                                                    'dd3',
                                                    isEqualTo:
                                                        _model.dropDownValue3,
                                                  )
                                                  .where(
                                                    'dd4',
                                                    isEqualTo:
                                                        _model.dropDownValue4,
                                                  )
                                                  .where(
                                                    'dd5',
                                                    isEqualTo:
                                                        _model.dropDownValue5,
                                                  ),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child:
                                                    CircularProgressIndicator(
                                                  valueColor:
                                                      AlwaysStoppedAnimation<
                                                          Color>(
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                          List<ServicesRecord>
                                              dropDownServicesRecordList =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController6 ??=
                                                FormFieldController<String>(
                                                    null),
                                            options: functions.uniqueList(
                                                dropDownServicesRecordList
                                                    .map((e) => e.dd6)
                                                    .toList())!,
                                            onChanged: (val) async {
                                              safeSetState(() =>
                                                  _model.dropDownValue6 = val);
                                              logFirebaseEvent(
                                                  'LIST_VIEW_DropDown_vdc2yddw_ON_FORM_WIDG');
                                              logFirebaseEvent(
                                                  'DropDown_firestore_query');
                                              _model.dd6 =
                                                  await queryServicesRecordOnce(
                                                queryBuilder:
                                                    (servicesRecord) =>
                                                        servicesRecord
                                                            .where(
                                                              'visibility',
                                                              isEqualTo: true,
                                                            )
                                                            .where(
                                                              'city',
                                                              isEqualTo: _model
                                                                  .dropDownValue1,
                                                            )
                                                            .where(
                                                              'categoryref',
                                                              isEqualTo: widget!
                                                                  .categoryref,
                                                            )
                                                            .where(
                                                              'title',
                                                              isEqualTo: _model
                                                                  .dropDownValue2,
                                                            )
                                                            .where(
                                                              'dd3',
                                                              isEqualTo: _model
                                                                  .dropDownValue3,
                                                            )
                                                            .where(
                                                              'dd4',
                                                              isEqualTo: _model
                                                                  .dropDownValue4,
                                                            )
                                                            .where(
                                                              'dd5',
                                                              isEqualTo: _model
                                                                  .dropDownValue5,
                                                            )
                                                            .where(
                                                              'dd6',
                                                              isEqualTo: _model
                                                                  .dropDownValue6,
                                                            ),
                                              );
                                              logFirebaseEvent(
                                                  'DropDown_update_page_state');
                                              _model.showList = functions
                                                  .shuffleList(
                                                      _model.dd6?.toList(),
                                                      FFAppState().isShuffle)!
                                                  .toList()
                                                  .cast<ServicesRecord>();
                                              safeSetState(() {});

                                              safeSetState(() {});
                                            },
                                            width: 300.0,
                                            height: 29.0,
                                            maxHeight: 300.0,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  font: GoogleFonts.roboto(
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMedium
                                                            .fontStyle,
                                                  ),
                                                  color: Colors.black,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                            hintText: rowCategoryRecord.dd6,
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: Color(0xFF57636C),
                                              size: 22.0,
                                            ),
                                            fillColor: Colors.white,
                                            elevation: 2.0,
                                            borderColor: Colors.transparent,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 0.0, 12.0, 0.0),
                                            hidesUnderline: true,
                                            disabled:
                                                _model.dropDownValue5 == null ||
                                                    _model.dropDownValue5 == '',
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'LIST_VIEW_PAGE_Icon_kcsgx8ix_ON_TAP');
                                logFirebaseEvent('Icon_reset_form_fields');
                                safeSetState(() {
                                  _model.dropDownValueController1?.reset();
                                  _model.dropDownValueController2?.reset();
                                  _model.dropDownValueController3?.reset();
                                  _model.dropDownValueController4?.reset();
                                  _model.dropDownValueController5?.reset();
                                  _model.dropDownValueController6?.reset();
                                });
                                logFirebaseEvent('Icon_update_app_state');
                                FFAppState().ddr3 = false;
                                FFAppState().dd4 = false;
                                FFAppState().dd5 = false;
                                FFAppState().dd6 = false;
                                FFAppState().dd2 = false;
                                FFAppState().dd1 = true;
                                safeSetState(() {});
                                logFirebaseEvent('Icon_update_page_state');
                                _model.listCount = 2;
                                _model.showList = _model.list
                                    .take(12)
                                    .toList()
                                    .cast<ServicesRecord>();
                                _model.showfullList = true;
                                safeSetState(() {});
                              },
                              child: Icon(
                                Icons.filter_alt_off,
                                color: Colors.white,
                                size: 30.0,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  if (FFAppState().search)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Container(
                              height: 35.0,
                              decoration: BoxDecoration(),
                              child: Visibility(
                                visible: FFAppState().search,
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.8,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        logFirebaseEvent(
                                            'LIST_VIEW_TextField_exnmpwf1_ON_TEXTFIEL');
                                        if (_model.textController.text !=
                                                null &&
                                            _model.textController.text != '') {
                                          logFirebaseEvent(
                                              'TextField_update_page_state');
                                          _model.showList = functions
                                              .customSreach(
                                                  _model.textController.text,
                                                  (_model.showList.length > 12
                                                          ? _model.showList
                                                          : _model.list)
                                                      .toList())
                                              .toList()
                                              .cast<ServicesRecord>();
                                          _model.showfullList = false;
                                          safeSetState(() {});
                                        } else {
                                          if (_model.isMap) {
                                            logFirebaseEvent(
                                                'TextField_update_page_state');
                                            _model.showList = _model.list
                                                .toList()
                                                .cast<ServicesRecord>();
                                            _model.showfullList = true;
                                            _model.listCount = 2;
                                            safeSetState(() {});
                                          } else {
                                            logFirebaseEvent(
                                                'TextField_update_page_state');
                                            _model.showList = _model.list
                                                .take(12)
                                                .toList()
                                                .cast<ServicesRecord>();
                                            _model.showfullList = true;
                                            safeSetState(() {});
                                          }
                                        }
                                      },
                                    ),
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF57636C),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      alignLabelWithHint: true,
                                      hintText: () {
                                        if (FFAppState().appLanguage == 'KU') {
                                          return 'گەڕان';
                                        } else if (FFAppState().appLanguage ==
                                            'AR') {
                                          return 'ابحث';
                                        } else {
                                          return 'Search....';
                                        }
                                      }(),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF57636C),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              15.0, 15.0, 15.0, 15.0),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                          color: Colors.black,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    textAlign: TextAlign.start,
                                    minLines: 1,
                                    cursorColor: Colors.black,
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              logFirebaseEvent(
                                  'LIST_VIEW_PAGE_Icon_nkyk2wiu_ON_TAP');
                              logFirebaseEvent(
                                  'Icon_clear_text_fields_pin_codes');
                              safeSetState(() {
                                _model.textController?.clear();
                              });
                              if (_model.isMap) {
                                logFirebaseEvent('Icon_update_page_state');
                                _model.showList =
                                    _model.list.toList().cast<ServicesRecord>();
                                _model.showfullList = true;
                                safeSetState(() {});
                              } else {
                                logFirebaseEvent('Icon_update_page_state');
                                _model.showList = _model.list
                                    .take(12)
                                    .toList()
                                    .cast<ServicesRecord>();
                                _model.showfullList = true;
                                _model.listCount = 2;
                                safeSetState(() {});
                              }
                            },
                            child: Icon(
                              Icons.clear,
                              color: Color(0xFF042072),
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                    child: RichText(
                      textScaler: MediaQuery.of(context).textScaler,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: _model.showfullList
                                ? formatNumber(
                                    _model.list.length,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                  )
                                : formatNumber(
                                    _model.showList.length,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                  ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF042072),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                          TextSpan(
                            text: () {
                              if (FFAppState().appLanguage == 'KU') {
                                return ' تۆمارکراو';
                              } else if (FFAppState().appLanguage == 'AR') {
                                return ' مسجل';
                              } else {
                                return ' Recorded ';
                              }
                            }(),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.roboto(
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
                                ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.roboto(
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
                            ),
                      ),
                    ),
                  ),
                  if ((FFAppState().appLanguage == 'KU') && widget!.isShow!)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent('LIST_VIEW_PAGE__BTN_ON_TAP');
                              logFirebaseEvent(
                                  'Button_clear_text_fields_pin_codes');
                              safeSetState(() {
                                _model.textController?.clear();
                              });
                              logFirebaseEvent('Button_reset_form_fields');
                              safeSetState(() {
                                _model.dropDownValueController1?.reset();
                                _model.dropDownValueController2?.reset();
                                _model.dropDownValueController3?.reset();
                                _model.dropDownValueController4?.reset();
                                _model.dropDownValueController5?.reset();
                                _model.dropDownValueController6?.reset();
                              });
                              logFirebaseEvent('Button_update_page_state');
                              _model.isMap = true;
                              _model.showList = _model.fulldatalist!
                                  .toList()
                                  .cast<ServicesRecord>();
                              _model.showfullList = false;
                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'gp4o9mrx' /* نەخشە */,
                            ),
                            options: FFButtonOptions(
                              width: 150.0,
                              height: 35.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0x003767EC),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF042072),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Color(0xFF042072),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent('LIST_VIEW_PAGE__BTN_ON_TAP');
                              logFirebaseEvent('Button_reset_form_fields');
                              safeSetState(() {
                                _model.dropDownValueController1?.reset();
                                _model.dropDownValueController2?.reset();
                                _model.dropDownValueController3?.reset();
                                _model.dropDownValueController4?.reset();
                                _model.dropDownValueController5?.reset();
                                _model.dropDownValueController6?.reset();
                              });
                              logFirebaseEvent(
                                  'Button_clear_text_fields_pin_codes');
                              safeSetState(() {
                                _model.textController?.clear();
                              });
                              logFirebaseEvent('Button_update_page_state');
                              _model.isMap = false;
                              _model.showList = _model.list
                                  .take(12)
                                  .toList()
                                  .cast<ServicesRecord>();
                              _model.showfullList = true;
                              safeSetState(() {});
                            },
                            text: FFLocalizations.of(context).getText(
                              'qhuihy6x' /* لیست */,
                            ),
                            options: FFButtonOptions(
                              width: 150.0,
                              height: 35.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0x003767EC),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF042072),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                              elevation: 0.0,
                              borderSide: BorderSide(
                                color: Color(0xFF042072),
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (!_model.isMap)
                    Builder(
                      builder: (context) {
                        final listdata = _model.showList.toList();

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listdata.length,
                          itemBuilder: (context, listdataIndex) {
                            final listdataItem = listdata[listdataIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 15.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'LIST_VIEW_PAGE_Container_ronw3oci_ON_TAP');
                                  logFirebaseEvent('Container_backend_call');

                                  await listdataItem.reference.update({
                                    ...mapToFirestore(
                                      {
                                        'pageview': FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent(
                                      'Container_update_app_state');
                                  FFAppState().isShuffle = false;
                                  safeSetState(() {});
                                  logFirebaseEvent('Container_backend_call');
                                  _model.ref =
                                      await ServicesRecord.getDocumentOnce(
                                          listdataItem.reference);
                                  logFirebaseEvent('Container_navigate_to');

                                  context.pushNamed(
                                    ItemViewWidget.routeName,
                                    queryParameters: {
                                      'itemsRefrence': serializeParam(
                                        _model.ref,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'itemsRefrence': _model.ref,
                                    },
                                  );

                                  safeSetState(() {});
                                },
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 240),
                                  curve: Curves.easeIn,
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 7.0, 10.0, 7.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: Container(
                                            width: 60.0,
                                            height: 60.0,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: CachedNetworkImage(
                                              fadeInDuration:
                                                  Duration(milliseconds: 500),
                                              fadeOutDuration:
                                                  Duration(milliseconds: 500),
                                              imageUrl: valueOrDefault<String>(
                                                listdataItem.image,
                                                'https://picsum.photos/seed/670/600',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  listdataItem.name,
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font:
                                                            GoogleFonts.roboto(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      3.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            listdataItem
                                                                .jobtitle,
                                                            textAlign:
                                                                TextAlign.start,
                                                            maxLines: 3,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF4670F0),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Text(
                                                        formatNumber(
                                                          listdataItem.pageview,
                                                          formatType: FormatType
                                                              .compact,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .remove_red_eye_outlined,
                                                      color: Colors.black,
                                                      size: 24.0,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  if ((_model.dropDownValue1 == null ||
                          _model.dropDownValue1 == '') &&
                      _model.showfullList &&
                      (_model.list.length != _model.showList.length) &&
                      !_model.isMap)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'LIST_VIEW_PAGE_Button_xxpt5ula_ON_TAP');
                            logFirebaseEvent('Button_update_page_state');
                            _model.showList = _model.list
                                .take(12 * _model.listCount)
                                .toList()
                                .cast<ServicesRecord>();
                            safeSetState(() {});
                            logFirebaseEvent('Button_update_page_state');
                            _model.listCount = _model.listCount + 1;
                            safeSetState(() {});
                          },
                          text: () {
                            if (FFAppState().appLanguage == 'KU') {
                              return 'زیاتر';
                            } else if (FFAppState().appLanguage == 'AR') {
                              return ' المزید';
                            } else {
                              return 'Load More';
                            }
                          }(),
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
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .fontStyle,
                                ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  if (_model.isMap)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.5,
                        child: custom_widgets.MapScreen(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 0.5,
                          listRef: _model.showList,
                          isRun: _model.isMap,
                        ),
                      ),
                    ),
                ].addToEnd(SizedBox(height: 30.0)),
              ),
            ),
            if (_model.containerBool)
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: wrapWithModel(
                  model: _model.listLoadingModel,
                  updateCallback: () => safeSetState(() {}),
                  child: ListLoadingWidget(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
