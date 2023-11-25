import '/backend/backend.dart';
import '/components/rev_cat_paywall/rev_cat_paywall_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'knowledge_hub_widget.dart' show KnowledgeHubWidget;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class KnowledgeHubModel extends FlutterFlowModel<KnowledgeHubWidget> {
  ///  Local state fields for this page.

  String? selectedPDF =
      'https://firebasestorage.googleapis.com/v0/b/variant-3baaf.appspot.com/o/pdf%2Fen%2Fvariant_challenge_macro_counting_101.pdf?alt=media';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
