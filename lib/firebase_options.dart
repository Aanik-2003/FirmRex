// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyDjlNIrmb-kODhAWvJtif-SgUGnknO7uE8',
    appId: '1:713479061757:web:1e66fbc41f4af7732ffe94',
    messagingSenderId: '713479061757',
    projectId: 'firm-rex',
    authDomain: 'firm-rex.firebaseapp.com',
    storageBucket: 'firm-rex.firebasestorage.app',
    measurementId: 'G-73CLLYLMY7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAj7E0dLCw1nyXNqr_EVl2YkHU8BYQflE0',
    appId: '1:713479061757:android:2c904eb657bee06b2ffe94',
    messagingSenderId: '713479061757',
    projectId: 'firm-rex',
    storageBucket: 'firm-rex.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBAe239eTheXFX_qNb4nS3Fj3rbMvJGTlw',
    appId: '1:713479061757:ios:c997ba9512fd995e2ffe94',
    messagingSenderId: '713479061757',
    projectId: 'firm-rex',
    storageBucket: 'firm-rex.firebasestorage.app',
    iosBundleId: 'com.example.dempApp',
  );
}
