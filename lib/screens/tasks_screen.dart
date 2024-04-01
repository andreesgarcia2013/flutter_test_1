import 'package:flutter/material.dart';
import 'package:flutter_test_1/widgets/widgets.dart';

class TasksScreen extends StatelessWidget {
   
  const TasksScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    void handleNewTask(){
      print('New task');
      //TODO: Form with data of Task
    }

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            child: Text('A'),
          ),
        ),
        title: const Text('Bienvenido'),
      ),
      body: _ListTask(),
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
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index)=>ItemTask()
        ),
      )
    );
  }
}