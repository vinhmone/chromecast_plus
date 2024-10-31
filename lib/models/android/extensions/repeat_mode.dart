import 'package:chromecast_plus/lib.dart';

extension GoogleCastRepeatModeAndroid on GoogleCastMediaRepeatMode {
  static GoogleCastMediaRepeatMode fromMap(String value) {
    return GoogleCastMediaRepeatMode.values.firstWhere(
      (element) => element.name.toUpperCase() == value.toUpperCase(),
      orElse: () => GoogleCastMediaRepeatMode.UNCHANGED,
    );
  }
}
