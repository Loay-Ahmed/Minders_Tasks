import 'package:flutter/material.dart';
import 'package:quran_app/core/Models/Reciter.dart';
import 'package:quran_app/core/Models/Surah.dart';
import 'package:quran_app/core/services/AudioService.dart';
import 'package:quran_app/features/audio_playback/view/AudioControls.dart';
import 'package:quran_app/features/audio_playback/view/AudioSlider.dart';

class FullScreenPlayer extends StatefulWidget {
  final AudioService audioService;
  final Reciter reciter;
  final Surah surah;

  const FullScreenPlayer({
    required this.audioService,
    super.key,
    required this.reciter,
    required this.surah,
  });

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  @override
  void initState() {
    super.initState();
    widget.audioService.redo(setState);
  }

  @override
  void dispose() {
    super.dispose();
    widget.audioService.cancelSubscriptions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'القرآن الكريم',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/${widget.reciter.name}.jpeg',
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              Text(
                'سورة ${widget.surah.nameArabic} ',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${widget.reciter.name}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              AudioSlider(
                audioService: widget.audioService,
                rebuildParent: () {
                  setState(() {});
                },
              ),
              const SizedBox(height: 20),
              AudioControls(audioService: widget.audioService),
            ],
          ),
        ),
      ),
    );
  }
}
