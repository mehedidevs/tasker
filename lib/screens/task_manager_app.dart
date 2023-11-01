import 'package:flutter/material.dart';

import '../models/task.dart';
import '../widgets/task_item.dart';

class TaskManagerApp extends StatefulWidget {
  @override
  _TaskManagerAppState createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  final List<Task> tasks = [];
  final TextEditingController newTaskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Task Manager'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: newTaskController,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    addTask(value);
                  }
                },
                decoration: InputDecoration(
                  labelText: 'New Task',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      debugPrint("task newTaskController :${newTaskController.text} ");
                      addTask(newTaskController.text);
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  debugPrint("task manager :${task.title} ");

                  return TaskItem(
                      task: task, onToggle: () => toggleTask(index));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addTask(String title) {
    setState(() {
      tasks.add(Task(title: title));
      debugPrint("task title :${title} ");
      debugPrint("task tasks :${tasks.length} ");

      newTaskController.clear();
    });
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index] = Task(
        title: tasks[index].title,
        isCompleted: !tasks[index].isCompleted,
      );
    });
  }
}
