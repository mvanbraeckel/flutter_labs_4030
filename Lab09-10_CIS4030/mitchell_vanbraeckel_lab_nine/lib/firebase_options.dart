// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAxY0EnaXDVykVxg-dgkLbDEJGlHKfJbkU',
    appId: '1:927937119028:web:ce336c67aba0d05472db61',
    messagingSenderId: '927937119028',
    projectId: 'fir-flutter-codelab-babf5',
    authDomain: 'fir-flutter-codelab-babf5.firebaseapp.com',
    storageBucket: 'fir-flutter-codelab-babf5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRL8ibwX_Gc5u2DR1x7XQvBO5HM0VKeQM',
    appId: '1:927937119028:android:cc0539563d2d0eef72db61',
    messagingSenderId: '927937119028',
    projectId: 'fir-flutter-codelab-babf5',
    storageBucket: 'fir-flutter-codelab-babf5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD0jVxQKB13R4uvX5Wd7YzkIqb4PTCRaX0',
    appId: '1:927937119028:ios:5e1d9ee8c49755d572db61',
    messagingSenderId: '927937119028',
    projectId: 'fir-flutter-codelab-babf5',
    storageBucket: 'fir-flutter-codelab-babf5.appspot.com',
    iosClientId: '927937119028-7hj91gv80a7q8anol7mn569nhg1qdukj.apps.googleusercontent.com',
    iosBundleId: 'com.example.gtkFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD0jVxQKB13R4uvX5Wd7YzkIqb4PTCRaX0',
    appId: '1:927937119028:ios:5e1d9ee8c49755d572db61',
    messagingSenderId: '927937119028',
    projectId: 'fir-flutter-codelab-babf5',
    storageBucket: 'fir-flutter-codelab-babf5.appspot.com',
    iosClientId: '927937119028-7hj91gv80a7q8anol7mn569nhg1qdukj.apps.googleusercontent.com',
    iosBundleId: 'com.example.gtkFlutter',
  );
}