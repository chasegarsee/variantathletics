import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'custom_program_client_list_model.dart';
export 'custom_program_client_list_model.dart';

class CustomProgramClientListWidget extends StatefulWidget {
  const CustomProgramClientListWidget({
    super.key,
    required this.programUserList,
    required this.programRef,
    required this.userList,
  });

  final List<String>? programUserList;
  final DocumentReference? programRef;
  final List<UsersRecord>? userList;

  @override
  State<CustomProgramClientListWidget> createState() =>
      _CustomProgramClientListWidgetState();
}

class _CustomProgramClientListWidgetState
    extends State<CustomProgramClientListWidget> {
  late CustomProgramClientListModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CustomProgramClientListModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Builder(
            builder: (context) {
              final user = widget.userList!
                  .where((e) => !widget.programUserList!.contains(e.uid))
                  .toList();
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(user.length, (userIndex) {
                    final userItem = user[userIndex];
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 2.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await widget.programRef!.update({
                                ...mapToFirestore(
                                  {
                                    'clientIds':
                                        FieldValue.arrayUnion([userItem.uid]),
                                  },
                                ),
                              });
                            },
                            child: Icon(
                              Icons.check_box_outline_blank_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                        Text(
                          userItem.displayName,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    );
                  }),
                ),
              );
            },
          ),
        ),
        SizedBox(
          height: 100.0,
          child: VerticalDivider(
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).accent4,
          ),
        ),
        Expanded(
          child: Builder(
            builder: (context) {
              final user = widget.userList!
                  .where((e) => widget.programUserList!.contains(e.uid))
                  .toList();
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: List.generate(user.length, (userIndex) {
                    final userItem = user[userIndex];
                    return Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 2.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await widget.programRef!.update({
                                ...mapToFirestore(
                                  {
                                    'clientIds':
                                        FieldValue.arrayRemove([userItem.uid]),
                                  },
                                ),
                              });
                            },
                            child: Icon(
                              Icons.check_box_rounded,
                              color: FlutterFlowTheme.of(context).accent2,
                              size: 24.0,
                            ),
                          ),
                        ),
                        Text(
                          userItem.displayName,
                          style: FlutterFlowTheme.of(context).bodyMedium,
                        ),
                      ],
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
