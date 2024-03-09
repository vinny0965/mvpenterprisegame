import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyCXqYQZ2Iv6K0VK2Qglp-A9KWB0awm5SDY",
            authDomain: "mvp-treinamento-enterpr-bf0xky.firebaseapp.com",
            projectId: "mvp-treinamento-enterpr-bf0xky",
            storageBucket: "mvp-treinamento-enterpr-bf0xky.appspot.com",
            messagingSenderId: "1062553015466",
            appId: "1:1062553015466:web:5549d65369621aaf872cd3"));
  } else {
    await Firebase.initializeApp();
  }
}
