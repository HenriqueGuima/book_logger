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
    apiKey: 'AIzaSyDIneXRnqMZlPNvSNNFv4UKTmL76Vwu4uw',
    appId: '1:357485395058:web:63fbb7046cfaf1dbde16eb',
    messagingSenderId: '357485395058',
    projectId: 'book-logger-1ac67',
    authDomain: 'book-logger-1ac67.firebaseapp.com',
    storageBucket: 'book-logger-1ac67.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBq2D9nc4DBxjOuDadk8o0k_7-NgtImRuA',
    appId: '1:357485395058:android:67194fd62ada2161de16eb',
    messagingSenderId: '357485395058',
    projectId: 'book-logger-1ac67',
    storageBucket: 'book-logger-1ac67.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_HvE8IFn84u_gisohRs7FJsw0omMewvA',
    appId: '1:357485395058:ios:77fb6ec4c25f67cfde16eb',
    messagingSenderId: '357485395058',
    projectId: 'book-logger-1ac67',
    storageBucket: 'book-logger-1ac67.appspot.com',
    iosClientId: '357485395058-9kpsdmd19g1d1pd9adu82ljacml7b50q.apps.googleusercontent.com',
    iosBundleId: 'com.example.bookLogger',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD_HvE8IFn84u_gisohRs7FJsw0omMewvA',
    appId: '1:357485395058:ios:77fb6ec4c25f67cfde16eb',
    messagingSenderId: '357485395058',
    projectId: 'book-logger-1ac67',
    storageBucket: 'book-logger-1ac67.appspot.com',
    iosClientId: '357485395058-9kpsdmd19g1d1pd9adu82ljacml7b50q.apps.googleusercontent.com',
    iosBundleId: 'com.example.bookLogger',
  );
}
