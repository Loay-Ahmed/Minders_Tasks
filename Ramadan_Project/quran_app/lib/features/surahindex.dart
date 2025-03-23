import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran_app/features/surah.dart';

class SurahIndex extends StatefulWidget {
  const SurahIndex({super.key});

  @override
  State<SurahIndex> createState() => _SurahIndexState();
}

class _SurahIndexState extends State<SurahIndex> {
  final List<Map<String, dynamic>> _allsurah = [];

  void loadSurah() {
    for (int i = 1; i <= 114; i++) {
      _allsurah.add({
        'surahNumber': i,
        'surahName': quran.getSurahNameArabic(i),
        'surahPage': quran.getSurahPages(i).first, // جلب أول صفحة فقط
        'revelationPlace': quran.getPlaceOfRevelation(i) // مكية أو مدنية
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadSurah();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("فهرس السور")),
      body: ListView.builder(
        itemCount: _allsurah.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(_allsurah[i]['surahName'], style: const TextStyle(fontSize: 18)),
            subtitle: Text("الصفحة: ${_allsurah[i]['surahPage']}"),
            leading: CircleAvatar(
              child: Text(_allsurah[i]['surahNumber'].toString()),
            ),
            trailing: Text(
              _allsurah[i]['revelationPlace'] == "Makkah" ? "مكية" : "مدنية",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: _allsurah[i]['revelationPlace'] == "Makkah" ? Colors.blue : Colors.green,
              ),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SurahViewScreen(
                    surahNumber: _allsurah[i]['surahNumber'],
                    verseNumber: 1,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
