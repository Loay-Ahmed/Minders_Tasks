import 'package:flutter/material.dart';
import 'package:quran_app/core/services/AudioService.dart';

class AudioControls extends StatefulWidget {
  final AudioService audioService;

  const AudioControls({super.key, required this.audioService});

  @override
  State<AudioControls> createState() => _AudioControlsState();
}

class _AudioControlsState extends State<AudioControls> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(icon: const Icon(Icons.loop, size: 30), onPressed: () {}),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.skip_previous_outlined, size: 30),
          onPressed: () {
            setState(() {
              // widget.audioService.previous();
            });
          },
        ),
        IconButton(
          icon: Icon(
            widget.audioService.isPlaying
                ? Icons.pause_outlined
                : Icons.play_arrow_outlined,
            size: 50,
          ),
          onPressed: () {
            setState(() {
              widget.audioService.isPlaying
                  ? widget.audioService.pause()
                  : widget.audioService.play();
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.skip_next_rounded, size: 30),
          onPressed: () {
            setState(() {
              // widget.audioService.next();
            });
          },
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(Icons.playlist_add_rounded, size: 30),
          onPressed: () {},
        ),
      ],
    );
  }
}
