import 'package:flutter/material.dart';
//import 'package:flutter_projects/data/task_inherited.dart';


import 'package:flutter_projects/screens/initial_screen.dart';
import 'package:flutter_projects/themes/my_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: myTheme,
      

      // theme: ThemeData(
      //   useMaterial3: false, 
      //   colorScheme: ColorScheme.fromSeed(
      //       seedColor: const Color.fromARGB(255, 25, 145, 243)),
      // ),
      //home: TaskInherited(child:  InitialSreen()),
      home: InitialSreen(),
    );
  }
}
