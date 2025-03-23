import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_app/core/Models/Surah.dart';
import 'package:quran_app/core/services/ApiService.dart';

// Provider to fetch Surahs
final surahsProvider = FutureProvider<List<Surah>>((ref) async {
  return await QuranApiService.fetchSurahs();
});
