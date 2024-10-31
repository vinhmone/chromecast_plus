import 'dart:io';

import 'package:chromecast_plus/_google_cast_context/android_google_cast_context_method_channel.dart';
import 'package:chromecast_plus/_google_cast_context/google_cast_context_plataform_interface.dart';

import 'ios_google_cast_context_method_channel.dart';

class GoogleCastContext {
  static final GoogleCastContextPlatformInterface _instance = Platform.isAndroid
      ? GoogleCastContextAndroidMethodChannel()
      : FlutterIOSGoogleCastContextMethodChannel();

  static GoogleCastContextPlatformInterface instance = _instance;

  GoogleCastContext._();
}
