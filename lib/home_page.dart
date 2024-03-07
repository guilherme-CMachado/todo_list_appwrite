import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_appwrite_app/controllers/todo_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Todo App"),
        ),
        body: Consumer(
          builder: (context, TodoProvider provider, child){
            return ListView.builder(
              itemCount: provider.allTodos.length,
              itemBuilder: (BuildContext context, int index){
              return ListTile(
                onTap: (){
                  Navigator.pushNamed(context, "/edit", arguments: provider.allTodos[index]);
                },
                trailing: IconButton(
                  onPressed: (){
                    provider.deleteTodo(provider.allTodos[index].$id);
                  },
                  icon: Icon(Icons.clear),
                ),
                title: Text(provider.allTodos[index].data['title']),
                subtitle: Text(provider.allTodos[index].data['description']),
                leading: Checkbox(
                value: provider.allTodos[index].data['isDone'], 
                onChanged: (value){
                  provider.markCompleted(provider.allTodos[index].$id, 
                  provider.allTodos[index].data['isDone']);
                }),
              );
            });
          },
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.pushNamed(context, "/new");
        },
        child: Icon(Icons.add),
        ),
      ),
    );
  }
}