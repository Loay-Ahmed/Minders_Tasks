import 'dart:io';

bool isPalindrome(int x) {
  if (x < 0) return false;
  String numToString = x.toString();
  for (int i = 0; i < numToString.length; i++) {
    if (numToString[i] != numToString[numToString.length - i - 1]) return false;
  }
  return true;
}

void main() {
  print("Enter number to check: ");
  int num = int.parse(stdin.readLineSync().toString());
  print(isPalindrome(num));
}
