import 'package:chromecast_plus/common/live_seekable_range.dart';
import 'package:chromecast_plus/enums/repeat_mode.dart';
import 'package:chromecast_plus/entities/media_information.dart';
import 'package:chromecast_plus/enums/idle_reason.dart';
import 'package:chromecast_plus/enums/player_state.dart';
import 'break_status.dart';

class GoggleCastMediaStatus {
  ///Unique ID for the playback of this specific session. This ID is
  /// set by the receiver at LOAD and can be used to identify a
  /// specific instance of a playback. For example, two playbacks of
  ///  "Wish you were here" within the same session would each have
  ///  a unique mediaSessionId.
  final int mediaSessionID;

  ///Describes the state of the player as one of the following:[CastMediaPlayerState]
  final CastMediaPlayerState playerState;

  ///optional If the playerState is IDLE and the reason it
  ///became IDLE is known, this property is provided. If the
  /// player is IDLE because it just started, this property
  /// will not be provided; if the player is in any other
  /// state this property should not be provided.
  ///  The following values apply:
  final GoogleCastMediaIdleReason? idleReason;

  ///Indicates whether the media time is progressing, and at what
  /// rate. This is independent of the player state since the media
  /// time can stop in any state. 1.0 is regular time, 0.5 is slow motion
  final num playbackRate;

  final GoogleCastMediaInformation? mediaInformation;

  ///The current position of the media player since
  /// the beginning of the content, in seconds.
  ///  If this a live stream content, then this
  /// field represents the time in seconds from
  /// the beginning of the event that should be
  ///  known to the player.

  ///Stream volume
  final num volume;

  // the stream muted state
  final bool isMuted;

  ///The repeat mode for playing the queue.
  final GoogleCastMediaRepeatMode repeatMode;

  ///Item ID of the item that
  /// was active in the queue (it may not be playing)
  ///  at the time the media status change happened.
  final int? currentItemId;

  ///List of IDs corresponding to the active Tracks.
  final List<int>? activeTrackIds;

  ///Status of a break when a break is playing
  /// on the receiver. This field will be
  /// defined when the receiver is playing
  /// a break, empty when a break is not playing,
  ///  but is present in the content, and
  /// undefined if the content contains
  /// no breaks.
  final GoogleCastBrakeStatus? adBreakStatus;

  ///Seekable range of a live or event stream. I
  ///t uses relative media time in seconds.
  ///It will be undefined for VOD streams.
  final GoogleCastMediaLiveSeekableRange? liveSeekableRange;

  ///Item ID of the item that is currently loading
  /// on the receiver. Null if no item is currently
  /// loading.

  /// Queue data
  // final GoogleCastMediaQueueData? queueData;
  GoggleCastMediaStatus({
    required this.mediaSessionID,
    required this.playerState,
    this.idleReason,
    required this.playbackRate,
    this.mediaInformation,
    required this.volume,
    required this.isMuted,
    required this.repeatMode,
    this.currentItemId,
    this.activeTrackIds,
    this.adBreakStatus,
    this.liveSeekableRange,
    // this.queueData,
  });
}
