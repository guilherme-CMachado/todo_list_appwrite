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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add New Todo"),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          child: Column(
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
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.maxFinite, 50),
                  backgroundColor: Colors.purple,
                ),
                onPressed: () {
                  todoProvider.createNewTodo(titleController.text,
                      descriptionController.text, emailController.text);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("Todo created")));
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Create Todo",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
