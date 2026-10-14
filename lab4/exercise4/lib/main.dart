import 'package:flutter/material.dart';

void main() => runApp(const ThemeDemoApp());

class ThemeDemoApp extends StatefulWidget {
  const ThemeDemoApp({super.key});
  @override
  State<ThemeDemoApp> createState() => _ThemeDemoAppState();
}

class _ThemeDemoAppState extends State<ThemeDemoApp> {
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xfffcf9ff),
          colorSchemeSeed: const Color(0xff596aa5),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          colorSchemeSeed: const Color(0xff9ca9ff),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Exercise 4 – App Structure'),
            backgroundColor: Colors.transparent,
            actions: [
              const Text('Dark'),
              Switch(
                value: _darkMode,
                onChanged: (value) => setState(() => _darkMode = value),
              ),
            ],
          ),
          body: const Center(
            child: Text('This is a simple screen with theme toggle.'),
          ),
        ),
      );
}
