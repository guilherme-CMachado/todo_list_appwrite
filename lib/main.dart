import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_appwrite_app/controllers/edit_todo.dart';
import 'package:todo_appwrite_app/controllers/new_todo.dart';
import 'package:todo_appwrite_app/controllers/todo_provider.dart';
import 'package:todo_appwrite_app/home_page.dart';
import 'package:todo_appwrite_app/views/login_page.dart';
import 'package:todo_appwrite_app/views/signup_page.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: ((context)=>TodoProvider()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          "/home": (context)=> HomePage(),
          "/login": (context)=> LoginPage(),
          '/signup': (context) => SignUpPage(),
          '/new': (context)=> NewTodo(),
          '/edit': (context)=> EditTodo()
        },
        initialRoute: "/login",
      ),
    );
  }
}