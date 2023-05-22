import 'dart:convert';

import 'package:chat_app/core/constant.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class  MyNotification {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  void initPushNotification() async {
    await _messaging.requestPermission(
      alert: true,
      sound: true,
      announcement: true,
    );
  kIsWeb ? null :  _messaging.subscribeToTopic('chat');
  }

  Future<void> sendNotification(
      {required String title, required String body}) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': key,
    };
    Map<String, dynamic> notificationBody = {
      "to": "/topics/chat",
      "notification": {
        "title": title,
        "body": body,
      },
    };
    await http.post(
      url,
      headers: header,
      body: jsonEncode(notificationBody),
    );
  }
}
