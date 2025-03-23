import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quranapp/features/surah_selection/view/surah_list_screen.dart';
/*this is an example of the output of all surahs ( https://api.quran.com/api/v4/chapters )
this will get all reciters ( https://api.quran.com/api/v4/resources/recitations )
this will get the audio file of a specific reciter in a specific surah (https://api.quran.com/api/v4/chapter_recitations/1/2) // reciter id , surah id */

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Audio Player',
      home: SurahListScreen(),
    );
  }
}
