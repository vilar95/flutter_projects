import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Tarefas'),
        ),
        body: ListView(
          children: [
            Task('Aprender Flutter'),
            Task('Hackear o WI-Fi do Vizinho'),
            Task('MOBIL-628'),
            Task('Melhorar o Inglês'),
            Task('Arrumar a Casa'),
            Task('Pedir Almoço'),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}

class Task extends StatelessWidget {
  final String name;
  const Task(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 140,
              width: 400,
            ),
            Container(
              color: Colors.white,
              height: 100,
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: Colors.black26,
                    width: 72,
                    height: 100,
                  ),
                  Container(
                    width: 200,
                    child: 
                    Text(
                      name,
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.arrow_drop_up),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
