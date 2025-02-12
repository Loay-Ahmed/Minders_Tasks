import 'dart:io';

int findUniqueVal(List<int> arr) {
  int val = 0;
  for (int i = 0; i < arr.length; i++) {
    val ^= arr[i];
  }
  return val;
}

void main() {
  List<int> input = [];
  List<String> data = stdin.readLineSync().toString().split(" ");
  for (int i = 0; i < data.length; i++) input.add(int.parse(data[i]));

  print(findUniqueVal(input));
}
