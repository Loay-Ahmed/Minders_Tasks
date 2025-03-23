import 'package:flutter/material.dart';
import 'package:quranapp/core/services/AudioService.dart';

class AudioSlider extends StatefulWidget {
  final AudioService audioService;

  const AudioSlider({
    super.key,
    required this.audioService,
    required this.rebuildParent,
  });
  final Function rebuildParent;

  @override
  State<AudioSlider> createState() => _AudioSliderState();
}

class _AudioSliderState extends State<AudioSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(width: 20),
            Text(
              widget.audioService.formatDuration(widget.audioService.position),
            ),
            const Spacer(),
            Text(
              widget.audioService.formatDuration(
                widget.audioService.totalSongLength,
              ),
            ), // still
            const SizedBox(width: 20),
          ],
        ),
        Slider(
          value: widget.audioService.position.inSeconds.toDouble(),
          max:
              (widget.audioService.totalSongLength.inSeconds > 0)
                  ? widget.audioService.totalSongLength.inSeconds.toDouble()
                  : 1,
          onChanged: (value) async {
            await widget.audioService.audioPlayer.seek(
              // jump to that second :D
              Duration(seconds: value.toInt()),
            );
            widget.rebuildParent();
          },
          activeColor: const Color(0xff56905e),
          inactiveColor: Colors.grey[300],
        ),
      ],
    );
  }
}
