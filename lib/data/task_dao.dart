import 'package:flutter_projects/components_widget/task.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTERGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) async{

  }
  //Future<List<Task>> findAll()async{

  }
  //<List<Task>> find(String nomeDaTarefa) async{

  //}
  delete(String nomeDaTarefa) async{

  }
//}
