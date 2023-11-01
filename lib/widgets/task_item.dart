import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;

  TaskItem({required this.task, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    debugPrint("task item :${task.title} ");

    return Card(
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
            color: Colors.black,
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          "per kg 10",
          style: TextStyle(
            color: Colors.black,
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Text(
          "20 kg",
          style: TextStyle(
            color: Colors.black,
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (_) {
            onToggle();
          },
        ),
      ),
    );
  }
}
