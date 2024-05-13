import 'package:flutter_projects/components_widget/task.dart';
import 'package:flutter_projects/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableTaskSql = 'CREATE TABLE $_tableTask('
      '$_name TEXT, '
      '$_difficulty INTERGER, '
      '$_image TEXT,'
      '$_nivel INTEGER)';

  static const String _tableTask = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';
  static const String _nivel = 'nivel';

  save(Task tarefa) async {
    //print('Iniciando o save: ');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      //print('a Tarefa não Existia.');
      taskMap[_nivel] = 1;
      return await bancoDeDados.insert(_tableTask, taskMap);
    } else {
      //print('a Tarefa existia!');
      return await bancoDeDados.update(
        _tableTask,
        taskMap,
        where: '$_name = ?',
        whereArgs: [tarefa.nome],
      );
    }
  }
  Future<void> incrementLevel(String nomeDaTarefa) async {
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(nomeDaTarefa);
    if (itemExists.isNotEmpty) {
      await bancoDeDados.rawUpdate(
          'UPDATE $_tableTask SET $_nivel = $_nivel + 1 WHERE $_name = ?',
          [nomeDaTarefa]);
    }
  }

  Map<String, dynamic> toMap(Task tarefa) {
    //print('Convertendo to Map: ');
    final Map<String, dynamic> mapaDeTarefas = {};
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;
    mapaDeTarefas[_nivel] = tarefa.nivel;

    //print('Mapa de Tarefas: $mapaDeTarefas');
    return mapaDeTarefas;
  }

  Future<List<Task>> findAll() async {
    //print('Acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tableTask);
    //print('Procurando dados no banco de dados... encontrado: $result');
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    //print('Convertendo to List:');
    final List<Task> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final Task tarefa = Task(
        linha[_name],
        linha[_image],
        linha[_difficulty],
        linha[_nivel]
      );
      tarefas.add(tarefa);
    }
    //print('Lista de Tarefas: ${tarefas.toString()}');
    return tarefas;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    //print('Acessando find: ');
    final Database bancoDeDados = await getDatabase();
    //print('Procurando tarefa com o nome: ${nomeDaTarefa}');
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tableTask, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
    //print('Tarefa encontrada: ${toList(result)}');

    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    //print('Deletando tarefa: $nomeDaTarefa');
    final Database bancoDeDados = await getDatabase();
    return await bancoDeDados.delete(
      _tableTask,
      where: '$_name = ?',
      whereArgs: [nomeDaTarefa],
      
    );
  }

}
