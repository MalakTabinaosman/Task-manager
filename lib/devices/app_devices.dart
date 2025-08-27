/// app_devices.dart
///
/// Device utilities to query platform and sizing info.
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/widgets.dart';

class AppDevices {
  AppDevices._();

  static bool get isWeb => kIsWeb;
  static bool get isAndroid => !kIsWeb && Platform.isAndroid;
  static bool get isIOS => !kIsWeb && Platform.isIOS;
  static bool get isDesktop => !kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS);

  static Size screenSize(BuildContext context) => MediaQuery.sizeOf(context);
}

