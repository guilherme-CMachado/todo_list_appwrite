import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_appwrite_app/controllers/todo_provider.dart';

class NewTodo extends StatefulWidget {
  const NewTodo({super.key});

  @override
  State<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final emailController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Todo"),
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
          TextFormField(
            controller: emailController,
            decoration: const InputDecoration(hintText: "Email"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                todoProvider.createNewTodo(
                titleController.text, 
                descriptionController.text, 
                emailController.text);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("Todo created")));
                Navigator.of(context).pop();
              },
              child: Text("Create Todo"))
        ],
      ),
    );
  }
}
