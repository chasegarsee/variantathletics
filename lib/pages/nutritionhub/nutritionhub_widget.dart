import '/auth/firebase_auth/auth_util.dart';
import '/components/size_demographics_bottom_sheet/size_demographics_bottom_sheet_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nutritionhub_model.dart';
export 'nutritionhub_model.dart';

class NutritionhubWidget extends StatefulWidget {
  const NutritionhubWidget({Key? key}) : super(key: key);

  @override
  _NutritionhubWidgetState createState() => _NutritionhubWidgetState();
}

class _NutritionhubWidgetState extends State<NutritionhubWidget> {
  late NutritionhubModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NutritionhubModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (currentUserDocument!.demographics.age <= 0) {
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          isDismissible: false,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.5,
                  child: SizeDemographicsBottomSheetWidget(),
                ),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));

        return;
      } else {
        return;
      }
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();
    final chartPieChartColorsList1 = [
      FlutterFlowTheme.of(context).error,
      FlutterFlowTheme.of(context).secondaryBackground,
      FlutterFlowTheme.of(context).secondaryBackground
    ];
    final chartPieChartColorsList2 = [
      FlutterFlowTheme.of(context).secondaryBackground,
      FlutterFlowTheme.of(context).warning,
      FlutterFlowTheme.of(context).secondaryBackground
    ];
    final chartPieChartColorsList3 = [
      FlutterFlowTheme.of(context).secondaryBackground,
      FlutterFlowTheme.of(context).secondaryBackground,
      FlutterFlowTheme.of(context).success
    ];
    final chartPieChartColorsList4 = [
      FlutterFlowTheme.of(context).error,
      FlutterFlowTheme.of(context).warning,
      FlutterFlowTheme.of(context).success
    ];
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          title: Text(
            FFLocalizations.of(context).getText(
              'vxvik703' /* Nutrition Hub */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Jost',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    useSafeArea: true,
                    context: context,
                    builder: (context) {
                      return GestureDetector(
                        onTap: () => _model.unfocusNode.canRequestFocus
                            ? FocusScope.of(context)
                                .requestFocus(_model.unfocusNode)
                            : FocusScope.of(context).unfocus(),
                        child: Padding(
                          padding: MediaQuery.viewInsetsOf(context),
                          child: Container(
                            height: MediaQuery.sizeOf(context).height * 0.5,
                            child: SizeDemographicsBottomSheetWidget(),
                          ),
                        ),
                      );
                    },
                  ).then((value) => safeSetState(() {}));
                },
                child: Container(
                  width: 35.0,
                  height: 24.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: FlutterFlowTheme.of(context).accent2,
                      width: 3.0,
                    ),
                  ),
                  child: Icon(
                    Icons.edit_sharp,
                    color: FlutterFlowTheme.of(context).accent2,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              FFLocalizations.of(context).getText(
                                'z5s1tjv4' /* Your Macronutrients */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).titleLarge,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 12.0, 24.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  FFLocalizations.of(context).getText(
                                    'ieuldi79' /* Total Calories */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Jost',
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  FFAppState().macros.totalCalories.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Jost',
                                        color: FlutterFlowTheme.of(context)
                                            .tertiary,
                                      ),
                                ),
                                if (currentUserDocument!.demographics.goal > 0)
                                  AuthUserStreamWidget(
                                    builder: (context) => RichText(
                                      textScaleFactor: MediaQuery.of(context)
                                          .textScaleFactor,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: FFLocalizations.of(context)
                                                .getText(
                                              'mps0uype' /* Based on your goal to  */,
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Jost',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                          TextSpan(
                                            text: () {
                                              if (currentUserDocument
                                                      ?.demographics?.goal ==
                                                  1) {
                                                return FFLocalizations.of(
                                                        context)
                                                    .getVariableText(
                                                  enText: 'lose fat',
                                                  thText: 'ลดไขมัน',
                                                );
                                              } else if (currentUserDocument
                                                      ?.demographics?.goal ==
                                                  2) {
                                                return FFLocalizations.of(
                                                        context)
                                                    .getVariableText(
                                                  enText: 'maintain size',
                                                  thText: 'รักษาน้ำหนัก',
                                                );
                                              } else {
                                                return FFLocalizations.of(
                                                        context)
                                                    .getVariableText(
                                                  enText: 'gain muscle',
                                                  thText: 'เพิ่มกล้ามเนื้อ',
                                                );
                                              }
                                            }(),
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent2,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 12.0, 24.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '5yp8oj9v' /* Protein */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Jost',
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                RichText(
                                  textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: FFAppState()
                                            .macros
                                            .protein
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Jost',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'dyyn9jew' /* g */,
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      )
                                    ],
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.18, 0.45),
                                  child: Container(
                                    width: 50.0,
                                    height: 50.0,
                                    child: FlutterFlowPieChart(
                                      data: FFPieChartData(
                                        values: functions.macroPercentageCalc(
                                            FFAppState().macros.totalCalories,
                                            FFAppState().macros.protein,
                                            FFAppState().macros.carbs,
                                            FFAppState().macros.fat),
                                        colors: chartPieChartColorsList1,
                                        radius: [20.0],
                                        borderColor: [
                                          FlutterFlowTheme.of(context)
                                              .primaryText
                                        ],
                                      ),
                                      donutHoleRadius: 0.0,
                                      donutHoleColor: Colors.transparent,
                                      sectionLabelStyle:
                                          FlutterFlowTheme.of(context)
                                              .headlineSmall
                                              .override(
                                                fontFamily: 'Jost',
                                                fontSize: 14.0,
                                              ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 12.0, 24.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '1mcjm01p' /* Carbs */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Jost',
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                RichText(
                                  textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: FFAppState()
                                            .macros
                                            .carbs
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Jost',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          'bbvvtie3' /* g */,
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      )
                                    ],
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  child: FlutterFlowPieChart(
                                    data: FFPieChartData(
                                      values: functions.macroPercentageCalc(
                                          FFAppState().macros.totalCalories,
                                          FFAppState().macros.protein,
                                          FFAppState().macros.carbs,
                                          FFAppState().macros.fat),
                                      colors: chartPieChartColorsList2,
                                      radius: [20.0],
                                    ),
                                    donutHoleRadius: 0.0,
                                    donutHoleColor: Colors.transparent,
                                    sectionLabelStyle:
                                        FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Jost',
                                              fontSize: 14.0,
                                            ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 12.0, 24.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'qi0gnk6q' /* Fat */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Jost',
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                RichText(
                                  textScaleFactor:
                                      MediaQuery.of(context).textScaleFactor,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            FFAppState().macros.fat.toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Jost',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .success,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            FFLocalizations.of(context).getText(
                                          '1zvm7bif' /* g */,
                                        ),
                                        style: TextStyle(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontWeight: FontWeight.w100,
                                        ),
                                      )
                                    ],
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  child: FlutterFlowPieChart(
                                    data: FFPieChartData(
                                      values: functions.macroPercentageCalc(
                                          FFAppState().macros.totalCalories,
                                          FFAppState().macros.protein,
                                          FFAppState().macros.carbs,
                                          FFAppState().macros.fat),
                                      colors: chartPieChartColorsList3,
                                      radius: [20.0],
                                    ),
                                    donutHoleRadius: 0.0,
                                    donutHoleColor: Colors.transparent,
                                    sectionLabelStyle:
                                        FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Jost',
                                              fontSize: 14.0,
                                            ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.45,
                      height: 175.0,
                      child: FlutterFlowPieChart(
                        data: FFPieChartData(
                          values: functions.macroPercentageCalc(
                              FFAppState().macros.totalCalories,
                              FFAppState().macros.protein,
                              FFAppState().macros.carbs,
                              FFAppState().macros.fat),
                          colors: chartPieChartColorsList4,
                          radius: [70.0],
                        ),
                        donutHoleRadius: 0.0,
                        donutHoleColor: Colors.transparent,
                        sectionLabelType: PieChartSectionLabelType.percent,
                        sectionLabelStyle:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Jost',
                                  fontSize: 14.0,
                                ),
                      ),
                    ),
                    AuthUserStreamWidget(
                      builder: (context) => Container(
                        width: MediaQuery.sizeOf(context).width * 0.45,
                        height: 175.0,
                        child: FlutterFlowLineChart(
                          data: [
                            FFLineChartData(
                              xData: (currentUserDocument?.weightHistory
                                          ?.toList() ??
                                      [])
                                  .map((e) => dateTimeFormat(
                                        'd/M',
                                        e.date,
                                        locale: FFLocalizations.of(context)
                                            .languageCode,
                                      ))
                                  .toList(),
                              yData: (currentUserDocument?.weightHistory
                                          ?.toList() ??
                                      [])
                                  .map((e) => e.weight.toString())
                                  .toList(),
                              settings: LineChartBarData(
                                color: FlutterFlowTheme.of(context).primary,
                                barWidth: 2.0,
                                isCurved: true,
                                preventCurveOverShooting: true,
                                belowBarData: BarAreaData(
                                  show: true,
                                  color: FlutterFlowTheme.of(context).accent2,
                                ),
                              ),
                            )
                          ],
                          chartStylingInfo: ChartStylingInfo(
                            enableTooltip: true,
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            showBorder: false,
                          ),
                          axisBounds: AxisBounds(),
                          xAxisLabelInfo: AxisLabelInfo(
                            title: FFLocalizations.of(context).getText(
                              'pezhvg1t' /* Weight History */,
                            ),
                            titleTextStyle: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 14.0,
                            ),
                          ),
                          yAxisLabelInfo: AxisLabelInfo(),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/vnimc_1.png',
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'ietj7c98' /* Protein */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: functions
                                      .handPortionsCalc(
                                          FFAppState().macros.protein,
                                          currentUserDocument!
                                              .demographics.gender,
                                          'protein')
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Jost',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '4mj2c9es' /* /day */,
                                  ),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/2emqy_5.png',
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: functions
                                      .convertMacroToFoodWeight(
                                          valueOrDefault<int>(
                                            FFAppState().macros.protein,
                                            0,
                                          ),
                                          'protein')
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Jost',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'si8x2l80' /* /g~ */,
                                  ),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/49svh_2.png',
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'jrvbkajw' /* Vegetables */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        RichText(
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: functions
                                    .handPortionsCalc(
                                        FFAppState().macros.carbs,
                                        currentUserDocument!
                                            .demographics.gender,
                                        'veggies')
                                    .toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Jost',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'ohumwb7l' /* /day */,
                                ),
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/x7hc1_7.png',
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        RichText(
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: functions
                                    .convertMacroToFoodWeight(
                                        valueOrDefault<int>(
                                          FFAppState().macros.carbs,
                                          0,
                                        ),
                                        'veggies')
                                    .toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Jost',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'dw3pu35j' /* /g~ */,
                                ),
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/3a9k2_3.png',
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'wwonjlid' /* Carbs */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                        RichText(
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: functions
                                    .handPortionsCalc(
                                        FFAppState().macros.carbs,
                                        currentUserDocument!
                                            .demographics.gender,
                                        'carbs')
                                    .toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Jost',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'orvxjnco' /* /day */,
                                ),
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/dfjsb_6.png',
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        RichText(
                          textScaleFactor:
                              MediaQuery.of(context).textScaleFactor,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: functions
                                    .convertMacroToFoodWeight(
                                        valueOrDefault<int>(
                                          FFAppState().macros.carbs,
                                          0,
                                        ),
                                        'carbs')
                                    .toString(),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Jost',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              TextSpan(
                                text: FFLocalizations.of(context).getText(
                                  'w08t5xmq' /* /g~ */,
                                ),
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              )
                            ],
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/fijek_4.png',
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            FFLocalizations.of(context).getText(
                              'krpc2490' /* Fat */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                          RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: functions
                                      .handPortionsCalc(
                                          FFAppState().macros.fat,
                                          currentUserDocument!
                                              .demographics.gender,
                                          'fat')
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Jost',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    'z9agq4o1' /* /day */,
                                  ),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/k7eg7_8.png',
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          RichText(
                            textScaleFactor:
                                MediaQuery.of(context).textScaleFactor,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: functions
                                      .convertMacroToFoodWeight(
                                          valueOrDefault<int>(
                                            FFAppState().macros.fat,
                                            0,
                                          ),
                                          'fat')
                                      .toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Jost',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                TextSpan(
                                  text: FFLocalizations.of(context).getText(
                                    '0rk4thvn' /* /g~ */,
                                  ),
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                )
                              ],
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
