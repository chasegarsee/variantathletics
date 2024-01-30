import '/components/kg_input/kg_input_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'workout_set_list_item_model.dart';
export 'workout_set_list_item_model.dart';

class WorkoutSetListItemWidget extends StatefulWidget {
  const WorkoutSetListItemWidget({
    super.key,
    this.listIndex,
    required this.setItem,
    required this.exerciseIndex,
    int? complete,
  }) : this.complete = complete ?? 0;

  final int? listIndex;
  final String? setItem;
  final int? exerciseIndex;
  final int complete;

  @override
  State<WorkoutSetListItemWidget> createState() =>
      _WorkoutSetListItemWidgetState();
}

class _WorkoutSetListItemWidgetState extends State<WorkoutSetListItemWidget> {
  late WorkoutSetListItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WorkoutSetListItemModel());
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
      padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 5.0),
      child: Material(
        color: Colors.transparent,
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 75.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: FlutterFlowTheme.of(context).accent1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Text(
                      functions.indexPlusOne(widget.listIndex!).toString(),
                      style: FlutterFlowTheme.of(context).bodyMedium,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          widget.setItem!,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '0ongiyg0' /* reps */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: wrapWithModel(
                  model: _model.kgInputModel,
                  updateCallback: () => setState(() {}),
                  updateOnChange: true,
                  child: KgInputWidget(),
                ),
              ),
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Visibility(
                  visible: _model.kgInputModel.textController.text != null &&
                      _model.kgInputModel.textController.text != '',
                  child: Switch.adaptive(
                    value: _model.switchValue ??= false,
                    onChanged: (newValue) async {
                      setState(() => _model.switchValue = newValue!);
                      if (newValue!) {
                        if (_model.kgInputModel.textController.text != null &&
                            _model.kgInputModel.textController.text != '') {
                          setState(() {
                            _model.isComplete = !_model.isComplete;
                          });
                          _model.completedCopy =
                              await actions.updateSetsComplete(
                            widget.complete,
                          );
                        }

                        setState(() {});
                      }
                    },
                    activeColor: FlutterFlowTheme.of(context).primary,
                    activeTrackColor: FlutterFlowTheme.of(context).accent1,
                    inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                    inactiveThumbColor:
                        FlutterFlowTheme.of(context).secondaryText,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
