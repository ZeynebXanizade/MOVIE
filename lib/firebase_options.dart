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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDFduM92t-QdTbLcUgHi_dhwSlUz1FowKI',
    appId: '1:558979670593:web:de3098d0b62ab8b3479cc0',
    messagingSenderId: '558979670593',
    projectId: 'myfirstproject-de63f',
    authDomain: 'myfirstproject-de63f.firebaseapp.com',
    storageBucket: 'myfirstproject-de63f.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD6ww4HdFqsc2fYEh3f2rysBifMVmTRsKo',
    appId: '1:558979670593:android:1e9875fc5ebcf559479cc0',
    messagingSenderId: '558979670593',
    projectId: 'myfirstproject-de63f',
    storageBucket: 'myfirstproject-de63f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDO3YDgco-QADDohuBFKITSbhKEBslAzB0',
    appId: '1:558979670593:ios:695d870550f5ec82479cc0',
    messagingSenderId: '558979670593',
    projectId: 'myfirstproject-de63f',
    storageBucket: 'myfirstproject-de63f.appspot.com',
    iosBundleId: 'com.example.movieDovie',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDO3YDgco-QADDohuBFKITSbhKEBslAzB0',
    appId: '1:558979670593:ios:695d870550f5ec82479cc0',
    messagingSenderId: '558979670593',
    projectId: 'myfirstproject-de63f',
    storageBucket: 'myfirstproject-de63f.appspot.com',
    iosBundleId: 'com.example.movieDovie',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDFduM92t-QdTbLcUgHi_dhwSlUz1FowKI',
    appId: '1:558979670593:web:f3cb92a397be549f479cc0',
    messagingSenderId: '558979670593',
    projectId: 'myfirstproject-de63f',
    authDomain: 'myfirstproject-de63f.firebaseapp.com',
    storageBucket: 'myfirstproject-de63f.appspot.com',
  );
}