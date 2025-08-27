import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

/// Initializes Firebase and configures Firebase Messaging listeners.
class FirebaseMessagingHandler {
  FirebaseMessagingHandler._internal();
  static final FirebaseMessagingHandler instance = FirebaseMessagingHandler._internal();

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized) return;
    await Firebase.initializeApp();
    final messaging = FirebaseMessaging.instance;
    await messaging.requestPermission();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Handle foreground messages if desired.
    });

    _initialized = true;
  }
}

