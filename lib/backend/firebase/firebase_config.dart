import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAfMglyFv6XIuFZeeveaoFWVP8VdcfHYkA",
            authDomain: "meal-idea-esof.firebaseapp.com",
            projectId: "meal-idea-esof",
            storageBucket: "meal-idea-esof.firebasestorage.app",
            messagingSenderId: "144961024769",
            appId: "1:144961024769:web:eb751977746927b13ae100",
            measurementId: "G-DJW82564CD"));
  } else {
    await Firebase.initializeApp();
  }
}
