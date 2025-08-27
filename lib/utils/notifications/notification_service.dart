import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tzdata;

/// Provides initialization and scheduling for local notifications.
/// This pairs with Firebase Messaging for push handling.
class NotificationService {
  NotificationService._internal();
  static final NotificationService instance = NotificationService._internal();

  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  /// Initializes timezones and local notifications for the platform.
  Future<void> initialize() async {
    if (_initialized) return;
    tzdata.initializeTimeZones();

    const AndroidInitializationSettings android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings ios = DarwinInitializationSettings();
    const InitializationSettings settings = InitializationSettings(android: android, iOS: ios);
    await _plugin.initialize(settings);
    _initialized = true;
  }

  /// Schedules a notification at [scheduled] with optional [repeatInterval] in days.
  Future<void> schedule(
    String id,
    String title,
    String body,
    DateTime scheduled, {
    int? repeatDays,
  }) async {
    if (!_initialized) await initialize();
    final tz.TZDateTime when = tz.TZDateTime.from(scheduled, tz.local);
    final int notifId = _stableId(id);
    const androidDetails = AndroidNotificationDetails(
      'tasks_channel',
      'Tasks',
      channelDescription: 'Task reminders',
      importance: Importance.high,
      priority: Priority.high,
    );
    const iosDetails = DarwinNotificationDetails();
    const details = NotificationDetails(android: androidDetails, iOS: iosDetails);

    if (repeatDays != null && repeatDays > 0) {
      await _plugin.zonedSchedule(
        notifId,
        title,
        body,
        when,
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );
    } else {
      await _plugin.zonedSchedule(
        notifId,
        title,
        body,
        when,
        details,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
  }

  /// Cancels a scheduled notification for task with [id].
  Future<void> cancel(String id) async {
    if (!_initialized) await initialize();
    await _plugin.cancel(_stableId(id));
  }

  int _stableId(String id) => id.hashCode & 0x7FFFFFFF;
}

