import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quranapp/core/Models/Surah.dart';
import 'package:quranapp/core/services/ApiService.dart';

// Provider to fetch Surahs
final surahsProvider = FutureProvider<List<Surah>>((ref) async {
  return await QuranApiService.fetchSurahs();
});
