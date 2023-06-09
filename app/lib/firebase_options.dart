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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDL29Vpr1BagHcmO_Z2A5vqZvxdvBIl-Pw',
    appId: '1:629556844576:web:413adbbb96e95e4133c445',
    messagingSenderId: '629556844576',
    projectId: 'barclays-finease',
    authDomain: 'barclays-finease.firebaseapp.com',
    storageBucket: 'barclays-finease.appspot.com',
    measurementId: 'G-51CEE6BDB1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQhh6mU8T3SD9snl8bGOun3jiLiVxxz7A',
    appId: '1:629556844576:android:6c6b215ef5a9548533c445',
    messagingSenderId: '629556844576',
    projectId: 'barclays-finease',
    storageBucket: 'barclays-finease.appspot.com',
  );
}
