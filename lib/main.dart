import 'package:flutter/material.dart';

import 'package:flutter_projects/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 25, 145, 243)),
        useMaterial3: false,
      ),
      home: const InitialSreen(),
    );
  }
}
