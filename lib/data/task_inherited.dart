import 'package:flutter/material.dart';
import 'package:flutter_projects/components_widget/task.dart';

class TaskInherited extends InheritedWidget {
   TaskInherited({
    super.key,
    required super.child,
  });

  final List<Task> taskList = [
   Task('Aprender Flutter', 'assets/images/Flutter.png', 4),
   Task('Hackear o WI-Fi do Vizinho', 'assets/images/wifi.jpg', 1),
   Task('JIRA - MOBIL-628', 'assets/images/jira.webp', 3),
   Task('Melhorar o Inglês', 'assets/images/ingles.jpg', 3),
   Task('Arrumar a Casa', 'assets/images/casa.jpg', 1),
   Task('Consertar Lanterna', 'assets/images/lanterna.jpg', 1),
   Task('Andar de Jet Ski', 'assets/images/jetski.jpg', 2),
   Task('Pescar', 'assets/images/pescar.png', 5),
   Task('Ler', 'assets/images/ler.webp', 1),
   Task('Jogar', 'assets/images/jogar.jpg', 1),
  ];

  void newTask(String name, String image, int difficulty){
    taskList.add(Task(name, image, difficulty));
  }
  static TaskInherited dentroDo(BuildContext context){
    final TaskInherited? result = 
    context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, ' ');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }

  int getLevel(){
    final tempLevel = taskList.fold(0,(value, element) => value + element.nivel);
    return tempLevel;

  }
}
// código omitido