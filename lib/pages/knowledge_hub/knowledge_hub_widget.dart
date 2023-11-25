import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'knowledge_hub_model.dart';
export 'knowledge_hub_model.dart';

class KnowledgeHubWidget extends StatefulWidget {
  const KnowledgeHubWidget({Key? key}) : super(key: key);

  @override
  _KnowledgeHubWidgetState createState() => _KnowledgeHubWidgetState();
}

class _KnowledgeHubWidgetState extends State<KnowledgeHubWidget> {
  late KnowledgeHubModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => KnowledgeHubModel());
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

    return StreamBuilder<List<PdfFileNamesRecord>>(
      stream: queryPdfFileNamesRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        List<PdfFileNamesRecord> knowledgeHubPdfFileNamesRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final knowledgeHubPdfFileNamesRecord =
            knowledgeHubPdfFileNamesRecordList.isNotEmpty
                ? knowledgeHubPdfFileNamesRecordList.first
                : null;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30.0,
                borderWidth: 1.0,
                buttonSize: 60.0,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 30.0,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Text(
                FFLocalizations.of(context).getText(
                  'al57h8wp' /* Page Title */,
                ),
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Jost',
                      color: FlutterFlowTheme.of(context).primaryText,
                      fontSize: 22.0,
                    ),
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Builder(
                    builder: (context) {
                      final pdfNames =
                          knowledgeHubPdfFileNamesRecord?.names?.toList() ?? [];
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children:
                            List.generate(pdfNames.length, (pdfNamesIndex) {
                          final pdfNamesItem = pdfNames[pdfNamesIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.selectedPDF = pdfNamesItem;
                                });
                              },
                              child: Text(
                                pdfNamesIndex.toString(),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                  FlutterFlowPdfViewer(
                    networkPath:
                        '${FFAppState().pdfBase}${FFLocalizations.of(context).languageCode}%2F${_model.selectedPDF}.pdf?alt=media',
                    height: 495.0,
                    horizontalScroll: false,
                  ),
                  SelectionArea(
                      child: Text(
                    '${FFAppState().pdfBase}${FFLocalizations.of(context).languageCode}%2F${_model.selectedPDF}.pdf?alt=media',
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  )),
                  Text(
                    _model.selectedPDF!,
                    style: FlutterFlowTheme.of(context).bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
