import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quranapp/core/Models/AudioFile.dart';
import 'package:quranapp/core/services/ApiService.dart';

final audioFileProvider = FutureProvider.family<AudioFile, (int, int)>((
  ref,
  params,
) async {
  final (reciterId, surahId) = params;
  return await QuranApiService.fetchSurahAudio(reciterId, surahId);
});
