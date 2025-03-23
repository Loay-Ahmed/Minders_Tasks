import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:quran/quran.dart' as quran;

class SurahViewScreen extends StatefulWidget {
  final int surahNumber;
  final int verseNumber;

  const SurahViewScreen({
    Key? key,
    required this.surahNumber,
    required this.verseNumber,
  }) : super(key: key);

  @override
  _SurahViewScreenState createState() => _SurahViewScreenState();
}

class _SurahViewScreenState extends State<SurahViewScreen> {
  final FlutterSoundPlayer _soundPlayer = FlutterSoundPlayer();
  bool _isPlaying = false;
  int? _highlightedVerse;
  late PageController _pageController;
  List<List<int>> _pages = [];
  List<int> _pageNumbers = [];
  List<String> _audioUrls = [];
  int _currentSurah = 0;
  int _currentVerse = 1;

  @override
  void initState() {
    super.initState();
    _currentSurah = widget.surahNumber;
    _currentVerse = widget.verseNumber; // تحديد الآية المختارة
    _initializeAudioPlayer();
    _loadSurah(_currentSurah, _currentVerse);
  }
  void _initializeAudioPlayer() async {
    await _soundPlayer.openPlayer();
  }
  void _loadSurah(int surahNumber, int verseNumber) {
    setState(() {
      _highlightedVerse = verseNumber;
      _prepareAudioUrls(surahNumber);
      _splitVersesByMushafPages(surahNumber);
      _pageController = PageController(
        initialPage: _getPageIndex(verseNumber),
      );
    });
  }
  void _prepareAudioUrls(int surahNumber){
    _audioUrls = List.generate(
      quran.getVerseCount(surahNumber),
          (index) => quran.getAudioURLByVerse(surahNumber, index+1),
    );
  }
  void _splitVersesByMushafPages(int surahNumber) {
    _pages.clear();
    _pageNumbers.clear();

    int verseCount = quran.getVerseCount(surahNumber);
    int currentPage = quran.getPageNumber(surahNumber, 1);
    List<int> currentPageVerses = [];

    for (int i = 1; i <= verseCount; i++) {
      int versePage = quran.getPageNumber(surahNumber, i);
      if (versePage != currentPage) {
        _pages.insert(0, currentPageVerses);
        _pageNumbers.insert(0, currentPage);
        currentPageVerses = [];
        currentPage = versePage;
      }
      currentPageVerses.add(i);
    }

    if (currentPageVerses.isNotEmpty) {
      _pages.insert(0, currentPageVerses);
      _pageNumbers.insert(0, currentPage);
    }
  }

  int _getPageIndex(int verseNumber) {
    for (int i = 0; i < _pages.length; i++) {
      if (_pages[i].contains(verseNumber)) return i;
    }
    return 0;
  }
  void _playAudio(int verseNumber) async {
    if (verseNumber > _audioUrls.length) return;

    // إذا كانت الآية المضغوط عليها هي نفسها التي تعمل، قم بإيقاف التشغيل فقط
    if (_isPlaying && _highlightedVerse == verseNumber) {
      await _soundPlayer.stopPlayer();
      setState(() {
        _isPlaying = false;
        _highlightedVerse = 0;
      });
      return;
    }

    // تشغيل الآية الجديدة
    String audioUrl = _audioUrls[verseNumber - 1];
    await _soundPlayer.startPlayer(
      fromURI: audioUrl,
      codec: Codec.mp3,
      whenFinished: () {
        _playNextVerse(verseNumber);
      },
    );

    setState(() {
      _isPlaying = true;
      _highlightedVerse = verseNumber;
      _pageController.jumpToPage(_getPageIndex(verseNumber));
    });
  }


  void _playNextVerse(int currentVerse) async {
    int nextVerse = currentVerse + 1;

    if (nextVerse > _audioUrls.length) {
      setState(() {
        _isPlaying = false;
        _highlightedVerse = 0;
      });
      return;
    }

    String nextAudioUrl = _audioUrls[nextVerse - 1];

    await _soundPlayer.startPlayer(
      fromURI: nextAudioUrl,
      codec: Codec.mp3,
      whenFinished: () {
        _playNextVerse(nextVerse);
      },
    );

    setState(() {
      _highlightedVerse = nextVerse;
      _pageController.jumpToPage(_getPageIndex(nextVerse));
    });
  }


  void _goToPreviousSurah() {
    if (_currentSurah > 1) {
      setState(() {
        _currentSurah--;
        _currentVerse = 1;
        _loadSurah(_currentSurah, _currentVerse);
      });
    }
  }

  void _goToNextSurah() {
    if (_currentSurah < 114) {
      setState(() {
        _currentSurah++;
        _currentVerse = 1;
        _loadSurah(_currentSurah, _currentVerse);
      });
    }
  }


  @override
  void dispose() {
    _soundPlayer.closePlayer();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(quran.getSurahNameArabic(_currentSurah)),
        actions: [
          if (_currentSurah > 1)
            IconButton(
              icon: Icon(Icons.arrow_back),
              tooltip: 'السورة السابقة',
              onPressed: _goToPreviousSurah,
            ),
          if (_currentSurah < 114)
            IconButton(
              icon: Icon(Icons.arrow_forward),
              tooltip: 'السورة التالية',
              onPressed: _goToNextSurah,
            ),
        ],
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        itemBuilder: (context, pageIndex) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildMushafPage(pageIndex),
          );
        },
      ),
    );
  }

  Widget _buildMushafPage(int pageIndex) {
    List<TextSpan> textSpans = [];
    for (int verse in _pages[pageIndex]) {
      bool isHighlighted = verse == _highlightedVerse;
      textSpans.add(
        TextSpan(
          text: quran.getVerse(_currentSurah, verse, verseEndSymbol: true) + ' ',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'me_quran',
            color: isHighlighted ? Colors.blue[200] : Colors.black,
            fontWeight: FontWeight.bold,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              setState(() {
                _currentVerse = verse;
              });
              _playAudio(verse);
            },
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: RichText(
                textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                text: TextSpan(children: textSpans),
              ),
            ),
          ),
        ),
        Text(
          'صفحة ${_pageNumbers[pageIndex]}',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
