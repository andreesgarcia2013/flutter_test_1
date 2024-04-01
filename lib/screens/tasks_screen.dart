import 'package:flutter/material.dart';
import 'package:flutter_test_1/models/task_model.dart';
import 'package:flutter_test_1/providers/tasks_provider.dart';
import 'package:flutter_test_1/shared_preferences/preferences.dart';
import 'package:flutter_test_1/widgets/widgets.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
   
  const TasksScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final taskProvider=Provider.of<TaskProvider>(context);
    void handleNewTask(){
      print('New task');
      //TODO: Form with data of Task
    }
    final String username = Preferences.token;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            child: Text(username[0]),
          ),
        ),
        title: const Text('Bienvenido'),
      ),
      body: taskProvider.myTasks.isNotEmpty 
        ? _ListTask(tasks:taskProvider.myTasks)
        : const Center(child: Text('No hay tareas')),
      floatingActionButton:FloatingActionButton(
        onPressed: handleNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ListTask extends StatelessWidget {
  const _ListTask({
    super.key,
    required this.tasks
  });

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index)=>ItemTask(task:tasks[index])
        ),
      )
    );
  }
}