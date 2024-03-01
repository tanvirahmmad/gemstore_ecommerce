import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationManager {
  static final NotificationManager _instance = NotificationManager._internal();

  NotificationManager._internal();

  factory NotificationManager() {
    return _instance;
  }

  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  NotificationDetails? _notificationDetails;

  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  Future<void> init() async {
    _flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestNotificationsPermission();
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('launch_background');

    const InitializationSettings initializationSettings = InitializationSettings(android: initializationSettingsAndroid);

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);

    const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
      'himel_channel',
      'himel_channel_name',
      channelDescription: 'himel_channel_desc',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    _notificationDetails = const NotificationDetails(android: androidNotificationDetails);

  }

  Future<void> showNotification({
    required String title,
    required String description,
  }) async {
    await _flutterLocalNotificationsPlugin.show(
      Random().nextInt(10000000),
      title,
      description,
      _notificationDetails,
      payload: 'item x',
    );
  }
}
