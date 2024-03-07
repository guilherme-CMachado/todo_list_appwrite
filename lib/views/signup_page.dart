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
        body: Column(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Text("Login"),
                ),
                SizedBox(
                  width: 20,
                ),
                OutlinedButton(onPressed: () {
                  createUser(
                        nameController.text,
                        emailController.text,
                        passwordController.text,
                        context
                      );
                }, child: Text("Sign Up"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
