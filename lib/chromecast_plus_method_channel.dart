import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'chromecast_plus_platform_interface.dart';

/// An implementation of [ChromecastPlusPlatform] that uses method channels.
class MethodChannelChromecastPlus extends ChromecastPlusPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('chromecast_plus');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
