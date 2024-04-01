import 'package:flutter/material.dart';
import 'package:flutter_test_1/models/task_model.dart';

class ItemTask extends StatelessWidget {
  const ItemTask({super.key, required this.task});
  final TaskModel task;

  @override
  Widget build(BuildContext context) {

    void onChangeStateTask(completed){
      print('Change State Task');
    }

    void handleTapTask(){
      print('Task');
    }

    void handleEditTask(){
      print('Task');
    }

    return ListTile(
      onTap: handleTapTask,
      leading: Checkbox(
        value: task.isCompleted,
        onChanged: onChangeStateTask,
      ),
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isCompleted ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        task.dueDate != null ? task.dueDate! : '',
      ),
      trailing: IconButton(
        onPressed: handleEditTask,
        icon: const Icon( Icons.edit) 
      ),
    );
  }

  //   String _formatDate(DateTime date) {
  //   return '${date.day}/${date.month}/${date.year}';
  // }
}