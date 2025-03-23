class Surah {
  final String name;
  final String reciter;

  Surah({required this.name, required this.reciter});

  // Optional: Factory method for JSON or database integration later
  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      name: json['surah'] as String,
      reciter: json['reciter'] as String,
    );
  }

  // Optional: Convert back to map if needed
  Map<String, String> toMap() {
    return {'surah': name, 'reciter': reciter};
  }
}
