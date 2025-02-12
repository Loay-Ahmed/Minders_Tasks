import 'dart:io';

int sumOfMaxAndMin(List<int> arr) {
  int min = 999999999999, max = 0;
  for (int i = 0; i < arr.length; i++) {
    max = max <= arr[i] ? arr[i] : max;
    min = min >= arr[i] ? arr[i] : min;
  }

  return min + max;
}

void main() {
  List<int> input = [];
  List<String> data = stdin.readLineSync().toString().split(" ");
  for (int i = 0; i < data.length; i++) input.add(int.parse(data[i]));
  print(sumOfMaxAndMin(input));
}
