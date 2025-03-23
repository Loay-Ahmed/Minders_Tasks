import 'package:flutter/material.dart';
import 'package:quran_app/core/Models/Reciter.dart';
import 'package:quran_app/core/Models/Surah.dart';

class SurahAndReciterText extends StatelessWidget {
  final Surah surah;
  final Reciter reciter;

  const SurahAndReciterText({
    super.key,
    required this.surah,
    required this.reciter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'سورة ${surah.nameArabic}',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(
          reciter.name,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.9)),
        ),
      ],
    );
  }
}
