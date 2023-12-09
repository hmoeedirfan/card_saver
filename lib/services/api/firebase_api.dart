// ignore_for_file: unused_local_variable

import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
}

class FirebaseApi {
  // create a instance of firebase messaging
  final firebaseMessaging = FirebaseMessaging.instance;

  // function to initalize notifications
  Future<void> initNotifications() async {
    // request permission from user
    await firebaseMessaging.requestPermission();

    // fetch the fCM token for this device
    final fCMToken = await firebaseMessaging.getToken();

    // print the token
    initPushNotification();
  }

  // function to handle received messages
  void handleMessage(RemoteMessage? message) {
    // if message is null, do nothing
    if (message == null) return;

    // navigates to new screen, when message is received and user taps notification
  }

  // function to initalize background settings
  Future initPushNotification() async {
    // handle notification if the app was terminated and now opened
    FirebaseMessaging.instance.getInitialMessage().then((handleMessage));

    // attach event listeners for when a notification opens the app
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }
}
