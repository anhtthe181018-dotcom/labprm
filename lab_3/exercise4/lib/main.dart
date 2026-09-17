import 'dart:async';

void main() async {
  print('========== EXERCISE 4 ==========');
  print('Stream Transformation');
  print('Original Stream -> Transformation Pipeline (x * x, then filter even numbers)');
  print('');

  // Create a stream of numbers from 1 to 5
  final stream = Stream.fromIterable([1, 2, 3, 4, 5]);

  // Transform each number into its square
  final squaredStream = stream.map((number) {
    final result = number * number;

    print('[map] Transformed $number -> $result');

    return result;
  });

  // Keep only even numbers
  final filteredStream = squaredStream.where((number) {
    final isEven = number.isEven;

    print('[where] Checked if $number is even: $isEven');

    return isEven;
  });

  // Listen to final stream values
  await filteredStream.forEach((number) {
    print('[Stream Output] Emitted final value: $number');
    print('');
  });

  print('========== STREAM COMPLETED ==========');
}