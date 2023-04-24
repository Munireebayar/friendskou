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
    apiKey: 'AIzaSyB0R9LruyE-Om9fEnkRaIrglcOq5Fpw2ME',
    appId: '1:663021204331:web:14af0a4dc390089c01122e',
    messagingSenderId: '663021204331',
    projectId: 'friendskou',
    authDomain: 'friendskou.firebaseapp.com',
    storageBucket: 'friendskou.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBYW-lurWsI4CPLPovtj9OVStjoyYqghKw',
    appId: '1:663021204331:android:c69e2a7c8697f7d601122e',
    messagingSenderId: '663021204331',
    projectId: 'friendskou',
    storageBucket: 'friendskou.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBxLP1ziLYNrcIG_v8d2ILHjHQhAsNMHc',
    appId: '1:663021204331:ios:c6d06ddff957312c01122e',
    messagingSenderId: '663021204331',
    projectId: 'friendskou',
    storageBucket: 'friendskou.appspot.com',
    iosClientId: '663021204331-ke70mfpo6b2omvs4ljeah5j08gsfs87p.apps.googleusercontent.com',
    iosBundleId: 'com.example.friendskou',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBxLP1ziLYNrcIG_v8d2ILHjHQhAsNMHc',
    appId: '1:663021204331:ios:c6d06ddff957312c01122e',
    messagingSenderId: '663021204331',
    projectId: 'friendskou',
    storageBucket: 'friendskou.appspot.com',
    iosClientId: '663021204331-ke70mfpo6b2omvs4ljeah5j08gsfs87p.apps.googleusercontent.com',
    iosBundleId: 'com.example.friendskou',
  );
}