// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_projects/components_widget/difficulty.dart';
import 'package:flutter_projects/data/task_dao.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;
  int nivel = 0;
  Task(this.nome, this.foto, this.dificuldade, this.nivel, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool assetOrNetwork() {
    if (widget.foto.contains('http')) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Theme.of(context).primaryColor,
            ),
            height: 140,
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Theme.of(context).colorScheme.surface,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.black26,
                      ),
                      width: 80,
                      height: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: assetOrNetwork()
                            ? Image.asset(
                                widget.foto,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.foto,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Text(
                            widget.nome,
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ),
                        Difficulty(
                            difficultyLevel: widget.dificuldade, widget: widget)
                      ],
                    ),
                    SizedBox(
                      height: 120,
                      width: 64,
                      child: Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.orange.shade800,
                                    title: const Text(
                                      'DELETAR',
                                    ),
                                    content: const Text(
                                      'Deseja deletar a tarefa?',
                                    ),
                                    actions: [
                                      TextButton(
                                        child: const Text(
                                          'Não',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop(0);
                                        },
                                      ),
                                      TextButton(
                                        child: const Text(
                                          'Sim',
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        onPressed: () {
                                          TaskDao().delete(widget.nome);
                                          Navigator.of(context).pop(1);
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ).then((value) => setState(() {}));
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all<Color>(
                                  Colors.orange.shade700),
                            ),
                            child: const Icon(Icons.close),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                widget.nivel++;
                              });
                              //print(nivel);
                              await TaskDao().save(widget);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.arrow_drop_up),
                                  Text(
                                    'UP',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .labelMedium,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                        value: (widget.dificuldade > 0)
                            ? (widget.nivel / widget.dificuldade) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'EXP ${widget.nivel}',
                      style: Theme.of(context).primaryTextTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
