import 'dart:io';

import 'package:chromecast_plus/_remote_media_client/remote_media_client_platform.dart';

import 'android_remote_media_client_method_channel.dart';
import 'ios_remote_media_client_method_channel.dart';

class GoogleCastRemoteMediaClient {
  GoogleCastRemoteMediaClient._();

  static final GoogleCastRemoteMediaClientPlatformInterface _instance =
      Platform.isAndroid
          ? GoogleCastRemoteMediaClientAndroidMethodChannel()
          : GoogleCastRemoteMediaClientIOSMethodChannel();

  static GoogleCastRemoteMediaClientPlatformInterface get instance => _instance;
}
