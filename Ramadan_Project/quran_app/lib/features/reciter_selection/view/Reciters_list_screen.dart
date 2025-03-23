import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/features/audio_playback/view_model/AudioProvider.dart';
import 'package:quran_app/features/audio_playback/view_model/AudioServiceProvider.dart';
import 'package:quran_app/features/reciter_selection/view_model/RecitersProvider.dart';
import 'package:quran_app/features/audio_playback/view_model/CompactVisibilityProvider.dart';
import 'package:quran_app/features/reciter_selection/view_model/selectedReciterProvider.dart';
import 'package:quran_app/features/audio_playback/view/compact_player.dart';
import 'package:quran_app/features/reciter_selection/view/recitersList.dart';

import '../../../core/Models/Surah.dart';

class ReciterListScreen extends ConsumerWidget {
  const ReciterListScreen({super.key, required this.surah});
  final Surah surah;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recitersAsync = ref.watch(recitersProvider);
    final selectedReciter = ref.watch(selectedReciterProvider);
    final audioFileAsync =
        selectedReciter != null
            ? ref.watch(audioFileProvider((selectedReciter.id, surah.id)))
            : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Select a Reciter",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: recitersAsync.when(
              data: (reciters) => ReciterList(reciters: reciters, surah: surah),
              loading: () => const Center(child: CircularProgressIndicator()),
              error:
                  (err, stack) => const Center(
                    child: const Text(
                      "Error loading Reciters",
                      style: const TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
            ),
          ),
          if (selectedReciter != null && audioFileAsync != null)
            audioFileAsync.when(
              data: (audioFile) {
                final isAudioPlayerVisible = ref.watch(
                  compactAudioPlayerVisibilityProvider,
                );
                if (!isAudioPlayerVisible) return const SizedBox.shrink();

                Future.microtask(() {
                  ref
                      .read(audioServiceProvider.notifier)
                      .changeAudio(audioFile, () {});
                });

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  child: CompactAudioPlayer(
                    audioFile: audioFile,
                    reciter: selectedReciter,
                    surah: surah,
                  ),
                );
              },
              loading:
                  () => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                  ),
              error:
                  (_, __) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 50,
                      child: Center(
                        child: Text(
                          "Failed to load audio",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
            ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
