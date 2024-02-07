import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subbed_user_list_model.dart';
export 'subbed_user_list_model.dart';

class SubbedUserListWidget extends StatefulWidget {
  const SubbedUserListWidget({
    super.key,
    required this.displayNames,
    required this.userIds,
    required this.programUserIds,
    required this.programId,
  });

  final List<String>? displayNames;
  final List<String>? userIds;
  final List<String>? programUserIds;
  final DocumentReference? programId;

  @override
  State<SubbedUserListWidget> createState() => _SubbedUserListWidgetState();
}

class _SubbedUserListWidgetState extends State<SubbedUserListWidget> {
  late SubbedUserListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubbedUserListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Visibility(
      visible:
          widget.programUserIds != null && (widget.programUserIds)!.isNotEmpty,
      child: FlutterFlowDropDown<String>(
        multiSelectController: _model.dropDownValueController ??=
            FormFieldController<List<String>>(
                _model.dropDownValue ??= List<String>.from(
          functions.clientIdNullSafety(widget.programUserIds!.toList()),
        )),
        options: List<String>.from(widget.userIds!),
        optionLabels: widget.displayNames!,
        width: 300.0,
        height: 50.0,
        maxHeight: 200.0,
        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium,
        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium,
        textStyle: FlutterFlowTheme.of(context).bodyMedium,
        hintText: FFLocalizations.of(context).getText(
          'udiawp38' /* Please select... */,
        ),
        searchHintText: FFLocalizations.of(context).getText(
          'my0caze8' /* Search for an item... */,
        ),
        icon: Icon(
          Icons.keyboard_arrow_down_rounded,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 24.0,
        ),
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 2.0,
        borderColor: FlutterFlowTheme.of(context).alternate,
        borderWidth: 2.0,
        borderRadius: 8.0,
        margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
        hidesUnderline: true,
        isOverButton: true,
        isSearchable: true,
        isMultiSelect: true,
        onMultiSelectChanged: (val) async {
          setState(() => _model.dropDownValue = val);
          await widget.programId!.update({
            ...mapToFirestore(
              {
                'clientIds': _model.dropDownValue,
              },
            ),
          });
        },
      ),
    );
  }
}
