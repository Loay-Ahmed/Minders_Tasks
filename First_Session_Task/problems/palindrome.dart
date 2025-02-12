import 'dart:io';

bool isPalindrome(int x) {
  if (x < 0) return false;
  String numToString = x.toString();
  return numToString == numToString.split('').reversed.join('');
}

void main() {
  print("Enter number to check: ");
  int num = int.parse(stdin.readLineSync().toString());
  print(isPalindrome(num));
}
