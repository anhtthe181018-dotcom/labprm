import 'dart:async';
import 'package:flutter/material.dart';

Future<void> main() async {
  // Future & async/await
  print('========== EXERCISE 5 ==========');
  print('Loading data...');

  String result = await loadData();
  print(result);

  // Null safety
  String? name;
  print('Name: $name');

  String displayName = name ?? 'Guest';
  print('Name using ??: $displayName');

  name = 'The Anh';
  print('Name after assigning: $name');
  print('Name using !: ${name!}');

  // Stream
  Stream<int> numberStream =
      Stream.fromIterable([1, 2, 3, 4, 5]);

  print('Stream values:');
  await numberStream.forEach((number) {
    print('Received: $number');
  });

  // Flutter UI
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exercise 5 - Async & Null Safety'),
        ),
        body: Center(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Async, Null Safety & Streams',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(result),
                  const SizedBox(height: 10),
                  Text('Name: $displayName'),
                  Text('Name using !: ${name!}'),
                  const SizedBox(height: 10),
                  const Text('Stream: 1 → 2 → 3 → 4 → 5'),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

// Future function
Future<String> loadData() async {
  await Future.delayed(
    const Duration(seconds: 2),
  );

  return 'Data loaded successfully!';
}