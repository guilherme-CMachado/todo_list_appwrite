import 'package:flutter/material.dart';
import 'package:todo_appwrite_app/auth.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final nameController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign up"),
        ),
        body: Container(
           margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: nameController,
                decoration: InputDecoration(hintText: "Name"),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(hintText: "Email"),
              ),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(hintText: "Password"),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(double.maxFinite, 50),
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                padding: EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: OutlinedButton(
                  style: TextButton.styleFrom(
                      minimumSize: Size(double.maxFinite, 50),
                      backgroundColor: Colors.purple,
                    ),
                  onPressed: () {
                
                  createUser(
                        nameController.text,
                        emailController.text,
                        passwordController.text,
                        context
                      );
                }, child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 20),)),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
