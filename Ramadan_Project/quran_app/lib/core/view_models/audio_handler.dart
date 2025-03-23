import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class QuranAudioHandler extends BaseAudioHandler with SeekHandler {
  final AudioPlayer _player = AudioPlayer();

  QuranAudioHandler() {
    // Sync player state with the notification
    _player.playerStateStream.listen((playerState) {
      final processingState = _mapProcessingState(playerState.processingState);
      playbackState.add(playbackState.value.copyWith(
        controls: [
          MediaControl.rewind,
          if (playerState.playing) MediaControl.pause else MediaControl.play,
          MediaControl.stop,
        ],
        playing: playerState.playing,
        processingState: processingState,
      ));
    });
  }

  Future<void> playFromUrl(String url) async {
    await _player.setUrl(url);
    await _player.play();
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() async {
    await _player.stop();
    await super.stop();
  }

  AudioProcessingState _mapProcessingState(ProcessingState state) {
    switch (state) {
      case ProcessingState.idle:
        return AudioProcessingState.idle;
      case ProcessingState.loading:
        return AudioProcessingState.loading;
      case ProcessingState.buffering:
        return AudioProcessingState.buffering;
      case ProcessingState.ready:
        return AudioProcessingState.ready;
      case ProcessingState.completed:
        return AudioProcessingState.completed;
      default:
        return AudioProcessingState.idle;
    }
  }
}
