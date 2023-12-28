import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'set_edit_field_model.dart';
export 'set_edit_field_model.dart';

class SetEditFieldWidget extends StatefulWidget {
  const SetEditFieldWidget({
    Key? key,
    this.sets,
  }) : super(key: key);

  final String? sets;

  @override
  _SetEditFieldWidgetState createState() => _SetEditFieldWidgetState();
}

class _SetEditFieldWidgetState extends State<SetEditFieldWidget> {
  late SetEditFieldModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SetEditFieldModel());

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
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          labelText: FFLocalizations.of(context).getText(
            '1vt4h2ks' /* Label here... */,
          ),
          labelStyle: FlutterFlowTheme.of(context).labelMedium,
          hintStyle: FlutterFlowTheme.of(context).labelMedium,
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
        validator: _model.textControllerValidator.asValidator(context),
      ),
    );
  }
}
