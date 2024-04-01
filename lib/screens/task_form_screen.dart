import 'package:flutter/material.dart';
import 'package:flutter_test_1/utils/ui_styles.dart';
import 'package:flutter_test_1/widgets/date_picker.dart';

class TaskFormScreen extends StatelessWidget {
   
  const TaskFormScreen({Key? key, required this.isEdit }) : super(key: key);
  final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit?'Editar Tarea':'Nueva Tarea'),
      ),
      body: _BodyFormTask(),
    );
  }
}

class _BodyFormTask extends StatefulWidget {
  const _BodyFormTask({
    super.key,
  });

  @override
  State<_BodyFormTask> createState() => _BodyFormTaskState();
}

class _BodyFormTaskState extends State<_BodyFormTask> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    final titleController=TextEditingController();
    final commentController=TextEditingController();
    final descriptionController=TextEditingController();
    final tagsController=TextEditingController();

    void handleSendTask(){
      if (_formKey.currentState!.validate()){
        //TODO: Save task 
        // Navigate to task screen
        final title = titleController.value.text;
        final comment = commentController.value.text;
        final description = descriptionController.value.text;
        final tags = tagsController.value.text;

        print('${title} ${comment} ${description} ${tags}');
      }
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Titulo', style: UIStyles.titleFormTextStyle),
            TextFormField(
              controller: titleController,
              validator: (String? title) {
                      if (title == null || title.isEmpty) {
                        return 'Debes ingresar un titulo';
                      }
                      return null;
                    },
            ),
            Text('Fecha', style: UIStyles.titleFormTextStyle),
            DatePicker(),
            Text('Comentarios', style: UIStyles.titleFormTextStyle),
            TextFormField(
              controller: commentController,
              maxLines: 2,
            ),
            Text('Descripción', style: UIStyles.titleFormTextStyle),
            TextFormField(
              controller: descriptionController,
              maxLines: 3,
            ),
            Text('Tags', style: UIStyles.titleFormTextStyle),
            TextFormField(
              controller: tagsController,
            ),
            ElevatedButton(onPressed: handleSendTask, child: Text('Guardar'))
          ],
        ),
      ),
    );
  }
}