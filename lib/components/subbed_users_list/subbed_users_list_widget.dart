import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subbed_users_list_model.dart';
export 'subbed_users_list_model.dart';

class SubbedUsersListWidget extends StatefulWidget {
  const SubbedUsersListWidget({
    super.key,
    required this.selectedUsers,
    required this.users,
  });

  final List<String>? selectedUsers;
  final List<UsersRecord>? users;

  @override
  State<SubbedUsersListWidget> createState() => _SubbedUsersListWidgetState();
}

class _SubbedUsersListWidgetState extends State<SubbedUsersListWidget> {
  late SubbedUsersListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubbedUsersListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FlutterFlowDropDown<String>(
      multiSelectController: _model.dropDownValueController ??=
          FormFieldController<List<String>>(
              _model.dropDownValue ??= List<String>.from(
        widget.selectedUsers,
      )),
      options: List<String>.from(widget.users!.map((e) => e.uid).toList()),
      optionLabels: widget.users!.map((e) => e.displayName).toList(),
      width: MediaQuery.sizeOf(context).width * 0.35,
      height: 50.0,
      searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
            fontFamily: 'Jost',
            color: FlutterFlowTheme.of(context).primaryText,
          ),
      searchTextStyle: FlutterFlowTheme.of(context).bodyMedium,
      textStyle: FlutterFlowTheme.of(context).bodyMedium,
      hintText: FFLocalizations.of(context).getText(
        'udiawp38' /* Please select... */,
      ),
      searchHintText: FFLocalizations.of(context).getText(
        'mqbzm6x3' /* Search for a client */,
      ),
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).accent2,
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
      onMultiSelectChanged: (val) => setState(() => _model.dropDownValue = val),
    );
  }
}
