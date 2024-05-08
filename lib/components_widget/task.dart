// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_projects/components_widget/difficulty.dart';

class Task extends StatefulWidget {
  final String name;
  final String foto;
  final int difficultyStar;
  Task(this.name, this.foto, this.difficultyStar, {super.key});
  int nivel = 0;
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
              color: Colors.blue.shade700,
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
                            widget.name,
                            style: const TextStyle(
                                fontSize: 24, overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Difficulty(
                            difficultyLevel: widget.difficultyStar,
                            widget: widget)
                      ],
                    ),
                    SizedBox(
                      height: 74,
                      width: 74,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            widget.nivel++;
                          });
                          //print(nivel);
                        },
                        child: const Column(
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
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.orange,
                        value: (widget.difficultyStar > 0)
                            ? (widget.nivel / widget.difficultyStar) / 10
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nível ${widget.nivel}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
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
