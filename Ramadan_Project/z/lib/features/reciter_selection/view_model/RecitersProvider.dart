import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quranapp/core/Models/Reciter.dart';
import 'package:quranapp/core/services/ApiService.dart';

// Provider to fetch Reciters
final recitersProvider = FutureProvider<List<Reciter>>((ref) async {
  return await QuranApiService.fetchReciters();
});
