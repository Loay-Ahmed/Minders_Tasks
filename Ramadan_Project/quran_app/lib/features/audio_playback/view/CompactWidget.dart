import 'package:flutter/material.dart';
import 'package:quran_app/core/Models/Reciter.dart';
import 'package:quran_app/core/Models/Surah.dart';
import 'package:quran_app/core/services/AudioService.dart';
import 'package:quran_app/features/audio_playback/view/PlayBackControlsCompact.dart';
import 'package:quran_app/features/audio_playback/view/SurahAndReciterText.dart';

class CompactContainer extends StatelessWidget {
  final Reciter reciter;
  final Surah surah;
  final AudioService audioService;
  final VoidCallback onClose;
  final Function rebuild;

  const CompactContainer({
    super.key,
    required this.reciter,
    required this.surah,
    required this.audioService,
    required this.onClose,
    required this.rebuild,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4CAF50), Color(0xFF087F23)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/images/${reciter.name}.jpeg',
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: SurahAndReciterText(surah: surah, reciter: reciter)),

          PlaybackControls(audioService: audioService, rebuild: rebuild),
          IconButton(
            icon: const Icon(Icons.close, size: 25, color: Colors.white),
            onPressed: onClose,
          ),
        ],
      ),
    );
  }
}
