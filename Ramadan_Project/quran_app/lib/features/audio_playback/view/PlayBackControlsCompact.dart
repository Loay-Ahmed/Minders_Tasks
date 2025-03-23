import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:quran_app/core/services/AudioService.dart';

class PlaybackControls extends StatelessWidget {
  final AudioService audioService;
  final Function rebuild;

  const PlaybackControls({
    super.key,
    required this.audioService,
    required this.rebuild,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: audioService.audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;

        bool isBuffering =
            processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering;

        return IconButton(
          icon: Icon(
            audioService.audioPlayer.playing
                ? Icons.pause_circle_filled
                : Icons.play_circle_fill,
            size: 35,
            color: Colors.white,
          ),
          onPressed:
              isBuffering
                  ? null // Disable button while downloading
                  : () {
                    audioService.audioPlayer.playing
                        ? audioService.audioPlayer.pause()
                        : audioService.audioPlayer.play();
                    rebuild();
                  },
        );
      },
    );
  }
}
