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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCalEF3cV8ePMjkmMbskMTTMzFo2P1Jkrc',
    appId: '1:1047475993563:web:68424e9d1fe6cdab1e85fe',
    messagingSenderId: '1047475993563',
    projectId: 'bkp-app-269c8',
    authDomain: 'bkp-app-269c8.firebaseapp.com',
    storageBucket: 'bkp-app-269c8.appspot.com',
    measurementId: 'G-1TYC6FS7TT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCMpGrrjLMFKO79Yt33gz4QzCPrQ89fvi0',
    appId: '1:1047475993563:android:1cb60b24fa53a0881e85fe',
    messagingSenderId: '1047475993563',
    projectId: 'bkp-app-269c8',
    storageBucket: 'bkp-app-269c8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBcvzFUuUYgv3JJubzTHQsjRbj3rT-mu-Q',
    appId: '1:1047475993563:ios:33bb43dd914e39501e85fe',
    messagingSenderId: '1047475993563',
    projectId: 'bkp-app-269c8',
    storageBucket: 'bkp-app-269c8.appspot.com',
    iosClientId: '1047475993563-i7o5hpl4p2mkh0tpa7vqtj8se9mngc45.apps.googleusercontent.com',
    iosBundleId: 'com.example.bkp',
  );
}