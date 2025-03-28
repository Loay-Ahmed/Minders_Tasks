import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'home_page.dart';


void main() async {
  await Hive.initFlutter();
  await Hive.openBox('surah_cache');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

