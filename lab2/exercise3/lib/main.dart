import 'package:flutter/material.dart';

void main() {
  // If / else
  int score = 85;
  String grade;

  if (score >= 90) {
    grade = 'A';
  } else if (score >= 80) {
    grade = 'B';
  } else if (score >= 70) {
    grade = 'C';
  } else if (score >= 50) {
    grade = 'D';
  } else {
    grade = 'F';
  }

  // Switch
  int day = 3;
  String dayName;

  switch (day) {
    case 1:
      dayName = 'Monday';
      break;
    case 2:
      dayName = 'Tuesday';
      break;
    case 3:
      dayName = 'Wednesday';
      break;
    case 4:
      dayName = 'Thursday';
      break;
    case 5:
      dayName = 'Friday';
      break;
    case 6:
      dayName = 'Saturday';
      break;
    case 7:
      dayName = 'Sunday';
      break;
    default:
      dayName = 'Invalid day';
  }

  // Loops
  List<String> fruits = ['Apple', 'Banana', 'Orange'];

  for (int i = 0; i < fruits.length; i++) {
    print('For: ${fruits[i]}');
  }

  for (String fruit in fruits) {
    print('For-in: $fruit');
  }

  fruits.forEach((fruit) {
    print('forEach: $fruit');
  });

  // Functions
  int sum = addNumbers(10, 20);
  int multiplication = multiplyNumbers(5, 4);

  // Print results
  print('========== EXERCISE 3 ==========');
  print('Score: $score');
  print('Grade: $grade');
  print('Day: $dayName');
  print('10 + 20 = $sum');
  print('5 × 4 = $multiplication');

  // Flutter UI
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exercise 3 - Control Flow & Functions'),
        ),
        body: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Control Flow & Functions',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text('Score: $score'),
                  Text('Grade: $grade'),
                  Text('Day: $dayName'),
                  Text('Fruits: $fruits'),
                  Text('10 + 20 = $sum'),
                  Text('5 × 4 = $multiplication'),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

// Normal function
int addNumbers(int a, int b) {
  return a + b;
}

// Arrow function
int multiplyNumbers(int a, int b) => a * b;