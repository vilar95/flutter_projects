import 'package:flutter/material.dart';
import 'package:flutter_projects/components_widget/task.dart';

class TaskInherited extends InheritedWidget {
   TaskInherited({
    super.key,
    required super.child,
  });

  final List<Task> taskList = [
   const Task('Aprender Flutter', 'assets/images/Flutter.png', 4),
   const Task('Hackear o WI-Fi do Vizinho', 'assets/images/wifi.jpg', 2),
   const Task('JIRA - MOBIL-628', 'assets/images/jira.webp', 5),
   const Task('Melhorar o Inglês', 'assets/images/ingles.jpg', 4),
   const Task('Arrumar a Casa', 'assets/images/casa.jpg', 1),
   const Task('Consertar Lanterna', 'assets/images/lanterna.jpg', 1),
   const Task('Andar de Jet Ski', 'assets/images/jetski.jpg', 3),
   const Task('Pescar', 'assets/images/pescar.png', 4),
   const Task('Ler', 'assets/images/ler.webp', 3),
   const Task('Jogar', 'assets/images/jogar.jpg', 1),
  ];

  void newTask(String name, String image, int difficulty){
    taskList.add(Task(name, image, difficulty));
  }
  static TaskInherited of(BuildContext context){
    final TaskInherited? result = 
    context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, ' ');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
// código omitido