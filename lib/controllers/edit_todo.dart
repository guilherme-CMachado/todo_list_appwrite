import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_appwrite_app/controllers/todo_provider.dart';

class EditTodo extends StatefulWidget {
  const EditTodo({super.key});

  @override
  State<EditTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<EditTodo> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = Provider.of<TodoProvider>(context);
    final Document arguments = ModalRoute.of(context)?.settings.arguments as Document;
    titleController.text = arguments.data['title'];
    descriptionController.text = arguments.data['description'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Todo"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(hintText: "Title"),
          ),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(hintText: "Description"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                todoProvider.updateTodo(titleController.text, descriptionController.text, arguments.$id);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Todo created")));
                Navigator.of(context).pop();
              },
              child: Text("Update Todo"))
        ],
      ),
    );
  }
}
