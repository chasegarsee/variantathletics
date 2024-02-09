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
    List<UsersRecord>? usersList,
  });

  final List<String>? programUserList;
  final DocumentReference? programRef;
  final List<UsersRecord>? usersList;

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

    return Builder(
      builder: (context) {
        final user = widget.usersList!.toList();
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: List.generate(user.length, (userIndex) {
              final userItem = user[userIndex];
              return Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Theme(
                    data: ThemeData(
                      checkboxTheme: CheckboxThemeData(
                        visualDensity: VisualDensity.compact,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                      unselectedWidgetColor:
                          FlutterFlowTheme.of(context).primaryText,
                    ),
                    child: Checkbox(
                      value: _model.checkboxValueMap[userItem] ??=
                          widget.programUserList!.contains(userItem.uid),
                      onChanged: (newValue) async {
                        setState(() =>
                            _model.checkboxValueMap[userItem] = newValue!);
                        if (newValue!) {
                          await widget.programRef!.update({
                            ...mapToFirestore(
                              {
                                'clientIds':
                                    FieldValue.arrayUnion([userItem.uid]),
                              },
                            ),
                          });
                        } else {
                          await widget.programRef!.update({
                            ...mapToFirestore(
                              {
                                'clientIds':
                                    FieldValue.arrayRemove([userItem.uid]),
                              },
                            ),
                          });
                        }
                      },
                      activeColor: FlutterFlowTheme.of(context).accent2,
                      checkColor: FlutterFlowTheme.of(context).info,
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
    );
  }
}
