import 'package:chromecast_plus/common/image.dart';
import 'package:chromecast_plus/enums/media_metadata_type.dart';

class GoogleCastMediaMetadata {
  final GoogleCastMediaMetadataType metadataType;
  final List<GoogleCastImage>? images;
  GoogleCastMediaMetadata({
    required this.metadataType,
    this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'metadataType': metadataType.value,
      'images': images?.map((x) => x.toMap()).toList(),
    };
  }
}
