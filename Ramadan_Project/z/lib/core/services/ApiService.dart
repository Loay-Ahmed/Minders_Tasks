import 'dart:convert';
import 'package:quranapp/core/Models/AudioFile.dart';
import 'package:quranapp/core/Models/Reciter.dart';
import 'package:quranapp/core/Models/Surah.dart';
import 'package:http/http.dart' as http;

class QuranApiService {
  static const String baseUrl = "https://api.quran.com/api/v4";

  // Fetch all Surahs
  static Future<List<Surah>> fetchSurahs() async {
    final response = await http.get(Uri.parse("$baseUrl/chapters"));
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body)['chapters'];
      return jsonList.map((json) => Surah.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load Surahs");
    }
  }

  // Fetch all Reciters
  static Future<List<Reciter>> fetchReciters() async {
    final response = await http.get(
      Uri.parse("$baseUrl/resources/recitations"),
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonList = json.decode(response.body)['recitations'];
      List<Reciter> list =
          jsonList.map((json) => Reciter.fromJson(json)).toList();
      return list;
    } else {
      throw Exception("Failed to load Reciters");
    }
  }

  static Future<AudioFile> fetchSurahAudio(int reciterId, int surahId) async {
    final url = Uri.parse("$baseUrl/chapter_recitations/$reciterId/$surahId");

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return AudioFile.fromJson(jsonData["audio_file"]);
    } else {
      throw Exception("Failed to load audio file");
    }
  }
}
