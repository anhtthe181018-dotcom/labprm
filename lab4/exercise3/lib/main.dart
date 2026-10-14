import 'package:flutter/material.dart';

void main() => runApp(const LayoutDemoApp());

class LayoutDemoApp extends StatelessWidget {
  const LayoutDemoApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xfffcf9ff),
          colorSchemeSeed: const Color(0xff596aa5),
        ),
        home: const LayoutDemoScreen(),
      );
}

class LayoutDemoScreen extends StatelessWidget {
  const LayoutDemoScreen({super.key});
  static const _movies = [
    ('Avatar', 'A'),
    ('Inception', 'I'),
    ('Interstellar', 'I'),
    ('Joker', 'J'),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text('Exercise 3 – Layout Demo'),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            const SizedBox(height: 16),
            const Text('Now Playing',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _movies.length,
                itemBuilder: (context, index) {
                  final movie = _movies[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xffe1e5ff),
                        child: Text(movie.$2,
                            style: const TextStyle(color: Color(0xff202444))),
                      ),
                      title: Text(movie.$1),
                      subtitle: const Text('Sample description'),
                    ),
                  );
                },
              ),
            ),
          ]),
        ),
      );
}
