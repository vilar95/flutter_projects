import 'package:flutter/material.dart';
import 'package:flutter_projects/difficulty.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool opacity = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 25, 145, 243)),
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: Icon(
              Icons.list,
              color: Colors.white,
            )),
          ),
          backgroundColor: Colors.blue,
          title: const Text(
            'Tarefas',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: AnimatedOpacity(
          opacity: opacity ? 1 : 0,
          duration: Duration(seconds: 1),
          child: ListView(
            children: [
              Task(
                  'Aprender Flutter',
                  'https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large',
                  4),
              Task(
                  'Hackear o WI-Fi do Vizinho',
                  'https://conteudo.imguol.com.br/c/noticias/1f/2022/01/21/hacker-usando-um-laptop-1642786034169_v2_900x506.jpg',
                  2),
              Task(
                  'JIRA - MOBIL-628',
                  'https://www.iobeya.com/wp-content/uploads/2022/12/Feature-Header-Image-JIRA-1-1024x760.webp',
                  5),
              Task(
                  'Melhorar o Inglês',
                  'https://culturainglesalondrina.com.br/wp-content/uploads/2022/02/iStock-1051721290.jpg',
                  4),
              Task(
                  'Arrumar a Casa',
                  'https://www.artmaison.com.br/blog/wp-content/uploads/2020/06/como-limpar-a-casa.jpg',
                  1),
              Task(
                  'Consertar Lanterna',
                  'https://static.vecteezy.com/ti/vetor-gratis/p1/14448156-chave-reparacao-consertar-ferramentas-mao-modelo-de-logotipo-de-negocios-cor-plana-gratis-vetor.jpg',
                  1),
              Task(
                  'Andar de Jet Ski',
                  'https://www.arraialferias.com.br/fotos/aluguel-passeio-jet-ski-arraial-do-cabo1629295323.jpg',
                  3),
              Task(
                  'Pescar',
                  'https://www.alfapesca.com.br/produtos/original/varapesca-84821.png',
                  4),
              Task(
                  'Ler',
                  'https://cdn-blog.flexi.ink/images/posts/post_22/15873837885e9d8dec3a109_s1000.webp',
                  3),
              Task(
                  'Jogar',
                  'https://gamedeveloper.com.br/content/images/2016/09/jogue-capa.jpg',
                  1),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              opacity = !opacity;
            });
          },
          child: opacity
              ? const Icon(Icons.visibility_off)
              : const Icon(Icons.visibility),
          backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String name;
  final String image;
  final int difficultyStar;
  const Task(this.name, this.image, this.difficultyStar, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blue,
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
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
                          child: Image.network(
                            widget.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 200,
                            child: Text(
                              widget.name,
                              style: TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Difficulty(difficultyLevel: widget.difficultyStar, widget: widget)
                        ],
                      ),
                      Container(
                        height: 74,
                        width: 74,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              nivel++;
                            });
                            print(nivel);
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 12),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: LinearProgressIndicator(
                          color: Colors.orange,
                          value: (widget.difficultyStar > 0)
                              ? (nivel / widget.difficultyStar) / 10
                              : 1,
                        ),
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Nível $nivel',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


