import 'package:flutter/material.dart';

void main() {
  // List
  List<int> numbers = [10, 20, 30, 40, 50];

  // Set removes duplicate values
  Set<int> uniqueNumbers = {10, 20, 20, 30, 30, 40};

  // Map
  Map<String, dynamic> student = {
    'name': 'The Anh',
    'age': 20,
    'isStudent': true,
  };

  // Operators
  int sum = numbers[0] + numbers[1];
  int difference = numbers[2] - numbers[0];
  int multiplication = numbers[1] * 2;
  double division = numbers[3] / 2;

  bool isAdult = student['age'] >= 18;
  bool isStudent = student['isStudent'] == true;

  // Print results to terminal
  print('========== EXERCISE 2 ==========');
  print('List: $numbers');
  print('First element: ${numbers[0]}');
  print('Third element: ${numbers[2]}');
  print('10 + 20 = $sum');
  print('30 - 10 = $difference');
  print('20 * 2 = $multiplication');
  print('40 / 2 = $division');
  print('10 < 20: ${numbers[0] < numbers[1]}');

  numbers.add(60);
  print('After add(60): $numbers');

  numbers.remove(20);
  print('After remove(20): $numbers');

  print('Set: $uniqueNumbers');
  print('Student name: ${student['name']}');
  print('Student age: ${student['age']}');
  print('Is adult student: ${isAdult && isStudent}');

  // Flutter UI
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exercise 2 - Collections & Operators'),
        ),
        body: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Collections & Operators',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text('List: $numbers'),
                  Text('Set: $uniqueNumbers'),
                  Text('10 + 20 = $sum'),
                  Text('30 - 10 = $difference'),
                  Text('20 × 2 = $multiplication'),
                  Text('40 ÷ 2 = $division'),
                  Text('Student: ${student['name']}'),
                  Text('Age: ${student['age']}'),
                  Text('Adult student: ${isAdult && isStudent}'),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}