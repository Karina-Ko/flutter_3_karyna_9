import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: "AIzaSyBYEeDpIkAA83Iie6XLfkZmJn8Up_nLuBQ",
    authDomain: "students-220a4.firebaseapp.com",
    databaseURL: "https://students-220a4-default-rtdb.firebaseio.com",
    projectId: "students-220a4",
    storageBucket: "students-220a4.firebasestorage.app",
    messagingSenderId: "926108914640",
    appId: "1:926108914640:web:e8b1cde490ff1fe76b9fd5"
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3mIg1pKGu8eryOEgR_lC9KCRooFgtco8',
    appId: '1:926108914640:android:572a67d768b55faa6b9fd5',
    messagingSenderId: '926108914640',
    projectId: 'com.example.karyna_9',
    databaseURL: 'https://students-220a4-default-rtdb.firebaseio.com',
    storageBucket: 'students-220a4.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBZ2Htr3FqAirF5uqeyKW4Bscz09X5UEFE',
    appId: '1:129185697931:ios:638178fb7078d453f5848e',
    messagingSenderId: '926108914640',
    projectId: 'com.company.appname',
    databaseURL: 'https://students-220a4-default-rtdb.firebaseio.com',
    storageBucket: 'students-220a4.firebasestorage.app',
    iosBundleId: 'com.example.yehortitarenko',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBZ2Htr3FqAirF5uqeyKW4Bscz09X5UEFE',
    appId: '1:129185697931:ios:638178fb7078d453f5848e',
    messagingSenderId: '926108914640',
    projectId: 'com.company.appname',
    databaseURL: 'https://students-220a4-default-rtdb.firebaseio.com',
    storageBucket: 'students-220a4.firebasestorage.app',
    iosBundleId: 'com.example.yehortitarenko',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: "AIzaSyBYEeDpIkAA83Iie6XLfkZmJn8Up_nLuBQ",
    authDomain: "students-220a4.firebaseapp.com",
    databaseURL: "https://students-220a4-default-rtdb.firebaseio.com",
    projectId: "students-220a4",
    storageBucket: "students-220a4.firebasestorage.app",
    messagingSenderId: "926108914640",
    appId: "1:926108914640:web:e8b1cde490ff1fe76b9fd5"
  );
}