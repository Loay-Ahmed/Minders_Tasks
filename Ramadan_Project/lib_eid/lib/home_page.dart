import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_app/features/search/view/quran_screen.dart';
import 'package:quran_app/features/surahindex.dart';
import 'package:quran_app/widgets/custom_option.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Custom_option(child: Image.asset("assets/book.png"), title: "المصحف", destination: SurahIndex()),
            Custom_option(child: Icon(Icons.search,size: 40,color: Colors.black,), title: "البحث", destination: SearchScreen())
          ],
        ),
      )
    );
  }
}


