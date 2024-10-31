import 'package:chromecast_plus/lib.dart';

extension GoogleCastAndroidStreamType on CastMediaStreamType {
  static CastMediaStreamType fromMap(String value) {
    return CastMediaStreamType.values.firstWhere(
      (element) => element.value == value,
      orElse: () => CastMediaStreamType.NONE,
    );
  }
}
