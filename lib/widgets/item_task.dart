import 'package:flutter/material.dart';

class ItemTask extends StatelessWidget {
  const ItemTask({super.key});

  @override
  Widget build(BuildContext context) {
    bool completed=true;
    String date= '21-04-2000';

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
        value: completed,
        onChanged: onChangeStateTask,
      ),
      title: Text(
        'title',
        style: TextStyle(
          decoration: completed ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text(
        'Fecha: ${date}',
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