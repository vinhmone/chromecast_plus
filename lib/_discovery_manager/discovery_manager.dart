import 'dart:io';
import 'package:chromecast_plus/_discovery_manager/android_discovery_manager.dart';
import 'package:chromecast_plus/_discovery_manager/discovery_manager_platform_interface.dart';
import 'package:chromecast_plus/_discovery_manager/ios_discovery_manager.dart';

class GoogleCastDiscoveryManager {
  static final _instance = Platform.isAndroid
      ? GoogleCastDiscoveryManagerMethodChannelAndroid()
      : GoogleCastDiscoveryManagerMethodChannelIOS();

  static GoogleCastDiscoveryManagerPlatformInterface get instance => _instance;

  GoogleCastDiscoveryManager._();
}
