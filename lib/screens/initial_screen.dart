import 'package:flutter/material.dart';
import 'package:flutter_projects/components_widget/task.dart';
import 'package:flutter_projects/data/task_dao.dart';
//import 'package:flutter_projects/data/task_inherited.dart';
import 'package:flutter_projects/screens/form_screen.dart';

// ignore: must_be_immutable
class InitialSreen extends StatefulWidget {
  InitialSreen({super.key, this.level = 0});
  double level;
  bool levelUp = true;
  @override
  State<InitialSreen> createState() => _InitialSreenState();
}

class _InitialSreenState extends State<InitialSreen> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(1.0),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: IconButton(
              key: ValueKey<bool>(widget.levelUp),
              icon: const Icon(
                Icons.arrow_circle_up,
              ),
              iconSize: 34,
              onPressed: () async {
                final double futureLevel = await getLevel();
                setState(() {
                  widget.levelUp = !widget.levelUp;
                  widget.level = futureLevel;
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
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.refresh,
                  ),
                ),
                IconButton(
                  icon: Icon(opacity ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      opacity = !opacity;
                    });
                  },
                ),
              ],
            ),
          )
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    color: Colors.orange.shade800,
                    value: (widget.level / 100).clamp(0.0, 1.0),
                    // value: (widget.level > 0)
                    //     ? widget.level /
                    //         TaskInherited.of(context).taskList.length
                    //     : 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Level ${widget.level}',
                  // 'Level ${TaskInherited.of(context).getLevel()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
              builder: (contextNew) => FormScreen(
                taskContext: context,
              ),
            ),
          ).then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
      body: AnimatedOpacity(
        opacity: opacity ? 1 : 0,
        duration: const Duration(seconds: 1),
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 70),
          child: FutureBuilder<List<Task>>(
              future: TaskDao().findAll(),
              builder: (context, snapshot) {
                List<Task>? items = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return const Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando'),
                        ],
                      ),
                    );
                  case ConnectionState.waiting:
                    return const Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando'),
                        ],
                      ),
                    );
                  case ConnectionState.active:
                    return const Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('Carregando'),
                        ],
                      ),
                    );
                  case ConnectionState.done:
                    if (snapshot.hasData && items != null) {
                      if (items.isNotEmpty) {
                        return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task tarefa = items[index];
                            return tarefa;
                          },
                        );
                      }
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              color: Colors.grey,
                              Icons.error_outline,
                              size: 128,
                            ),
                            Text(
                              'Não há nenhuma tarefa',
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return const Text('Erro ao carregar as Tarefas');
                }
              }),
        ),
        //child:
        // ListView(
        //   padding: const EdgeInsets.only(top: 10, bottom: 70),
        //   children:
        //       //Aqui(TaskInherited) é onde você encontra esse método(dentroDo), que pede um contexto(context) e retorna o objeto(taskList)
        //       TaskInherited.dentroDo(context).taskList,
        // ),
      ),
    );
  }

  Future<double> getLevel() async {
    final x = await TaskDao().findAll();
    return Future.value(x.fold<double>(0,
        (value, element) => value + element.dificuldade * element.nivel / 10));
  }
}
