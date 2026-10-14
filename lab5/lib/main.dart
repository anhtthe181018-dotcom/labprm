import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() => runApp(const MovieApp());

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color(0xff596aa5),
          scaffoldBackgroundColor: const Color(0xfffcf9ff),
        ),
        home: const HomeScreen(),
      );
}
