import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/core/Models/AudioFile.dart';
import 'package:quran_app/core/services/ApiService.dart';

final audioFileProvider = FutureProvider.family<AudioFile, (int, int)>((
  ref,
  params,
) async {
  final (reciterId, surahId) = params;
  return await QuranApiService.fetchSurahAudio(reciterId, surahId);
});
