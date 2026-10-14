import 'package:flutter/material.dart';

void main() => runApp(const CoreWidgetsApp());

class CoreWidgetsApp extends StatelessWidget {
  const CoreWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Exercise 1',
        theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
        home: const CoreWidgetsDemo(),
      );
}

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Core Widgets')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('Flutter UI Fundamentals',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Icon(Icons.flutter_dash, size: 56, color: Colors.blue),
            const SizedBox(height: 12),
            // Local image asset supplied for this exercise.
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                // A wide banner ratio makes the image span the screen nicely.
                aspectRatio: 8 / 3,
                child: Image.asset(
                  'assets/squirrel.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Card(
              child: ListTile(
                leading: Icon(Icons.widgets_outlined),
                title: Text('Material Card and ListTile'),
                subtitle: Text('A reusable row with icon, title and description.'),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
          ],
        ),
      );
}
