import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyA3-CXbQ9jqhoIedgncM3xah-pp45TrpIU',
    appId: '1:588572568856:web:8ffbd3937eb50bb878426d',
    messagingSenderId: '588572568856',
    projectId: 'wishlist-flutter-45ded',
    authDomain: 'wishlist-flutter-45ded.firebaseapp.com',
    storageBucket: 'wishlist-flutter-45ded.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'ВАШ_ANDROID_API_KEY', // Его можно найти в google-services.json
    appId: 'ВАШ_ANDROID_APP_ID',
    messagingSenderId: '588572568856',
    projectId: 'wishlist-flutter-45ded',
    storageBucket: 'wishlist-flutter-45ded.firebasestorage.app',
  );
}
