import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'message_emoji_responses_model.dart';
export 'message_emoji_responses_model.dart';

class MessageEmojiResponsesWidget extends StatefulWidget {
  const MessageEmojiResponsesWidget({
    Key? key,
    required this.messageId,
    required this.responses,
  }) : super(key: key);

  final DocumentReference? messageId;
  final List<ResponsesStruct>? responses;

  @override
  _MessageEmojiResponsesWidgetState createState() =>
      _MessageEmojiResponsesWidgetState();
}

class _MessageEmojiResponsesWidgetState
    extends State<MessageEmojiResponsesWidget> {
  late MessageEmojiResponsesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MessageEmojiResponsesModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Material(
      color: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
              child: Container(
                width: 50.0,
                height: 4.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).accent2,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(1.0, -1.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close_sharp,
                              color: FlutterFlowTheme.of(context).accent2,
                              size: 36.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          final response = widget.responses!.toList();
                          return GridView.builder(
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                              childAspectRatio: 1.0,
                            ),
                            scrollDirection: Axis.vertical,
                            itemCount: response.length,
                            itemBuilder: (context, responseIndex) {
                              final responseItem = response[responseIndex];
                              return Align(
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    await widget.messageId!.update({
                                      ...mapToFirestore(
                                        {
                                          'responses': FieldValue.arrayUnion([
                                            getResponsesFirestoreData(
                                              createResponsesStruct(
                                                fieldValues: {
                                                  'count':
                                                      FieldValue.increment(1),
                                                  'uid': FieldValue.arrayUnion(
                                                      [currentUserUid]),
                                                },
                                                clearUnsetFields: false,
                                              ),
                                              true,
                                            )
                                          ]),
                                        },
                                      ),
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    responseItem.response,
                                    style:
                                        FlutterFlowTheme.of(context).bodyMedium,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
