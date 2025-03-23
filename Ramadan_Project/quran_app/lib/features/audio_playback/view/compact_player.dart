import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/core/Models/AudioFile.dart';
import 'package:quran_app/core/Models/Reciter.dart';
import 'package:quran_app/core/Models/Surah.dart';
import 'package:quran_app/features/audio_playback/view_model/AudioServiceProvider.dart';
import 'package:quran_app/features/audio_playback/view_model/CompactVisibilityProvider.dart';
import 'package:quran_app/core/services/AudioService.dart';
import 'package:quran_app/features/audio_playback/view/CompactWidget.dart';
import 'package:quran_app/features/audio_playback/view/fullScreen_player.dart';

class CompactAudioPlayer extends ConsumerStatefulWidget {
  const CompactAudioPlayer({
    super.key,
    required this.audioFile,
    required this.reciter,
    required this.surah,
  });

  final AudioFile audioFile;
  final Reciter reciter;
  final Surah surah;

  @override
  ConsumerState createState() => _CompactAudioPlayerState();
}

class _CompactAudioPlayerState extends ConsumerState<CompactAudioPlayer> {
  late AudioService _audioService;

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  void _navigateToFullScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) => FullScreenPlayer(
              audioService: _audioService,
              reciter: widget.reciter,
              surah: widget.surah,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _audioService = ref.watch(audioServiceProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => _navigateToFullScreen(context),
        child: CompactContainer(
          reciter: widget.reciter,
          surah: widget.surah,
          audioService: _audioService,
          onClose: () {
            setState(() {
              ref.read(compactAudioPlayerVisibilityProvider.notifier).state =
                  false;
            });
          },
          rebuild: () {
            setState(() {});
          },
        ),
      ),
    );
  }
}
