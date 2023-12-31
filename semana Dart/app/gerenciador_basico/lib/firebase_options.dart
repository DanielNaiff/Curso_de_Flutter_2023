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
    apiKey: 'AIzaSyBiy-wKNoVmqgQJxhN3uQBB4tqzzMSSb6A',
    appId: '1:599224600861:web:bb091574c8dece642179f4',
    messagingSenderId: '599224600861',
    projectId: 'curso-flutter-ufpa',
    authDomain: 'curso-flutter-ufpa.firebaseapp.com',
    databaseURL: 'https://curso-flutter-ufpa-default-rtdb.firebaseio.com',
    storageBucket: 'curso-flutter-ufpa.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdu-ossEAMS1M24AN3qGBHyx3rNbf32MY',
    appId: '1:599224600861:android:62c320c82dcae3b32179f4',
    messagingSenderId: '599224600861',
    projectId: 'curso-flutter-ufpa',
    databaseURL: 'https://curso-flutter-ufpa-default-rtdb.firebaseio.com',
    storageBucket: 'curso-flutter-ufpa.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzUjlpwp8PPTCTEwUw1bLGIf5MOggIJQw',
    appId: '1:599224600861:ios:508668793295f7a62179f4',
    messagingSenderId: '599224600861',
    projectId: 'curso-flutter-ufpa',
    databaseURL: 'https://curso-flutter-ufpa-default-rtdb.firebaseio.com',
    storageBucket: 'curso-flutter-ufpa.appspot.com',
    iosClientId: '599224600861-6si3nfdru9o4gt74pfmqfmnfn8i09bfb.apps.googleusercontent.com',
    iosBundleId: 'com.example.semanaFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAzUjlpwp8PPTCTEwUw1bLGIf5MOggIJQw',
    appId: '1:599224600861:ios:2f28b0395a8ea0492179f4',
    messagingSenderId: '599224600861',
    projectId: 'curso-flutter-ufpa',
    databaseURL: 'https://curso-flutter-ufpa-default-rtdb.firebaseio.com',
    storageBucket: 'curso-flutter-ufpa.appspot.com',
    iosClientId: '599224600861-8u8ovunn74m4ro9mjn1lkv1s8vvrjg2f.apps.googleusercontent.com',
    iosBundleId: 'com.example.semanaFlutter.RunnerTests',
  );
}