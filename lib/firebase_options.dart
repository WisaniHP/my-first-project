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
    apiKey: 'AIzaSyDefgZLJ3lEwKBY2NIKjMoVN9Fgy6BU4us',
    appId: '1:1021431666991:web:732f3a52d8f11fd6a469da',
    messagingSenderId: '1021431666991',
    projectId: 'authentication-bd39d',
    authDomain: 'authentication-bd39d.firebaseapp.com',
    storageBucket: 'authentication-bd39d.appspot.com',
    measurementId: 'G-9RSH2XTE94',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCj5R5I9z8TpaqyT3oq5mL39hLBosAbz8U',
    appId: '1:1021431666991:android:5f5b917c48e3e863a469da',
    messagingSenderId: '1021431666991',
    projectId: 'authentication-bd39d',
    storageBucket: 'authentication-bd39d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD70LMgj3ZGYEA0XUWF4SFcTkipZ7TegZs',
    appId: '1:1021431666991:ios:80202210adc683d1a469da',
    messagingSenderId: '1021431666991',
    projectId: 'authentication-bd39d',
    storageBucket: 'authentication-bd39d.appspot.com',
    iosClientId: '1021431666991-onkhancvu20s0h3aitfnh7c114di9tt7.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginPage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD70LMgj3ZGYEA0XUWF4SFcTkipZ7TegZs',
    appId: '1:1021431666991:ios:80202210adc683d1a469da',
    messagingSenderId: '1021431666991',
    projectId: 'authentication-bd39d',
    storageBucket: 'authentication-bd39d.appspot.com',
    iosClientId: '1021431666991-onkhancvu20s0h3aitfnh7c114di9tt7.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginPage',
  );
}
