import 'package:chromecast_plus/common/image.dart';
import 'package:chromecast_plus/entities/media_metadata/movie_media_metadata.dart';
import 'package:chromecast_plus/models/android/extensions/date_time.dart';

class GoogleCastMovieMediaMetadataAndroid extends GoogleCastMovieMediaMetadata {
  GoogleCastMovieMediaMetadataAndroid({
    super.images,
    super.releaseDate,
    super.studio,
    super.subtitle,
    super.title,
  });

  factory GoogleCastMovieMediaMetadataAndroid.fromMap(
      Map<String, dynamic> map) {
    return GoogleCastMovieMediaMetadataAndroid(
      title: map['title'],
      subtitle: map['subtitle'],
      studio: map['studio'],
      images: map['images'] != null
          ? List<GoogleCastImage>.from(
              map['images']?.map((x) => GoogleCastImage.fromMap(x)))
          : null,
      releaseDate: map['releaseDate'] != null
          ? DateTimeString.tryParse(map['releaseDate'] ?? '')
          : null,
    );
  }
}
