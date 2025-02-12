import 'dart:io';

List<int> removeDuplicates(List<int> arr, int val) {
  arr.removeWhere((element) => element == val);
  return arr;
}

void main() {
  List<int> input = [];
  List<String> data = stdin.readLineSync().toString().split(" ");
  for (int i = 0; i < data.length; i++) input.add(int.parse(data[i]));
  print("Enter val to remove: ");
  int val = int.parse(stdin.readLineSync().toString());
  print(removeDuplicates(input, val));
}
