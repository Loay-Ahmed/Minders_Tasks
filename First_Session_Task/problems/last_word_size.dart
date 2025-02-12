import 'dart:io';

int lastWordLength(String sentence) {
  List<String> splitted = sentence.split(" ").toList();
  return splitted[splitted.length - 1].length;
}

void main() {
  String sentence = stdin.readLineSync().toString();

  print(lastWordLength(sentence));
}
