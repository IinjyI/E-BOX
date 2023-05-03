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
    apiKey: 'AIzaSyAFONxx8cWSWvO_mKMlJmhmd9QwgBk7YLE',
    appId: '1:1026699769533:web:d32699794d8229b34b69d4',
    messagingSenderId: '1026699769533',
    projectId: 'ebooks--2023',
    authDomain: 'ebooks--2023.firebaseapp.com',
    storageBucket: 'ebooks--2023.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwRn4i86-zBUlhGW-gD8YRhVcnXcvpFCY',
    appId: '1:1026699769533:android:3a43def14b15a5614b69d4',
    messagingSenderId: '1026699769533',
    projectId: 'ebooks--2023',
    storageBucket: 'ebooks--2023.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2pNCYHQ8Jrwm0JwOTznsWD8fytZpGuak',
    appId: '1:1026699769533:ios:a9ed7f6af1832d194b69d4',
    messagingSenderId: '1026699769533',
    projectId: 'ebooks--2023',
    storageBucket: 'ebooks--2023.appspot.com',
    iosClientId: '1026699769533-6h5qk3k88p32an0dm2si8vq5stc22v2d.apps.googleusercontent.com',
    iosBundleId: 'com.ebooks.ebooks',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2pNCYHQ8Jrwm0JwOTznsWD8fytZpGuak',
    appId: '1:1026699769533:ios:a9ed7f6af1832d194b69d4',
    messagingSenderId: '1026699769533',
    projectId: 'ebooks--2023',
    storageBucket: 'ebooks--2023.appspot.com',
    iosClientId: '1026699769533-6h5qk3k88p32an0dm2si8vq5stc22v2d.apps.googleusercontent.com',
    iosBundleId: 'com.ebooks.ebooks',
  );
}
