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
    apiKey: 'AIzaSyB7lCW91jh8iWcdijxjIQAAHciolj3pbxw',
    appId: '1:563255320612:web:a58804e8bc85665f2438b1',
    messagingSenderId: '563255320612',
    projectId: 'calico-80b62',
    authDomain: 'calico-80b62.firebaseapp.com',
    storageBucket: 'calico-80b62.appspot.com',
    measurementId: 'G-33XFBTLPVH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVTCRdPZjC5p2dDi_DxihKGvuEycX47wM',
    appId: '1:563255320612:android:1fc9c4683f14bb692438b1',
    messagingSenderId: '563255320612',
    projectId: 'calico-80b62',
    storageBucket: 'calico-80b62.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0AUvZ3SfYmwjZDThDUlJBumfRITvGIoo',
    appId: '1:563255320612:ios:8b8be859a9b6c7802438b1',
    messagingSenderId: '563255320612',
    projectId: 'calico-80b62',
    storageBucket: 'calico-80b62.appspot.com',
    iosClientId:
        '563255320612-tofo2udcfve79fphi602vh6ra0ool0kj.apps.googleusercontent.com',
    iosBundleId: 'com.example.calico',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0AUvZ3SfYmwjZDThDUlJBumfRITvGIoo',
    appId: '1:563255320612:ios:8b8be859a9b6c7802438b1',
    messagingSenderId: '563255320612',
    projectId: 'calico-80b62',
    storageBucket: 'calico-80b62.appspot.com',
    iosClientId:
        '563255320612-tofo2udcfve79fphi602vh6ra0ool0kj.apps.googleusercontent.com',
    iosBundleId: 'com.example.calico',
  );
}
