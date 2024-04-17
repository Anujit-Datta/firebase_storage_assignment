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
    apiKey: 'AIzaSyDqoOAxnlm79b71l_6t_HhR8YF1HWb4It8',
    appId: '1:413569235366:web:f166231d5057c5ed613767',
    messagingSenderId: '413569235366',
    projectId: 'ostad-works',
    authDomain: 'ostad-works.firebaseapp.com',
    storageBucket: 'ostad-works.appspot.com',
    measurementId: 'G-YJGF89LLBM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDiQAu6_7DUOucgMnMd5rV_bWi5XsIAlrc',
    appId: '1:413569235366:android:6fcc5ff76f8cd816613767',
    messagingSenderId: '413569235366',
    projectId: 'ostad-works',
    storageBucket: 'ostad-works.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCbi3PQl5R5o3aDagBfWDHE-jXIpniQFmA',
    appId: '1:413569235366:ios:7928a5f4b6ad7387613767',
    messagingSenderId: '413569235366',
    projectId: 'ostad-works',
    storageBucket: 'ostad-works.appspot.com',
    iosBundleId: 'com.firebase.storage.assignment.ostad.firebaseStorageAssignment',
  );
}
