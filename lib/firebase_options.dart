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
    apiKey: 'AIzaSyAORO7X4JJoRlIymWGihUiCWnPJlYAsb0k',
    appId: '1:481371803804:web:bd1824ba13a9d225291d59',
    messagingSenderId: '481371803804',
    projectId: 'expensivetracker-52969',
    authDomain: 'expensivetracker-52969.firebaseapp.com',
    storageBucket: 'expensivetracker-52969.appspot.com',
    measurementId: 'G-9Y40XVFXE2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB78XyCQGXhmgcekYwFyVyJ06oQYY08tcs',
    appId: '1:481371803804:android:8d630b7ab3c5f2c3291d59',
    messagingSenderId: '481371803804',
    projectId: 'expensivetracker-52969',
    storageBucket: 'expensivetracker-52969.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQ4Hf478FK-PnNhbiFd2kiixm9K7te3YY',
    appId: '1:481371803804:ios:4cd7ea7594a367e7291d59',
    messagingSenderId: '481371803804',
    projectId: 'expensivetracker-52969',
    storageBucket: 'expensivetracker-52969.appspot.com',
    iosBundleId: 'com.example.expensivetracker',
  );
}