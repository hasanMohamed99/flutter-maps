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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAYZjqjv1Zn69cGl-2zjiMNi6L9xTRiJVg',
    appId: '1:1056692094362:web:3ce12c12bf10a9dcd2a623',
    messagingSenderId: '1056692094362',
    projectId: 'flutter-maps-a6ace',
    authDomain: 'flutter-maps-a6ace.firebaseapp.com',
    storageBucket: 'flutter-maps-a6ace.appspot.com',
    measurementId: 'G-0Y871LZ8V5',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyALQyEwznRrB05FV9zv0DCRX2W3wKqG6n8',
    appId: '1:1056692094362:android:d32f8098304875ded2a623',
    messagingSenderId: '1056692094362',
    projectId: 'flutter-maps-a6ace',
    storageBucket: 'flutter-maps-a6ace.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAoOjXiX3c82bScUKkrYjHTcyzYZj3eQ54',
    appId: '1:1056692094362:ios:962de1acccb27e93d2a623',
    messagingSenderId: '1056692094362',
    projectId: 'flutter-maps-a6ace',
    storageBucket: 'flutter-maps-a6ace.appspot.com',
    iosClientId: '1056692094362-rjqtr2shg3orqm0qolq3r36vjlobqdgu.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterMaps',
  );
}