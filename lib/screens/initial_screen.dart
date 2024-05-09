import 'package:flutter/material.dart';


import 'package:flutter_projects/data/task_inherited.dart';
import 'package:flutter_projects/screens/form_screen.dart';

// ignore: must_be_immutable
class InitialSreen extends StatefulWidget {
  InitialSreen({super.key, this.level = 0});
  int level;
  @override
  State<InitialSreen> createState() => _InitialSreenState();
}

class _InitialSreenState extends State<InitialSreen> {
  bool opacity = true;
  bool levelUp = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(1.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 1000),
            child: IconButton(
              key: ValueKey<bool>(levelUp),
              icon: const Icon( Icons.arrow_circle_up,),
              iconSize: 37,
              onPressed: () {
                setState(() {
                  levelUp = !levelUp;
                  widget.level++;
                });
              },
            ),
          ),
        ),
        title: const Text(
          'Tarefas',
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
      bottom: PreferredSize(preferredSize: const Size.fromHeight(20),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  color: Colors.orange.shade800,
                  value: (widget.level > 0) ? widget.level / TaskInherited.dentroDo(context).taskList.length : 1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Level ${TaskInherited.dentroDo(context).getLevel()}',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange.shade700,
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
