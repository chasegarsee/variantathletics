import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'set_editor_model.dart';
export 'set_editor_model.dart';

class SetEditorWidget extends StatefulWidget {
  const SetEditorWidget({
    Key? key,
    this.sets,
    required this.exersiseIndex,
  }) : super(key: key);

  final String? sets;
  final int? exersiseIndex;

  @override
  _SetEditorWidgetState createState() => _SetEditorWidgetState();
}

class _SetEditorWidgetState extends State<SetEditorWidget> {
  late SetEditorModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetEditorModel());

    _model.textController ??= TextEditingController(text: widget.sets);
    _model.textFieldFocusNode ??= FocusNode();
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
      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
      child: TextFormField(
        controller: _model.textController,
        focusNode: _model.textFieldFocusNode,
        onChanged: (_) => EasyDebounce.debounce(
          '_model.textController',
          Duration(milliseconds: 1000),
          () async {
            setState(() {
              FFAppState().updateEditProgramSelectedDayStruct(
                (e) => e
                  ..updateExercises(
                    (e) => e[widget.exersiseIndex!]
                      ..sets = _model.textController.text,
                  ),
              );
            });
          },
        ),
        textInputAction: TextInputAction.done,
        obscureText: false,
        decoration: InputDecoration(
          labelText: FFLocalizations.of(context).getText(
            'dhvsd13m' /* Label here... */,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).alternate,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).primary,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: FlutterFlowTheme.of(context).error,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
        style: FlutterFlowTheme.of(context).bodyMedium,
        maxLength: 3,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
