import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quranapp/core/Models/Reciter.dart';
import 'package:quranapp/core/Models/Surah.dart';
import 'package:quranapp/features/audio_playback/view_model/CompactVisibilityProvider.dart';
import 'package:quranapp/features/reciter_selection/view_model/selectedReciterProvider.dart';

class ReciterList extends ConsumerWidget {
  final List<Reciter> reciters;
  final Surah surah;

  const ReciterList({required this.reciters, super.key, required this.surah});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: reciters.length,
      itemBuilder: (context, index) {
        final reciter = reciters[index];
        return Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                "assets/images/${reciter.name}.jpeg",
                width: 50,
                height: 50,
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) =>
                        const Icon(Icons.person, size: 50, color: Colors.grey),
              ),
            ),
            title: Text(
              reciter.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              reciter.style,
              style: TextStyle(color: Colors.grey[600]),
            ),
            onTap: () {
              ref.read(selectedReciterProvider.notifier).state = reciter;
              ref.read(compactAudioPlayerVisibilityProvider.notifier).state =
                  true;
            },
          ),
        );
      },
    );
  }
}
