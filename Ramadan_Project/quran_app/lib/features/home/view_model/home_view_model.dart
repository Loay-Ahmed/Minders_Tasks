import 'package:flutter/material.dart';
import 'package:quran_app/features/home/model/surah.dart';

class HomeViewModel {
  // List of recently played surahs (can be fetched from a database later)
  final List<Surah> _recentlyPlayed = [
    Surah(name: 'Al-Fatiha', reciter: 'Mishary Rashid'),
    Surah(name: 'Al-Baqarah', reciter: 'Abdul Basit'),
    Surah(name: 'Al-Imran', reciter: 'Saad Al-Ghamdi'),
    Surah(name: 'Yusuf', reciter: 'Mishary Rashid'),
  ];

  // Getter to expose the list to the View
  List<Surah> get recentlyPlayed => _recentlyPlayed;

  // Navigation logic to go to Recitation screen
  void navigateToRecitation(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/recitation',
    ); // Using named route (adjust as needed)
  }

  // Optional: Add a surah to recently played (for future functionality)
  void addRecentlyPlayed(Surah surah) {
    if (!_recentlyPlayed.any(
      (s) => s.name == surah.name && s.reciter == surah.reciter,
    )) {
      _recentlyPlayed.insert(0, surah); // Add to the top
      if (_recentlyPlayed.length > 4) {
        _recentlyPlayed.removeLast(); // Limit to 4 items
      }
    }
  }
}
