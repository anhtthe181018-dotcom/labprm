import 'package:flutter/material.dart';

void main() => runApp(const CommonUiFixesApp());

class CommonUiFixesApp extends StatelessWidget {
  const CommonUiFixesApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xfffcf9ff),
          colorSchemeSeed: const Color(0xff596aa5),
        ),
        home: const CommonUiFixesScreen(),
      );
}

class CommonUiFixesScreen extends StatelessWidget {
  const CommonUiFixesScreen({super.key});
  static const _movies = ['Movie A', 'Movie B', 'Movie C', 'Movie D'];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text('Exercise 5 – Common UI Fixes'),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 8),
            const Text(
              'Correct ListView inside Column using\nExpanded',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Expanded fixes the unbounded-height ListView error inside Column.
            Expanded(
              child: ListView.builder(
                itemCount: _movies.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const Icon(Icons.movie),
                  title: Text(_movies[index]),
                ),
              ),
            ),
          ]),
        ),
      );
}
