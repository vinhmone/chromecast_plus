import 'package:chromecast_plus/lib.dart';

class GoogleCastOptionsAndroid extends GoogleCastOptions {
  final String? appId;
  GoogleCastOptionsAndroid({
    this.appId,
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'appId': appId,
    };
  }
}
