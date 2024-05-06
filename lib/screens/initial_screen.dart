import 'package:flutter/material.dart';
import 'package:flutter_projects/components_widget/task.dart';
import 'package:flutter_projects/screens/form_screen.dart';

class InitialSreen extends StatefulWidget {
  const InitialSreen({super.key});

  @override
  State<InitialSreen> createState() => _InitialSreenState();
}

class _InitialSreenState extends State<InitialSreen> {
  //bool opacity = true;

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
        backgroundColor: Colors.blue,
        title: const Text(
          'Tarefas',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body:
          // AnimatedOpacity(
          //   opacity: opacity ? 1 : 0,
          //   duration: const Duration(seconds: 1),
          //child:
          ListView(
        children: const [
          Task('Aprender Flutter', 'assets/images/Flutter.png', 4),
          Task('Hackear o WI-Fi do Vizinho', 'assets/images/wifi.jpg', 2),
          Task('JIRA - MOBIL-628', 'assets/images/jira.webp', 5),
          Task('Melhorar o Inglês', 'assets/images/ingles.jpg', 4),
          Task('Arrumar a Casa', 'assets/images/casa.jpg', 1),
          Task('Consertar Lanterna', 'assets/images/lanterna.jpg', 1),
          Task('Andar de Jet Ski', 'assets/images/jetski.jpg', 3),
          Task('Pescar', 'assets/images/pescar.png', 4),
          Task('Ler', 'assets/images/ler.webp', 3),
          Task(
            'Jogar',
            'assets/images/jogar.jpg',
            1,
          ),
          SizedBox(
            height: 70,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FormScreen()));
          //   setState(() {
          //     opacity = !opacity;
          //   });
          // },
          // backgroundColor: Colors.blue,
          // child: opacity
          //     ? const Icon(Icons.visibility_off)
          //     : const Icon(Icons.visibility),
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
