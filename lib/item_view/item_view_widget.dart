import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/drawer_widget.dart';
import '/components/header_widget.dart';
import '/components/image_view_widget.dart';
import '/components/item_viewreport_widget.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'item_view_model.dart';
export 'item_view_model.dart';

class ItemViewWidget extends StatefulWidget {
  const ItemViewWidget({
    super.key,
    required this.itemsRefrence,
  });

  final ServicesRecord? itemsRefrence;

  static String routeName = 'itemView';
  static String routePath = '/itemView';

  @override
  State<ItemViewWidget> createState() => _ItemViewWidgetState();
}

class _ItemViewWidgetState extends State<ItemViewWidget> {
  late ItemViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemViewModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'itemView'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('ITEM_VIEW_PAGE_itemView_ON_INIT_STATE');
      currentUserLocationValue =
          await getCurrentUserLocation(defaultLocation: LatLng(0.0, 0.0));
      logFirebaseEvent('itemView_update_page_state');
      _model.latlng = currentUserLocationValue;
      safeSetState(() {});
    });
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
      child: Scaffold(
        key: scaffoldKey,
        resizeToAvoidBottomInset: false,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.drawerModel,
            updateCallback: () => safeSetState(() {}),
            child: DrawerWidget(
              closeDrawer: () async {
                logFirebaseEvent('ITEM_VIEW_Container_hc8tloa9_CALLBACK');
                logFirebaseEvent('drawer_drawer');
                if (scaffoldKey.currentState!.isDrawerOpen ||
                    scaffoldKey.currentState!.isEndDrawerOpen) {
                  Navigator.pop(context);
                }
              },
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 1.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                'assets/images/Rectangle_9_(1).png',
              ).image,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                wrapWithModel(
                  model: _model.headerModel,
                  updateCallback: () => safeSetState(() {}),
                  child: HeaderWidget(
                    isShow: false,
                    drawerAction: () async {
                      logFirebaseEvent('ITEM_VIEW_Container_zu73zl3y_CALLBACK');
                      logFirebaseEvent('header_drawer');
                      scaffoldKey.currentState!.openDrawer();
                    },
                  ),
                ),
                if (!(widget!.itemsRefrence!.gallery.isNotEmpty))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        logFirebaseEvent(
                            'ITEM_VIEW_PAGE_Image_gmnnbybv_ON_TAP');
                        logFirebaseEvent('Image_bottom_sheet');
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: Container(
                                  height:
                                      MediaQuery.sizeOf(context).height * 1.0,
                                  child: ImageViewWidget(
                                    image: widget!.itemsRefrence!.image,
                                  ),
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: CachedNetworkImage(
                          fadeInDuration: Duration(milliseconds: 500),
                          fadeOutDuration: Duration(milliseconds: 500),
                          imageUrl: valueOrDefault<String>(
                            widget!.itemsRefrence?.image,
                            'https://picsum.photos/seed/670/600',
                          ),
                          width: 400.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                if (widget!.itemsRefrence?.gallery != null &&
                    (widget!.itemsRefrence?.gallery)!.isNotEmpty)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final list = widget!.itemsRefrence?.gallery
                                ?.map((e) => e)
                                .toList()
                                ?.toList() ??
                            [];

                        return Container(
                          width: double.infinity,
                          height: 200.0,
                          child: CarouselSlider.builder(
                            itemCount: list.length,
                            itemBuilder: (context, listIndex, _) {
                              final listItem = list[listIndex];
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Image_ze9jjnzg_ON_TAP');
                                  logFirebaseEvent('Image_bottom_sheet');
                                  await showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: Container(
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            child: ImageViewWidget(
                                              image: listItem,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => safeSetState(() {}));
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: CachedNetworkImage(
                                    fadeInDuration: Duration(milliseconds: 500),
                                    fadeOutDuration:
                                        Duration(milliseconds: 500),
                                    imageUrl: valueOrDefault<String>(
                                      listItem,
                                      'https://picsum.photos/seed/670/600',
                                    ),
                                    width: double.infinity,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            carouselController: _model.carouselController ??=
                                CarouselSliderController(),
                            options: CarouselOptions(
                              initialPage: max(0, min(1, list.length - 1)),
                              viewportFraction: 1.0,
                              disableCenter: false,
                              enlargeCenterPage: true,
                              enlargeFactor: 0.15,
                              enableInfiniteScroll: true,
                              scrollDirection: Axis.horizontal,
                              autoPlay: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 500),
                              autoPlayInterval:
                                  Duration(milliseconds: (500 + 2000)),
                              autoPlayCurve: Curves.linear,
                              pauseAutoPlayInFiniteScroll: true,
                              onPageChanged: (index, _) =>
                                  _model.carouselCurrentIndex = index,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                if (FFAppState().appLanguage == 'KU')
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Builder(
                      builder: (context) => Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            15.0, 12.0, 16.0, 0.0),
                        child: StreamBuilder<CategoryRecord>(
                          stream: CategoryRecord.getDocument(
                              widget!.itemsRefrence!.categoryref!),
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

                            final buttonCategoryRecord = snapshot.data!;

                            return FFButtonWidget(
                              onPressed: () async {
                                logFirebaseEvent(
                                    'ITEM_VIEW_PAGE__REPORT_BTN_ON_TAP');
                                logFirebaseEvent('Button_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(dialogContext)
                                              .unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: ItemViewreportWidget(
                                          data: buttonCategoryRecord
                                              .reportoptions,
                                          email: buttonCategoryRecord
                                              .emailreportreciver,
                                          itemData: widget!.itemsRefrence!,
                                          senderEmail:
                                              buttonCategoryRecord.senderEmail,
                                          senderPass:
                                              buttonCategoryRecord.senderPass,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              text: FFLocalizations.of(context).getText(
                                'yc5amqw0' /* سکاڵا Report */,
                              ),
                              options: FFButtonOptions(
                                width: MediaQuery.sizeOf(context).width * 1.0,
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
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 18.0, 16.0, 0.0),
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 3.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget!.itemsRefrence?.name,
                                  'name',
                                ),
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleLarge
                                            .fontStyle,
                                      ),
                                      color: Color(0xFF0A0A0A),
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-1.0, -1.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget!.itemsRefrence?.job,
                                'job',
                              ),
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Color(0xFF2204F7),
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                if ((widget!.itemsRefrence?.phone1 != null &&
                        widget!.itemsRefrence?.phone1 != '') ||
                    (widget!.itemsRefrence?.phone2 != null &&
                        widget!.itemsRefrence?.phone2 != '') ||
                    (widget!.itemsRefrence?.phone3 != null &&
                        widget!.itemsRefrence?.phone3 != ''))
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                      child: Text(
                        () {
                          if (FFAppState().appLanguage == 'KU') {
                            return 'پەیوەندی';
                          } else if (FFAppState().appLanguage == 'AR') {
                            return 'الهاتف';
                          } else {
                            return 'Phone';
                          }
                        }(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Color(0xFF042072),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                if ((widget!.itemsRefrence?.phone1 != null &&
                        widget!.itemsRefrence?.phone1 != '') ||
                    (widget!.itemsRefrence?.phone2 != null &&
                        widget!.itemsRefrence?.phone2 != '') ||
                    (widget!.itemsRefrence?.phone3 != null &&
                        widget!.itemsRefrence?.phone3 != '') ||
                    (widget!.itemsRefrence?.phone4 != null &&
                        widget!.itemsRefrence?.phone4 != ''))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            8.0, 10.0, 8.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (widget!.itemsRefrence?.phone1 != null &&
                                widget!.itemsRefrence?.phone1 != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_lettwvv1_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'phone1clickcount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_call_number');
                                  await launchUrl(Uri(
                                    scheme: 'tel',
                                    path: widget!.itemsRefrence!.phone1,
                                  ));
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    if (widget!.itemsRefrence?.phone1Text !=
                                            null &&
                                        widget!.itemsRefrence?.phone1Text != '')
                                      Text(
                                        valueOrDefault<String>(
                                          widget!.itemsRefrence?.phone1Text,
                                          'text 1',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    Icon(
                                      Icons.phone,
                                      color: Color(0xFF042072),
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!.itemsRefrence!.phone1clickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget!.itemsRefrence?.phone2 != null &&
                                widget!.itemsRefrence?.phone2 != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_d38aoqy7_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'phone2clickcount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_call_number');
                                  await launchUrl(Uri(
                                    scheme: 'tel',
                                    path: widget!.itemsRefrence!.phone2,
                                  ));
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (widget!.itemsRefrence?.phone2Text !=
                                            null &&
                                        widget!.itemsRefrence?.phone2Text != '')
                                      Text(
                                        valueOrDefault<String>(
                                          widget!.itemsRefrence?.phone2Text,
                                          'text 2',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    Icon(
                                      Icons.phone,
                                      color: Color(0xFF042072),
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!.itemsRefrence!.phone2clickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget!.itemsRefrence?.phone3 != null &&
                                widget!.itemsRefrence?.phone3 != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_09qp0bv3_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'phone3clickcount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_call_number');
                                  await launchUrl(Uri(
                                    scheme: 'tel',
                                    path: widget!.itemsRefrence!.phone3,
                                  ));
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (widget!.itemsRefrence?.phone3Text !=
                                            null &&
                                        widget!.itemsRefrence?.phone3Text != '')
                                      Text(
                                        valueOrDefault<String>(
                                          widget!.itemsRefrence?.phone3Text,
                                          'text 3',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    Icon(
                                      Icons.phone,
                                      color: Color(0xFF042072),
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!.itemsRefrence!.phone3clickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget!.itemsRefrence?.phone4 != null &&
                                widget!.itemsRefrence?.phone4 != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_nurf21w5_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'phone4clickcount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_call_number');
                                  await launchUrl(Uri(
                                    scheme: 'tel',
                                    path: widget!.itemsRefrence!.phone4,
                                  ));
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (widget!.itemsRefrence?.phone4Text !=
                                            null &&
                                        widget!.itemsRefrence?.phone4Text != '')
                                      Text(
                                        valueOrDefault<String>(
                                          widget!.itemsRefrence?.phone4Text,
                                          'text 4',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              font: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                      ),
                                    Icon(
                                      Icons.phone,
                                      color: Color(0xFF042072),
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!.itemsRefrence!.phone4clickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if ((widget!.itemsRefrence?.tiktok != null &&
                        widget!.itemsRefrence?.tiktok != '') ||
                    (widget!.itemsRefrence?.snapchat != null &&
                        widget!.itemsRefrence?.snapchat != '') ||
                    (widget!.itemsRefrence?.facebook != null &&
                        widget!.itemsRefrence?.facebook != '') ||
                    (widget!.itemsRefrence?.whatsapp != null &&
                        widget!.itemsRefrence?.whatsapp != '') ||
                    (widget!.itemsRefrence?.website != null &&
                        widget!.itemsRefrence?.website != '') ||
                    (widget!.itemsRefrence?.viber != null &&
                        widget!.itemsRefrence?.viber != '') ||
                    (widget!.itemsRefrence?.youtube != null &&
                        widget!.itemsRefrence?.youtube != '') ||
                    (widget!.itemsRefrence?.email != null &&
                        widget!.itemsRefrence?.email != '') ||
                    (widget!.itemsRefrence?.telegram != null &&
                        widget!.itemsRefrence?.telegram != ''))
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                      child: Text(
                        () {
                          if (FFAppState().appLanguage == 'KU') {
                            return 'سۆشیاڵ';
                          } else if (FFAppState().appLanguage == 'AR') {
                            return 'اجتماعي';
                          } else {
                            return 'Social';
                          }
                        }(),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Color(0xFF042072),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                if ((widget!.itemsRefrence?.tiktok != null &&
                        widget!.itemsRefrence?.tiktok != '') ||
                    (widget!.itemsRefrence?.snapchat != null &&
                        widget!.itemsRefrence?.snapchat != '') ||
                    (widget!.itemsRefrence?.facebook != null &&
                        widget!.itemsRefrence?.facebook != '') ||
                    (widget!.itemsRefrence?.whatsapp != null &&
                        widget!.itemsRefrence?.whatsapp != '') ||
                    (widget!.itemsRefrence?.website != null &&
                        widget!.itemsRefrence?.website != '') ||
                    (widget!.itemsRefrence?.viber != null &&
                        widget!.itemsRefrence?.viber != '') ||
                    (widget!.itemsRefrence?.youtube != null &&
                        widget!.itemsRefrence?.youtube != '') ||
                    (widget!.itemsRefrence?.email != null &&
                        widget!.itemsRefrence?.email != '') ||
                    (widget!.itemsRefrence?.telegram != null &&
                        widget!.itemsRefrence?.telegram != '') ||
                    (widget!.itemsRefrence?.appleStore != null &&
                        widget!.itemsRefrence?.appleStore != '') ||
                    (widget!.itemsRefrence?.playstore != null &&
                        widget!.itemsRefrence?.playstore != ''))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            8.0, 10.0, 8.0, 10.0),
                        child: Wrap(
                          spacing: 25.0,
                          runSpacing: 5.0,
                          alignment: WrapAlignment.spaceEvenly,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          direction: Axis.horizontal,
                          runAlignment: WrapAlignment.spaceEvenly,
                          verticalDirection: VerticalDirection.down,
                          clipBehavior: Clip.none,
                          children: [
                            if (widget!.itemsRefrence?.whatsapp != null &&
                                widget!.itemsRefrence?.whatsapp != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_sx1j15rp_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'whatsappclickcount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_launch_u_r_l');
                                  await launchURL(
                                      widget!.itemsRefrence!.whatsapp);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.whatsapp,
                                      color: Color(0xFF14A190),
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!
                                            .itemsRefrence!.whatsappclickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget!.itemsRefrence?.viber != null &&
                                widget!.itemsRefrence?.viber != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_bm6qwnb1_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'viberclickcount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_launch_u_r_l');
                                  await launchURL(widget!.itemsRefrence!.viber);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.viber,
                                      color: Color(0xFF7360F2),
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!.itemsRefrence!.viberclickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget!.itemsRefrence?.telegram != null &&
                                widget!.itemsRefrence?.telegram != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_z8folq8g_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'telegramclickcount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_launch_u_r_l');
                                  await launchURL(
                                      widget!.itemsRefrence!.telegram);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.telegram,
                                      color: Color(0xFF229ED9),
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!
                                            .itemsRefrence!.telegramclickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget!.itemsRefrence?.facebook != null &&
                                widget!.itemsRefrence?.facebook != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_6nggv20s_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'facebookclickcount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_launch_u_r_l');
                                  await launchURL(
                                      widget!.itemsRefrence!.facebook);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.facebook,
                                      color: Color(0xFF1877F2),
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!
                                            .itemsRefrence!.facebookclickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget!.itemsRefrence?.instagaram != null &&
                                widget!.itemsRefrence?.instagaram != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_kxhgpu1n_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'insagaramclickcount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_launch_u_r_l');
                                  await launchURL(
                                      widget!.itemsRefrence!.instagaram);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.instagram,
                                      color: Color(0xFFFD5C0C),
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!
                                            .itemsRefrence!.insagaramclickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget!.itemsRefrence?.snapchat != null &&
                                widget!.itemsRefrence?.snapchat != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_2ewzy1jf_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'snapchatclickcount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_launch_u_r_l');
                                  await launchURL(
                                      widget!.itemsRefrence!.snapchat);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.snapchat_sharp,
                                      color: Color(0xDDE0DC35),
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!
                                            .itemsRefrence!.snapchatclickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget!.itemsRefrence?.tiktok != null &&
                                widget!.itemsRefrence?.tiktok != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_tpy2jbfq_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'tiktokclickcount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_launch_u_r_l');
                                  await launchURL(
                                      widget!.itemsRefrence!.tiktok);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.tiktok_sharp,
                                      color: Colors.black,
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!.itemsRefrence!.tiktokclickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget!.itemsRefrence?.youtube != null &&
                                widget!.itemsRefrence?.youtube != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_izem9f0x_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'youtubeclickcount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_launch_u_r_l');
                                  await launchURL(
                                      widget!.itemsRefrence!.youtube);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.youtubeSquare,
                                      color: Color(0xFFFF0000),
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!
                                            .itemsRefrence!.youtubeclickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget!.itemsRefrence?.email != null &&
                                widget!.itemsRefrence?.email != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_0gug1exn_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'emailclickcount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_launch_u_r_l');
                                  await launchURL(
                                      'mailto:${widget!.itemsRefrence?.email}');
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.mail_outlined,
                                      color: Colors.black,
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!.itemsRefrence!.emailclickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget!.itemsRefrence?.website != null &&
                                widget!.itemsRefrence?.website != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_xkiriase_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'websiteclickcount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_launch_u_r_l');
                                  await launchURL(
                                      widget!.itemsRefrence!.website);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    if (widget!.itemsRefrence?.website !=
                                            null &&
                                        widget!.itemsRefrence?.website != '')
                                      Icon(
                                        Icons.language,
                                        color: Colors.black,
                                        size: 40.0,
                                      ),
                                    Text(
                                      formatNumber(
                                        widget!
                                            .itemsRefrence!.websiteclickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget!.itemsRefrence?.appleStore != null &&
                                widget!.itemsRefrence?.appleStore != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_uj9wjo6y_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'appleStoreClickCount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_launch_u_r_l');
                                  await launchURL(
                                      widget!.itemsRefrence!.appleStore);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.appStoreIos,
                                      color: Color(0xFF51A0D5),
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!
                                            .itemsRefrence!.websiteclickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget!.itemsRefrence?.playstore != null &&
                                widget!.itemsRefrence?.playstore != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_6z97433r_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'playstoreClickCount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_launch_u_r_l');
                                  await launchURL(
                                      widget!.itemsRefrence!.playstore);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.googlePlay,
                                      color: Color(0xFF46EE96),
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!
                                            .itemsRefrence!.websiteclickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if ((widget!.itemsRefrence?.wazemap != null &&
                        widget!.itemsRefrence?.wazemap != '') ||
                    (widget!.itemsRefrence?.googlemap != null &&
                        widget!.itemsRefrence?.googlemap != ''))
                  Align(
                    alignment: AlignmentDirectional(-1.0, -1.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 15.0, 20.0, 0.0),
                      child: Text(
                        () {
                          if (FFAppState().appLanguage == 'KU') {
                            return 'نەخشە';
                          } else if (FFAppState().appLanguage == 'AR') {
                            return 'الخريطة';
                          } else {
                            return 'Map';
                          }
                        }(),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              color: Color(0xFF042072),
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ),
                if ((widget!.itemsRefrence?.wazemap != null &&
                        widget!.itemsRefrence?.wazemap != '') ||
                    (widget!.itemsRefrence?.googlemap != null &&
                        widget!.itemsRefrence?.googlemap != ''))
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            8.0, 10.0, 8.0, 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (widget!.itemsRefrence?.googlemap != null &&
                                widget!.itemsRefrence?.googlemap != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_ww1nkqp4_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'googlemapclickcount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_custom_action');
                                  await actions.openGoogleMapWithFallback(
                                    widget!.itemsRefrence!.latlng!,
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Color(0xFF08AB5B),
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!
                                            .itemsRefrence!.googlemapclickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget!.itemsRefrence?.wazemap != null &&
                                widget!.itemsRefrence?.wazemap != '')
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_PAGE_Column_04o33cf6_ON_TAP');
                                  logFirebaseEvent('Column_backend_call');

                                  await widget!.itemsRefrence!.reference
                                      .update({
                                    ...mapToFirestore(
                                      {
                                        'wazemapclickcount':
                                            FieldValue.increment(1),
                                      },
                                    ),
                                  });
                                  logFirebaseEvent('Column_update_page_state');

                                  safeSetState(() {});
                                  logFirebaseEvent('Column_custom_action');
                                  await actions.openWazeWithFallback(
                                    widget!.itemsRefrence!.latlng!,
                                  );
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.waze,
                                      color: Color(0xFF3993D2),
                                      size: 40.0,
                                    ),
                                    Text(
                                      formatNumber(
                                        widget!
                                            .itemsRefrence!.wazemapclickcount,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                      ),
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                if (widget!.itemsRefrence?.providedby != null &&
                    widget!.itemsRefrence?.providedby != '')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 18.0, 16.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget!.itemsRefrence?.providedby,
                              'providedby',
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
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (widget!.itemsRefrence?.info1 != null &&
                    widget!.itemsRefrence?.info1 != '')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 18.0, 16.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Visibility(
                        visible: widget!.itemsRefrence?.info1 != null &&
                            widget!.itemsRefrence?.info1 != '',
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget!.itemsRefrence?.info1,
                                'info1',
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
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (widget!.itemsRefrence?.info2 != null &&
                    widget!.itemsRefrence?.info2 != '')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 18.0, 16.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Visibility(
                        visible: widget!.itemsRefrence?.info2 != null &&
                            widget!.itemsRefrence?.info2 != '',
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget!.itemsRefrence?.info2,
                                'info2',
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
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (widget!.itemsRefrence?.info3 != null &&
                    widget!.itemsRefrence?.info3 != '')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 18.0, 16.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Visibility(
                        visible: widget!.itemsRefrence?.info3 != null &&
                            widget!.itemsRefrence?.info3 != '',
                        child: Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget!.itemsRefrence?.info3,
                                'info3',
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
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (widget!.itemsRefrence?.info4 != null &&
                    widget!.itemsRefrence?.info4 != '')
                  Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 18.0, 16.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Visibility(
                          visible: widget!.itemsRefrence?.info2 != null &&
                              widget!.itemsRefrence?.info2 != '',
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 10.0, 10.0, 10.0),
                              child: Text(
                                valueOrDefault<String>(
                                  widget!.itemsRefrence?.info4,
                                  'info4',
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
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (widget!.itemsRefrence?.latlng != null)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 250.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF47E0FD),
                      ),
                      child: Builder(builder: (context) {
                        final _googleMapMarker = widget!.itemsRefrence?.latlng;
                        return FlutterFlowGoogleMap(
                          controller: _model.googleMapsController,
                          onCameraIdle: (latLng) => safeSetState(
                              () => _model.googleMapsCenter = latLng),
                          initialLocation: _model.googleMapsCenter ??=
                              widget!.itemsRefrence?.latlng != null
                                  ? widget!.itemsRefrence!.latlng!
                                  : _model.latlng!,
                          markers: [
                            if (_googleMapMarker != null)
                              FlutterFlowMarker(
                                _googleMapMarker.serialize(),
                                _googleMapMarker,
                                () async {
                                  logFirebaseEvent(
                                      'ITEM_VIEW_GoogleMap_9vlits42_ON_MARKER_T');
                                  logFirebaseEvent('GoogleMap_launch_u_r_l');
                                  await launchURL(
                                      'https://www.google.com/maps/dir/?api=1&destination=${functions.latLngToString(widget!.itemsRefrence!.latlng!)}');
                                },
                              ),
                          ],
                          markerColor: GoogleMarkerColor.orange,
                          mapType: MapType.normal,
                          style: GoogleMapStyle.standard,
                          initialZoom: 14.0,
                          allowInteraction: true,
                          allowZoom: true,
                          showZoomControls: true,
                          showLocation: true,
                          showCompass: true,
                          showMapToolbar: true,
                          showTraffic: false,
                          centerMapOnMarkerTap: true,
                        );
                      }),
                    ),
                  ),
                if (widget!.itemsRefrence?.valid != null &&
                    widget!.itemsRefrence?.valid != '')
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 18.0, 16.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              widget!.itemsRefrence?.valid,
                              'VALID',
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
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (widget!.itemsRefrence?.recorddate != null)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 18.0, 16.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0),
                          child: Text(
                            functions
                                .timeAgo(widget!.itemsRefrence!.recorddate!),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 10.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Text(
                            formatNumber(
                              widget!.itemsRefrence!.pageview,
                              formatType: FormatType.decimal,
                              decimalType: DecimalType.automatic,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFF042072),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          color: Color(0xFF042072),
                          size: 24.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ].addToEnd(SizedBox(height: 10.0)),
            ),
          ),
        ),
      ),
    );
  }
}
