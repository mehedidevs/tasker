import 'package:flutter/material.dart';

void main() {
  runApp(TaskManagerApp());
}

class Task {
  final String title;
  final bool isCompleted;

  Task({required this.title, this.isCompleted = false});
}

class TaskManagerApp extends StatefulWidget {
  @override
  _TaskManagerAppState createState() => _TaskManagerAppState();
}

class _TaskManagerAppState extends State<TaskManagerApp> {
  final List<Task> tasks = [];

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
                  return TaskItem(task: task, onToggle: () => toggleTask(index));
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

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onToggle;

  TaskItem({required this.task, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          task.title,
          style: TextStyle(
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

final TextEditingController newTaskController = TextEditingController();
