import 'package:flutter/material.dart';

void main() {
  // Create a Car object using a named constructor
  Car car = Car.create(brand: 'Toyota');

  // Create an ElectricCar object
  ElectricCar electricCar = ElectricCar.create(brand: 'Tesla');

  // Print results to terminal
  print('========== EXERCISE 4 ==========');
  print('Car: ${car.brand}');
  car.drive();

  print('Electric Car: ${electricCar.brand}');
  electricCar.drive();

  // Flutter UI
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exercise 4 - Intro OOP'),
        ),
        body: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Intro OOP',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Car: ${car.brand}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Text('Toyota is driving.'),
                  const SizedBox(height: 15),
                  Text(
                    'Electric Car: ${electricCar.brand}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Text(
                    'Tesla is driving using electric power.',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

class Car {
  String brand;

  // Named constructor
  Car.create({required this.brand});

  // Method
  void drive() {
    print('$brand is driving.');
  }
}

// Inheritance
class ElectricCar extends Car {
  // Named constructor
  ElectricCar.create({required String brand})
      : super.create(brand: brand);

  // Method overriding
  @override
  void drive() {
    print('$brand is driving using electric power.');
  }
}