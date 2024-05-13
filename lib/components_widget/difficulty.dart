import 'package:flutter/material.dart';
import 'package:flutter_projects/components_widget/task.dart';

class Difficulty extends StatelessWidget {
  final int difficultyLevel;
  const Difficulty(
      {required this.difficultyLevel, super.key, required this.widget});

  final Task widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(
            Icons.star,
            size: 20,
            color: (difficultyLevel >= 1) ? Colors.blue : Colors.blue[100],
          ),
          Icon(
            Icons.star,
            size: 20,
            color: (difficultyLevel >= 2) ? Colors.blue : Colors.blue[100],
          ),
          Icon(
            Icons.star,
            size: 20,
            color: (difficultyLevel >= 3) ? Colors.blue : Colors.blue[100],
          ),
          Icon(
            Icons.star,
            size: 20,
            color: (difficultyLevel >= 4) ? Colors.blue : Colors.blue[100],
          ),
          Icon(
            Icons.star,
            size: 20,
            color: (difficultyLevel >= 5) ? Colors.blue : Colors.blue[100],
          ),
        ],
      ),
    );
  }
}
