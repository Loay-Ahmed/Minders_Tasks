class Reciter {
  final int id;
  final String name;
  final String style;

  Reciter({required this.id, required this.name, required this.style});

  factory Reciter.fromJson(Map<String, dynamic> json) {
    return Reciter(
      id: json["id"] as int,
      name: json["reciter_name"] ?? "Unknown",
      style: json["style"] ?? "all",
    );
  }
}
