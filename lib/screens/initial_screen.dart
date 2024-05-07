import 'package:flutter/material.dart';

import 'package:flutter_projects/data/task_inherited.dart';
import 'package:flutter_projects/screens/form_screen.dart';

class InitialSreen extends StatefulWidget {
  const InitialSreen({super.key});

  @override
  State<InitialSreen> createState() => _InitialSreenState();
}

class _InitialSreenState extends State<InitialSreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.list,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Tarefas',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(opacity ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  opacity = !opacity;
                });
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (contextNew) => FormScreen(taskContext: context),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(seconds: 1),
        child: ListView(
          
          padding: const EdgeInsets.only(top: 10, bottom: 70),
          
          children:
              //Aqui(TaskInherited) é onde você encontra esse método(dentroDo), que pede um contexto(context) e retorna o objeto(taskList)
              TaskInherited.dentroDo(context).taskList,
        ),
      ),
    );
  }
}
