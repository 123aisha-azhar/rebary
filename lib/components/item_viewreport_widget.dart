import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'item_viewreport_model.dart';
export 'item_viewreport_model.dart';

class ItemViewreportWidget extends StatefulWidget {
  const ItemViewreportWidget({
    super.key,
    required this.data,
    required this.email,
    required this.itemData,
    required this.senderEmail,
    required this.senderPass,
  });

  final List<String>? data;
  final String? email;
  final ServicesRecord? itemData;
  final String? senderEmail;
  final String? senderPass;

  @override
  State<ItemViewreportWidget> createState() => _ItemViewreportWidgetState();
}

class _ItemViewreportWidgetState extends State<ItemViewreportWidget> {
  late ItemViewreportModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemViewreportModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Form(
          key: _model.formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 14.0, 16.0, 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FlutterFlowDropDown<String>(
                  controller: _model.dropDownValueController ??=
                      FormFieldController<String>(null),
                  options: widget!.data!,
                  onChanged: (val) =>
                      safeSetState(() => _model.dropDownValue = val),
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 40.0,
                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.roboto(
                          fontWeight: FontWeight.w800,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: Color(0xFF14181B),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w800,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  hintText: FFLocalizations.of(context).getText(
                    'nupap849' /* جۆری سکاڵا Report */,
                  ),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xFF57636C),
                    size: 24.0,
                  ),
                  fillColor: Color(0xFFF1F4F8),
                  elevation: 2.0,
                  borderColor: Colors.transparent,
                  borderWidth: 0.0,
                  borderRadius: 8.0,
                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                  hidesUnderline: true,
                  isOverButton: false,
                  isSearchable: false,
                  isMultiSelect: false,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 7.0),
                  child: FFButtonWidget(
                    onPressed: (functions
                                .isButtonDisabled(FFAppState().reportTime) ==
                            true)
                        ? null
                        : () async {
                            logFirebaseEvent(
                                'ITEM_VIEWREPORT_COMP___REPORT_BTN_ON_TAP');
                            logFirebaseEvent('Button_validate_form');
                            if (_model.formKey.currentState == null ||
                                !_model.formKey.currentState!.validate()) {
                              return;
                            }
                            if (_model.dropDownValue == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Select your issue from dropdown value ',
                                    style: TextStyle(
                                      color: Color(0xFFE12020),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Colors.white,
                                ),
                              );
                              return;
                            }
                            logFirebaseEvent('Button_alert_dialog');
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('سکاڵاکەت دەنێردرێ'),
                                      content: Text('دڵنیای لەناردنی سکاڵا'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('نەخێر'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('بەڵێ'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              logFirebaseEvent('Button_custom_action');
                              _model.result = await actions.sendEmail(
                                widget!.email!,
                                _model.dropDownValue!,
                                widget!.senderEmail!,
                                widget!.senderPass!,
                                'User Number ${currentPhoneNumber}Name${widget!.itemData?.name}Tittle${widget!.itemData?.title}Job Tittle${widget!.itemData?.jobtitle}City${widget!.itemData?.city}Job${widget!.itemData?.job}Page view${widget!.itemData?.pageview?.toString()}Phone1${widget!.itemData?.phone1}Phone2${widget!.itemData?.phone2}Whatsapp${widget!.itemData?.whatsapp}Facebook${widget!.itemData?.facebook}Instagram${widget!.itemData?.instagaram}Google map${widget!.itemData?.googlemap}Waze map${widget!.itemData?.wazemap}Snap chat${widget!.itemData?.snapchat}Youtube${widget!.itemData?.youtube}Tiktok${widget!.itemData?.tiktok}Website${widget!.itemData?.website}Valid${widget!.itemData?.valid}Info 1${widget!.itemData?.info1}Info 2${widget!.itemData?.info2}dd3${widget!.itemData?.dd3}Search${widget!.itemData?.search}Provided by${widget!.itemData?.providedby}Viber${widget!.itemData?.viber}Email${widget!.itemData?.email}Telegram${widget!.itemData?.telegram}Phone3${widget!.itemData?.phone3}Info3${widget!.itemData?.info3}Info4${widget!.itemData?.info4}Lating${widget!.itemData?.latlng?.toString()}dd4${widget!.itemData?.dd4}dd5${widget!.itemData?.dd5}dd6${widget!.itemData?.dd6}Record Date${widget!.itemData?.recorddate?.toString()}',
                              );
                              logFirebaseEvent('Button_show_snack_bar');
                              ScaffoldMessenger.of(context).clearSnackBars();
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    _model.result!,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                  duration: Duration(milliseconds: 4000),
                                  backgroundColor: Color(0xFF0D3643),
                                ),
                              );
                              logFirebaseEvent('Button_update_app_state');
                              FFAppState().canReport = false;
                              safeSetState(() {});
                              logFirebaseEvent('Button_timer');
                              _model.timerController.onResetTimer();

                              logFirebaseEvent('Button_timer');
                              _model.timerController.onStartTimer();
                              logFirebaseEvent('Button_update_app_state');
                              FFAppState().reportTime = getCurrentTimestamp;
                              safeSetState(() {});
                              logFirebaseEvent('Button_backend_call');

                              await currentUserReference!
                                  .update(createUsersRecordData(
                                reportTTime: FFAppState().reportTime,
                              ));
                            }
                            logFirebaseEvent('Button_close_dialog_drawer_etc');
                            Navigator.pop(context);

                            safeSetState(() {});
                          },
                    text: FFLocalizations.of(context).getText(
                      'x6rhsebx' /* ناردنی سکاڵا Report */,
                    ),
                    options: FFButtonOptions(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: Color(0xFF042072),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
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
                      disabledColor: Color(0x0038A2FF),
                      disabledTextColor: Color(0xFF042072),
                    ),
                  ),
                ),
                if (functions.isButtonDisabled(FFAppState().reportTime) == true)
                  FlutterFlowTimer(
                    initialTime:
                        functions.getRemainingMillis(FFAppState().reportTime),
                    getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                        value,
                        milliSecond: false),
                    controller: _model.timerController,
                    updateStateInterval: Duration(milliseconds: 1000),
                    onChanged: (value, displayTime, shouldUpdate) {
                      _model.timerMilliseconds = value;
                      _model.timerValue = displayTime;
                      if (shouldUpdate) safeSetState(() {});
                    },
                    onEnded: () async {
                      logFirebaseEvent(
                          'ITEM_VIEWREPORT_Timer_mllat0z5_ON_TIMER_');
                      logFirebaseEvent('Timer_update_app_state');
                      FFAppState().canReport = true;
                      safeSetState(() {});
                    },
                    textAlign: TextAlign.start,
                    style: FlutterFlowTheme.of(context).headlineSmall.override(
                          font: GoogleFonts.roboto(
                            fontWeight: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .headlineSmall
                                .fontStyle,
                          ),
                          color: Color(0xFF14181B),
                          letterSpacing: 0.0,
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontWeight,
                          fontStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .fontStyle,
                        ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
