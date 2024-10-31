import 'package:chromecast_plus/entities/cast_options.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class GoogleCastContextPlatformInterface extends PlatformInterface {
  GoogleCastContextPlatformInterface() : super(token: Object());

//MARK: - CONTEXT
  Future<bool> setSharedInstanceWithOptions(GoogleCastOptions castOptions);
}
