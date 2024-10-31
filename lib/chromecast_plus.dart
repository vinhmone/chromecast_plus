
import 'chromecast_plus_platform_interface.dart';

class ChromecastPlus {
  Future<String?> getPlatformVersion() {
    return ChromecastPlusPlatform.instance.getPlatformVersion();
  }
}
