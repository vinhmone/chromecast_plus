import 'package:chromecast_plus/lib.dart';

extension GoogleCastTrackTypeAndroid on TrackType {
  static fromMap(String value) {
    return TrackType.values.firstWhere(
      (element) => element.name.toUpperCase() == value.toUpperCase(),
      orElse: () => TrackType.UNKNOWN,
    );
  }
}
