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
    apiKey: 'AIzaSyCbX39Bll2m3uvbAwmryNSFjfyEg9trt6Q',
    appId: '1:244318693958:web:abb1c854035ad453e73847',
    messagingSenderId: '244318693958',
    projectId: 'burhanxsalam-apps',
    authDomain: 'burhanxsalam-apps.firebaseapp.com',
    storageBucket: 'burhanxsalam-apps.appspot.com',
    measurementId: 'G-NZ32MHXRT0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDwUxnqr68qsUYo7T8vYSueEED518H_Dok',
    appId: '1:244318693958:android:ee17aa332cdab860e73847',
    messagingSenderId: '244318693958',
    projectId: 'burhanxsalam-apps',
    storageBucket: 'burhanxsalam-apps.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB-OKzH6fV3EJcJot-gi3D4NnWzfPMPElI',
    appId: '1:244318693958:ios:6ab78699141f563be73847',
    messagingSenderId: '244318693958',
    projectId: 'burhanxsalam-apps',
    storageBucket: 'burhanxsalam-apps.appspot.com',
    iosBundleId: 'com.example.cardSaver',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB-OKzH6fV3EJcJot-gi3D4NnWzfPMPElI',
    appId: '1:244318693958:ios:865ea3cbbbe8f7e2e73847',
    messagingSenderId: '244318693958',
    projectId: 'burhanxsalam-apps',
    storageBucket: 'burhanxsalam-apps.appspot.com',
    iosBundleId: 'com.example.cardSaver.RunnerTests',
  );
}