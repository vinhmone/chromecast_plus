import 'package:flutter_test/flutter_test.dart';
import 'package:chromecast_plus/chromecast_plus.dart';
import 'package:chromecast_plus/chromecast_plus_platform_interface.dart';
import 'package:chromecast_plus/chromecast_plus_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockChromecastPlusPlatform
    with MockPlatformInterfaceMixin
    implements ChromecastPlusPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ChromecastPlusPlatform initialPlatform = ChromecastPlusPlatform.instance;

  test('$MethodChannelChromecastPlus is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelChromecastPlus>());
  });

  test('getPlatformVersion', () async {
    ChromecastPlus chromecastPlusPlugin = ChromecastPlus();
    MockChromecastPlusPlatform fakePlatform = MockChromecastPlusPlatform();
    ChromecastPlusPlatform.instance = fakePlatform;

    expect(await chromecastPlusPlugin.getPlatformVersion(), '42');
  });
}
