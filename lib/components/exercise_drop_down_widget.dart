import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/backend/schema/structs/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'exercise_drop_down_model.dart';
export 'exercise_drop_down_model.dart';

class ExerciseDropDownWidget extends StatefulWidget {
  const ExerciseDropDownWidget({
    Key? key,
    required this.exercise,
  }) : super(key: key);

  final String? exercise;

  @override
  _ExerciseDropDownWidgetState createState() => _ExerciseDropDownWidgetState();
}

class _ExerciseDropDownWidgetState extends State<ExerciseDropDownWidget> {
  late ExerciseDropDownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ExerciseDropDownModel());
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
      controller: _model.dropDownValueController ??=
          FormFieldController<String>(
        _model.dropDownValue ??= widget.exercise,
      ),
      options: FFAppState()
          .exercises
          .map((e) => ExercisesStruct.maybeFromMap(e)?.name)
          .withoutNulls
          .toList(),
      onChanged: (val) => setState(() => _model.dropDownValue = val),
      width: 300.0,
      height: 50.0,
      searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium,
      textStyle: FlutterFlowTheme.of(context).bodyMedium,
      hintText: FFLocalizations.of(context).getText(
        '8wquxxn7' /* Please select... */,
      ),
      searchHintText: FFLocalizations.of(context).getText(
        '37csumcw' /* Search for an item... */,
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
      isMultiSelect: false,
    );
  }
}
