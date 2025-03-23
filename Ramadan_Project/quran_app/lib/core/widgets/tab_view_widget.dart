import 'package:flutter/material.dart';
import 'package:quran_app/features/favorites/favorites.dart';
import 'package:quran_app/features/home/view/home.dart';
import 'package:quran_app/features/recitation/view/recitation.dart';
import 'package:quran_app/features/settings/settings.dart';
import 'package:quran_app/features/tafsir/tafsir.dart';

class CustomTabView extends StatelessWidget {
  final TabController tabController;

  const CustomTabView({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const Home(),
      const Recitation(),
      const Tafsir(),
      const Favorites(),
      const Settings(),
    ];

    return TabBarView(
      controller: tabController,
      physics: const NeverScrollableScrollPhysics(),
      children:
          screens.map((screen) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: screen,
            );
          }).toList(),
    );
  }
}
