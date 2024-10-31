import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'chromecast_plus_method_channel.dart';

abstract class ChromecastPlusPlatform extends PlatformInterface {
  /// Constructs a ChromecastPlusPlatform.
  ChromecastPlusPlatform() : super(token: _token);

  static final Object _token = Object();

  static ChromecastPlusPlatform _instance = MethodChannelChromecastPlus();

  /// The default instance of [ChromecastPlusPlatform] to use.
  ///
  /// Defaults to [MethodChannelChromecastPlus].
  static ChromecastPlusPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ChromecastPlusPlatform] when
  /// they register themselves.
  static set instance(ChromecastPlusPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
