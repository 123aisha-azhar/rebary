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
import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  static String routeName = 'home';
  static String routePath = '/home';

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'home'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('HOME_PAGE_home_ON_INIT_STATE');
      logFirebaseEvent('home_widget_animation');
      if (animationsMap['choiceChipsOnActionTriggerAnimation'] != null) {
        await animationsMap['choiceChipsOnActionTriggerAnimation']!.controller
          ..reset()
          ..repeat(reverse: true);
      }
      if (FFAppState().appLanguage == 'KU') {
        logFirebaseEvent('home_update_page_state');
        _model.pageLanguage = 'kurdish';
        safeSetState(() {});
      } else {
        if (FFAppState().appLanguage == 'EN') {
          logFirebaseEvent('home_update_page_state');
          _model.pageLanguage = 'english';
          safeSetState(() {});
        } else {
          logFirebaseEvent('home_update_page_state');
          _model.pageLanguage = 'arabic';
          safeSetState(() {});
        }
      }

      logFirebaseEvent('home_set_app_language');
      setAppLanguage(context, 'ar');
      if (valueOrDefault<bool>(currentUserDocument?.canBlock, false) == true) {
        logFirebaseEvent('home_navigate_to');

        context.pushNamed(UserBlockWidget.routeName);
      } else {
        logFirebaseEvent('home_firestore_query');
        _model.fullData = await queryCategoryRecordOnce(
          queryBuilder: (categoryRecord) => categoryRecord
              .where(
                'visibility',
                isEqualTo: true,
              )
              .where(
                'language',
                isEqualTo: _model.pageLanguage,
              )
              .orderBy('sortingorder'),
        );
        logFirebaseEvent('home_update_page_state');
        _model.searchList = _model.fullData!.toList().cast<CategoryRecord>();
        safeSetState(() {});
        logFirebaseEvent('home_firestore_query');
        _model.tags = await queryTagsRecordOnce(
          queryBuilder: (tagsRecord) => tagsRecord.orderBy('name'),
        );
        logFirebaseEvent('home_update_app_state');
        FFAppState().tagslist =
            _model.tags!.map((e) => e.name).toList().toList().cast<String>();
        FFAppState().show = false;
        safeSetState(() {});
        logFirebaseEvent('home_update_page_state');
        _model.fulllist = true;
        _model.search = false;
        safeSetState(() {});
        logFirebaseEvent('home_update_app_state');
        FFAppState().isShuffle = true;
        safeSetState(() {});
      }
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'choiceChipsOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 500.0.ms,
            duration: 2000.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 0.0),
          ),
          MoveEffect(
            curve: Curves.linear,
            delay: 500.0.ms,
            duration: 2000.0.ms,
            begin: Offset(0.0, 0.0),
            end: Offset(100.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          drawer: Drawer(
            elevation: 16.0,
            child: wrapWithModel(
              model: _model.drawerModel,
              updateCallback: () => safeSetState(() {}),
              child: DrawerWidget(
                closeDrawer: () async {
                  logFirebaseEvent('HOME_PAGE_Container_x7w926f9_CALLBACK');
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
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(12.0, 40.0, 20.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (FFAppState().appLanguage == 'KU')
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'HOME_PAGE_Icon_f9c8qexp_ON_TAP');
                                logFirebaseEvent('Icon_drawer');
                                scaffoldKey.currentState!.openDrawer();
                              },
                              child: Icon(
                                Icons.menu_sharp,
                                color: Colors.white,
                                size: 40.0,
                              ),
                            ),
                          if (FFAppState().appLanguage != 'KU')
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 0.0, 0.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: Image.asset(
                                  'assets/images/Untitled-3_3.png',
                                  width: 60.0,
                                  height: 60.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(1.0, -1.0),
                              child: FlutterFlowChoiceChips(
                                options: [
                                  ChipData('EN'),
                                  ChipData('AR'),
                                  ChipData('KU')
                                ],
                                onChanged: (val) async {
                                  safeSetState(() => _model
                                      .choiceLanguageValue = val?.firstOrNull);
                                  logFirebaseEvent(
                                      'HOME_choiceLanguage_ON_FORM_WIDGET_SELEC');
                                  if (_model.choiceLanguageValue == 'KU') {
                                    if (currentUserReference != null) {
                                      logFirebaseEvent(
                                          'choiceLanguage_update_page_state');
                                      _model.fulllist = true;
                                      _model.pageLanguage = 'kurdish';
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'choiceLanguage_update_app_state');
                                      FFAppState().appLanguage = 'KU';
                                      safeSetState(() {});
                                    } else {
                                      logFirebaseEvent(
                                          'choiceLanguage_show_snack_bar');
                                      ScaffoldMessenger.of(context)
                                          .clearSnackBars();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Kindly login first in order to use Kurdish.',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14.0,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor: Color(0xFF042072),
                                        ),
                                      );
                                      logFirebaseEvent(
                                          'choiceLanguage_navigate_to');

                                      context.pushNamed(LoginWidget.routeName);
                                    }
                                  } else {
                                    if (_model.choiceLanguageValue == 'AR') {
                                      logFirebaseEvent(
                                          'choiceLanguage_update_page_state');
                                      _model.fulllist = true;
                                      _model.pageLanguage = 'arabic';
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'choiceLanguage_update_app_state');
                                      FFAppState().appLanguage = 'AR';
                                      safeSetState(() {});
                                    } else {
                                      logFirebaseEvent(
                                          'choiceLanguage_update_page_state');
                                      _model.fulllist = true;
                                      _model.pageLanguage = 'english';
                                      safeSetState(() {});
                                      logFirebaseEvent(
                                          'choiceLanguage_update_app_state');
                                      FFAppState().appLanguage = 'EN';
                                      safeSetState(() {});
                                    }
                                  }

                                  logFirebaseEvent(
                                      'choiceLanguage_firestore_query');
                                  _model.languageData =
                                      await queryCategoryRecordOnce(
                                    queryBuilder: (categoryRecord) =>
                                        categoryRecord
                                            .where(
                                              'visibility',
                                              isEqualTo: true,
                                            )
                                            .where(
                                              'language',
                                              isEqualTo: _model.pageLanguage,
                                            )
                                            .orderBy('sortingorder'),
                                  );
                                  logFirebaseEvent(
                                      'choiceLanguage_update_page_state');
                                  _model.searchList = _model.languageData!
                                      .toList()
                                      .cast<CategoryRecord>();
                                  safeSetState(() {});
                                  if (_model.tagsValue != null &&
                                      _model.tagsValue != '') {
                                    logFirebaseEvent(
                                        'choiceLanguage_navigate_to');

                                    context.pushNamed(HomeWidget.routeName);
                                  }

                                  safeSetState(() {});
                                },
                                selectedChipStyle: ChipStyle(
                                  backgroundColor: Color(0xFF042072),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.inter(
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  iconColor: Colors.white,
                                  iconSize: 16.0,
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(55.0),
                                ),
                                unselectedChipStyle: ChipStyle(
                                  backgroundColor: Colors.white,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  iconSize: 16.0,
                                  elevation: 0.0,
                                  borderRadius: BorderRadius.circular(55.0),
                                ),
                                chipSpacing: 8.0,
                                rowSpacing: 8.0,
                                multiselect: false,
                                initialized: _model.choiceLanguageValue != null,
                                alignment: WrapAlignment.start,
                                controller:
                                    _model.choiceLanguageValueController ??=
                                        FormFieldController<List<String>>(
                                  [FFAppState().appLanguage],
                                ),
                                wrapped: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_model.pageLanguage == 'kurdish')
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(6.0, 5.0, 6.0, 0.0),
                        child: FlutterFlowChoiceChips(
                          options: FFAppState()
                              .tagslist
                              .map((label) => ChipData(label))
                              .toList(),
                          onChanged: (val) async {
                            safeSetState(
                                () => _model.tagsValue = val?.firstOrNull);
                            logFirebaseEvent(
                                'HOME_PAGE_tags_ON_FORM_WIDGET_SELECTED');
                            if (_model.fulllist) {
                              logFirebaseEvent('tags_update_page_state');
                              _model.fulllist = false;
                              _model.choiceData = _model.tagsValue!;
                              safeSetState(() {});
                            } else {
                              if (_model.choiceData == _model.tagsValue) {
                                logFirebaseEvent('tags_navigate_to');

                                context.pushNamed(HomeWidget.routeName);
                              } else {
                                logFirebaseEvent('tags_update_page_state');
                                _model.choiceData = _model.tagsValue!;
                                safeSetState(() {});
                                logFirebaseEvent('tags_widget_animation');
                                if (animationsMap[
                                        'choiceChipsOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap[
                                          'choiceChipsOnActionTriggerAnimation']!
                                      .controller
                                      .reset();
                                }
                                logFirebaseEvent('tags_widget_animation');
                                if (animationsMap[
                                        'choiceChipsOnActionTriggerAnimation'] !=
                                    null) {
                                  animationsMap[
                                          'choiceChipsOnActionTriggerAnimation']!
                                      .controller
                                      .stop();
                                }
                              }
                            }

                            logFirebaseEvent('tags_firestore_query');
                            _model.tagData = await queryCategoryRecordOnce(
                              queryBuilder: (categoryRecord) => categoryRecord
                                  .where(
                                    'visibility',
                                    isEqualTo: true,
                                  )
                                  .where(
                                    'language',
                                    isEqualTo: _model.pageLanguage,
                                  )
                                  .where(
                                    'tags',
                                    arrayContains: _model.tagsValue,
                                  )
                                  .orderBy('sortingorder'),
                            );
                            logFirebaseEvent('tags_update_page_state');
                            _model.searchList =
                                _model.tagData!.toList().cast<CategoryRecord>();
                            safeSetState(() {});

                            safeSetState(() {});
                          },
                          selectedChipStyle: ChipStyle(
                            backgroundColor: Color(0xFF3767EC),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                  lineHeight: 1.5,
                                ),
                            iconColor: Colors.black,
                            iconSize: 15.0,
                            labelPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: Colors.white,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                  lineHeight: 1.5,
                                ),
                            iconColor: Colors.black,
                            iconSize: 15.0,
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          chipSpacing: 4.0,
                          rowSpacing: 8.0,
                          multiselect: false,
                          alignment: WrapAlignment.start,
                          controller: _model.tagsValueController ??=
                              FormFieldController<List<String>>(
                            [],
                          ),
                          wrapped: false,
                        ).animateOnActionTrigger(
                          animationsMap['choiceChipsOnActionTriggerAnimation']!,
                        ),
                      ),
                    if (_model.pageLanguage == 'kurdish')
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
                                            'HOME_TextField_aw5rifza_ON_TEXTFIELD_CHA');
                                        if (_model.textController.text !=
                                                null &&
                                            _model.textController.text != '') {
                                          logFirebaseEvent(
                                              'TextField_update_page_state');
                                          _model.searchList = functions
                                              .customSreachCategory(
                                                  _model.textController.text,
                                                  _model.fullData!.toList())
                                              .toList()
                                              .cast<CategoryRecord>();
                                          safeSetState(() {});
                                        } else {
                                          logFirebaseEvent(
                                              'TextField_update_page_state');
                                          _model.searchList = _model.fullData!
                                              .toList()
                                              .cast<CategoryRecord>();
                                          safeSetState(() {});
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
                                      alignLabelWithHint: false,
                                      hintText: () {
                                        if (FFAppState().appLanguage == 'KU') {
                                          return 'گەڕان بۆ بەش';
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
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: Color(0xFF57636C),
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
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
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'HOME_PAGE_Icon_vdhw5bfk_ON_TAP');
                                logFirebaseEvent('Icon_update_page_state');
                                _model.search = false;
                                safeSetState(() {});
                                logFirebaseEvent(
                                    'Icon_clear_text_fields_pin_codes');
                                safeSetState(() {
                                  _model.textController?.clear();
                                });
                                logFirebaseEvent('Icon_update_page_state');
                                _model.searchList = _model.fullData!
                                    .toList()
                                    .cast<CategoryRecord>();
                                safeSetState(() {});
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
                          EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                      child: RichText(
                        textScaler: MediaQuery.of(context).textScaler,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: valueOrDefault<String>(
                                formatNumber(
                                  _model.searchList.length,
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.automatic,
                                ),
                                '0',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF042072),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
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
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
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
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 20.0, 0.0, 0.0),
                                  child: Builder(
                                    builder: (context) {
                                      final list = _model.searchList.toList();

                                      return GridView.builder(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          0,
                                          0,
                                          20.0,
                                        ),
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          childAspectRatio: 1.0,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: list.length,
                                        itemBuilder: (context, listIndex) {
                                          final listItem = list[listIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              logFirebaseEvent(
                                                  'HOME_PAGE_Column_ma8njj6j_ON_TAP');
                                              logFirebaseEvent(
                                                  'Column_navigate_to');

                                              context.pushNamed(
                                                ListViewWidget.routeName,
                                                queryParameters: {
                                                  'categoryref': serializeParam(
                                                    listItem.reference,
                                                    ParamType.DocumentReference,
                                                  ),
                                                  'isShow': serializeParam(
                                                    listItem.showMapView,
                                                    ParamType.bool,
                                                  ),
                                                }.withoutNulls,
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(15.0),
                                                    bottomRight:
                                                        Radius.circular(15.0),
                                                    topLeft:
                                                        Radius.circular(15.0),
                                                    topRight:
                                                        Radius.circular(15.0),
                                                  ),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 1000),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 1000),
                                                    imageUrl:
                                                        valueOrDefault<String>(
                                                      listItem.icon,
                                                      'https://picsum.photos/seed/670/600',
                                                    ),
                                                    width: 75.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 0.0),
                                                    child: AutoSizeText(
                                                      listItem.name,
                                                      textAlign:
                                                          TextAlign.center,
                                                      maxLines: 3,
                                                      minFontSize: 4.0,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .roboto(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: Color(
                                                                0xFF0A0A0A),
                                                            fontSize: 14.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                              if (_model.pageLanguage == 'kurdish')
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 10.0, 0.0, 10.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        logFirebaseEvent(
                                            'HOME_PAGE___BTN_ON_TAP');
                                        logFirebaseEvent('Button_navigate_to');

                                        context.pushNamed(
                                            Drawer245Widget.routeName);
                                      },
                                      text: 'پیشەکەت تۆماربکە',
                                      options: FFButtonOptions(
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF042072),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              color: Colors.white,
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (FFAppState().show)
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
      ),
    );
  }
}
