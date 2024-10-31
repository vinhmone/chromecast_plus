import 'package:flutter/services.dart';
import 'package:chromecast_plus/entities/cast_options.dart';

import 'google_cast_context_plataform_interface.dart';
import 'dart:developer';

class GoogleCastContextAndroidMethodChannel
    implements GoogleCastContextPlatformInterface {
  final _channel = const MethodChannel('com.chaubacho.chromecast_plus.context');

  @override
  Future<bool> setSharedInstanceWithOptions(
      GoogleCastOptions castOptions) async {
    try {
      final result =
          await _channel.invokeMethod('setSharedInstance', castOptions.toMap());
      print('setSharedInstanceWithOptions initialized with $result');
      return result == true;
    } catch (e, s) {
      print(e);
      print(s);
      log('message', error: e, stackTrace: StackTrace.current);
      rethrow;
    }
  }
}
