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
        // Convert the uid list to a mutable List
        List<dynamic> uidList =
            List.from(responses[responseIndex]['uid'] ?? []);

        // Check if the uid is already in the list
        if (uidList.contains(uid)) {
          // Remove the uid and decrement the count
          uidList.remove(uid);
          responses[responseIndex]['count'] =
              (responses[responseIndex]['count'] ?? 1) - 1;
        } else {
          // Add the uid and increment the count
          uidList.add(uid);
          responses[responseIndex]['count'] =
              (responses[responseIndex]['count'] ?? 0) + 1;
        }

        // Update the uid list and count in the response
        responses[responseIndex]['uid'] = uidList;

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
