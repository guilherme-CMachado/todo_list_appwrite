import 'package:flutter/material.dart';
import 'package:todo_appwrite_app/auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          child: Column(
            children: [
              Spacer(),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                
                decoration: const InputDecoration(hintText: "email", border: OutlineInputBorder()),
              ),
              const SizedBox(height: 40),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(hintText: "password", border: OutlineInputBorder()),
              ),
              Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.all(12),
                child: TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(double.maxFinite, 50),
                      backgroundColor: Colors.purple,
                    ),
                    onPressed: () {
                      loginUser(passwordController.text, emailController.text, context);
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
              ),
              Container(
                padding: EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(double.maxFinite, 50),
                    backgroundColor: Colors.purple,
                  ),
                  onPressed: (){
                  Navigator.pushNamed(context, '/signup');
                }, 
                child: Text("Sign up", style: TextStyle(color: Colors.white, fontSize: 20),)),
              ),
              const SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
