import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class NotificationService {
  static final NotificationService _notificationService =
  NotificationService._internal();
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();
  Future<void> init() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('ic_launcher');

    // final IOSInitializationSettings initializationSettingsIOS =
    // IOSInitializationSettings(
    //   requestSoundPermission: false,
    //   requestBadgePermission: false,
    //   requestAlertPermission: false,
    //   onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    // );

    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: null,
        macOS: null);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (details) {
          print(details);
        } ,);
  }
  showNotification(String msg) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
         'Deliveries',   //Required for Android 8.0 or after
         "Deliveries", //Required for Android 8.0 or after
        channelDescription: "details about you deliveries", //Required for Android 8.0 or after
        importance:Importance.max ,
        priority: Priority.max
    );
    // const IOSNotificationDetails iOSPlatformChannelSpecifics =
    // IOSNotificationDetails(
    //     presentAlert: bool?,  // Present an alert when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
    //     presentBadge: bool?,  // Present the badge number when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
    //     presentSound: bool?,  // Play a sound when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
    //     sound: String?,  // Specifics the file path to play (only from iOS 10 onwards)
    //     badgeNumber: int?, // The application's icon badge number
    //     attachments: List<IOSNotificationAttachment>?, (only from iOS 10 onwards)
    //     subtitle: String?, //Secondary description  (only from iOS 10 onwards)
    //     threadIdentifier: String? (only from iOS 10 onwards)
    // );
     NotificationDetails platformChannelSpecifics =
    NotificationDetails(android:androidPlatformChannelSpecifics);

    // OR
    //
    // const NotificationDetails platformChannelSpecifics =
    // NotificationDetails(iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(1,
         "OnTimeDining",msg, platformChannelSpecifics, payload: null);
  }
}