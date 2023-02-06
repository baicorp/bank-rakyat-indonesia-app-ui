import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

initializeNotification() async {
  final fcm = FirebaseMessaging.instance;
  debugPrint(
      "Token: ${(await FirebaseMessaging.instance.getToken()).toString()}");

  final message = await fcm.getInitialMessage();
  if (message != null) {
    final data = message.data;
    debugPrint("Kamu bisa melakukan apapun pada data! $data");
  }

  try {
    if (Platform.isAndroid) {
      await fcm.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      await fcm.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );

      FirebaseMessaging.onMessage.listen(_onMessage);
      FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(_onOpened);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}

void _onMessage(RemoteMessage message) async {
  debugPrint("Foreground: Kamu menerima pesan! ${message.notification?.title}");
  debugPrint("${message.notification?.body}");
}

Future<void> _onBackgroundMessage(RemoteMessage message) async {
  debugPrint("Background: amu menerima pesan! ${message.notification?.title}");
  debugPrint("${message.notification?.body}");
}

void _onOpened(RemoteMessage message) async {
  final data = message.data;
  debugPrint("OnOpened: Anda membuka aplikasi melalui Notifikasi! $data");
}
