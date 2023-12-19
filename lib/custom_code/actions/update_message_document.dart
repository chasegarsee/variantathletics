// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';

Future updateMessageDocument(
  String messageId,
  int responseIndex,
  String uid,
) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final DocumentReference messageRef =
      firestore.collection('messages').doc(messageId);

  try {
    // Fetch the current message data
    DocumentSnapshot messageSnapshot = await messageRef.get();

    if (messageSnapshot.exists) {
      // Get the current responses array
      List<dynamic> responses = messageSnapshot['responses'];

      if (responseIndex >= 0 && responseIndex < responses.length) {
        // Increment the count in the specified response
        responses[responseIndex]['count'] =
            (responses[responseIndex]['count'] ?? 0) + 1;

        // Add the new UID to the uid array in the same response
        (responses[responseIndex]['uid'] as List).add(uid);

        // Update the 'responses' field in Firestore
        await messageRef.update({'responses': responses});
      } else {
        throw ArgumentError('Invalid responseIndex');
      }
    } else {
      throw StateError('Message not found');
    }
  } catch (e) {
    print('Error updating message document: $e');
    // Handle errors as needed
  }
}
