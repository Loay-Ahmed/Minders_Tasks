// import 'package:just_audio/just_audio.dart';

// class AudioService {
//   final AudioPlayer _audioPlayer = AudioPlayer();

//   get audioPlayer => _audioPlayer;

//   final List<String> _playlist = [
//     // 'assets/audio/1.mp3',
//     'assets/audio/2.mp3',
//     'assets/audio/3.mp3',
//   ];

//   int _currentIndex = 0;
//   bool isPlaying = false;

//   Duration totalSongLength = Duration.zero;
//   Duration position = Duration.zero;

//   void initializeAudio(Function rebuildParent) {
//     _setAudio();

//     _audioPlayer.positionStream.listen((p) {
//       // how long has it been :) and for every second , rebuild
//       rebuildParent(() => position = p);
//     });

//     _audioPlayer.durationStream.listen((d) {
//       // how long is it ? :D
//       rebuildParent(() => totalSongLength = d ?? Duration.zero);
//     });

//     // Listen for changes in the player state to detect when the song ends
//     _audioPlayer.playerStateStream.listen((state) {
//       if (state.processingState == ProcessingState.completed) {
//         rebuildParent(() => isPlaying = false); // Trigger UI update
//       }
//     });
//   }

//   void redo(Function rebuildParent) {
//     _audioPlayer.positionStream.listen((p) {
//       // how long has it been :) and for every second , rebuild
//       rebuildParent(() => position = p);
//     });

//     _audioPlayer.durationStream.listen((d) {
//       // how long is it ? :D
//       rebuildParent(() => totalSongLength = d ?? Duration.zero);
//     });

//     // Listen for changes in the player state to detect when the song ends
//     _audioPlayer.playerStateStream.listen((state) {
//       if (state.processingState == ProcessingState.completed) {
//         rebuildParent(() => isPlaying = false); // Trigger UI update
//       }
//     });
//   }

//   Future<void> _setAudio() async {
//     try {
//       await _audioPlayer.setAsset(_playlist[_currentIndex]);
//     } catch (e) {
//       // print("Error loading audio $e");
//     }
//   }

//   Future<void> next() async {
//     stop();
//     _currentIndex = (_currentIndex + 1) % _playlist.length;
//     await _setAudio();
//     play();
//     // rebuildParent(() {});
//   }

//   Future<void> previous() async {
//     stop();
//     _currentIndex = (_currentIndex - 1 + _playlist.length) % _playlist.length;
//     await _setAudio();
//     play();
//     // rebuildParent(() {});
//   }

//   // IMPORTANT TO KNOW
//   /*

// play()	Starts or resumes playback from the last position.
// pause()	Temporarily stops playback but keeps the position.
// stop()	Stops playback and resets the position to 0.
// dispose()	Destroys the player instance and frees resources.
// */

//   Future<void> stop() async {
//     await _audioPlayer.stop();
//     isPlaying = false;
//   }

//   Future<void> play() async {
//     if (position >= totalSongLength) {
//       // If the song has ended, restart it
//       await _audioPlayer.seek(
//         Duration.zero,
//       ); // goes and then plays right away , that's what seek does :D
//     }
//     isPlaying = true;
//     await _audioPlayer.play();
//     // rebuildParent();
//   }

//   Future<void> pause() async {
//     isPlaying = false;
//     await _audioPlayer.pause();
//     // rebuildParent();
//   }

//   void dispose() {
//     _audioPlayer.dispose();
//   }

//   String formatDuration(Duration duration) {
//     // msln : 3.5 hours and 54 seconds = 60 minutes and 30 minutes
//     int hours = duration.inHours; //3
//     int minutes = duration.inMinutes.remainder(
//       60,
//     ); //210 %  60 = 30 ( the remaining minutes if we only take hours :D )
//     int seconds = duration.inSeconds.remainder(
//       60,
//     ); // 12654  % 60 = 54 seconds ( the remaining seconds if we take all 60s :D)

//     if (hours > 0) {
//       return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}'; // if less than 2 digits , adds a 0
//     } else {
//       return '$minutes:${seconds.toString().padLeft(2, '0')}';
//     }
//   }
// }
import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:quran_app/core/Models/AudioFile.dart';

class AudioService {
  AudioService({required this.currentAudioFile});
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get audioPlayer => _audioPlayer;

  AudioFile currentAudioFile;
  bool isPlaying = true;

  Duration totalSongLength = Duration.zero;
  Duration position = Duration.zero;

  void initializeAudio(Function rebuildParent) {
    _setAudio().then((_) => play());
  }

  StreamSubscription? _positionSubscription;
  StreamSubscription? _durationSubscription;
  StreamSubscription? _playerStateSubscription;

  void redo(Function rebuildParent) {
    _positionSubscription = _audioPlayer.positionStream.listen((p) {
      rebuildParent(() => position = p);
    });

    _durationSubscription = _audioPlayer.durationStream.listen((d) {
      rebuildParent(() => totalSongLength = d ?? Duration.zero);
    });

    _playerStateSubscription = _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        rebuildParent(() => isPlaying = false);
      }
    });
  }

  Future<bool> _setAudio() async {
    try {
      await _audioPlayer.setUrl(currentAudioFile.audioUrl);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    isPlaying = false;
  }

  Future<void> play() async {
    isPlaying = true;
    await _audioPlayer.play();
  }

  Future<void> pause() async {
    isPlaying = false;
    await _audioPlayer.pause();
  }

  void cancelSubscriptions() {
    _positionSubscription?.cancel();
    _durationSubscription?.cancel();
    _playerStateSubscription?.cancel();
    // _audioPlayer.dispose(); // when exiting a fullscreen , this will not happen
  }

  void dispose() {
    _positionSubscription?.cancel();
    _durationSubscription?.cancel();
    _playerStateSubscription?.cancel();
    _audioPlayer.dispose();
  }

  String formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);

    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '$minutes:${seconds.toString().padLeft(2, '0')}';
    }
  }
}
