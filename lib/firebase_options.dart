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
    apiKey: 'AIzaSyBITPqlCBBg0cbS84-8aMjce-C2Uc6F4A0',
    appId: '1:793644561911:web:8d20f7cc758c2325b76af2',
    messagingSenderId: '793644561911',
    projectId: 'tasc-d92af',
    authDomain: 'tasc-d92af.firebaseapp.com',
    storageBucket: 'tasc-d92af.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvir29REOJCsVC0sWk4mrJne8jo5cfDv8',
    appId: '1:793644561911:android:9e2100dc8a2d658cb76af2',
    messagingSenderId: '793644561911',
    projectId: 'tasc-d92af',
    storageBucket: 'tasc-d92af.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBkaClUNuvN2bRATpkaLB9DsC30SdZQTPk',
    appId: '1:793644561911:ios:a21f564fae7af4f6b76af2',
    messagingSenderId: '793644561911',
    projectId: 'tasc-d92af',
    storageBucket: 'tasc-d92af.appspot.com',
    iosBundleId: 'com.example.task',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBkaClUNuvN2bRATpkaLB9DsC30SdZQTPk',
    appId: '1:793644561911:ios:08696aba52c72dffb76af2',
    messagingSenderId: '793644561911',
    projectId: 'tasc-d92af',
    storageBucket: 'tasc-d92af.appspot.com',
    iosBundleId: 'com.example.task.RunnerTests',
  );
}
