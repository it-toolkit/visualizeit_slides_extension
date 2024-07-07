import 'dart:async';

import 'package:video_player/video_player.dart';

import '../deck/deck.dart';
import '../layouts/video.dart';

/// A slide that displays a video.
class VideoSlide extends Slide {
  /// The [VideoPlayerController] to used to play the video. The slide will
  /// control the video player, so it should not be used elsewhere.
  final VideoPlayerController videoPlayerController;

  /// Creates a slide that displays a video, filling the slide.
  VideoSlide({
    required this.videoPlayerController,
    bool loop = false,
    Duration playAfterDuration = Duration.zero,
    super.notes,
    super.transition,
    super.theme,
    super.autoplayDuration,
    super.audioSource,
  }) : super(
          builder: (context) {
            return VideoLayout(
              videoPlayerController: videoPlayerController,
            );
          },
          onPrecache: (context) async {
            await videoPlayerController.initialize();
            videoPlayerController.setLooping(loop);
          },
          onEnter: () async {
            await videoPlayerController.seekTo(Duration.zero);
            await Future.delayed(playAfterDuration);
            await videoPlayerController.play();
          },
          onExit: () async {
            await videoPlayerController.pause();
          },
        );
}
