import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDeeTs5AsU16nwbf4ZKdwAhsssTuDwzfss",
            authDomain: "variant-3baaf.firebaseapp.com",
            projectId: "variant-3baaf",
            storageBucket: "variant-3baaf.appspot.com",
            messagingSenderId: "622115586603",
            appId: "1:622115586603:web:717fd61ee68c4dafed206e",
            measurementId: "G-GLE3YEKQ64"));
  } else {
    await Firebase.initializeApp();
  }
}
