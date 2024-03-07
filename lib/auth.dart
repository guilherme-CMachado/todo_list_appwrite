import 'package:appwrite/appwrite.dart';
import 'package:flutter/material.dart';

Client client = Client()
    .setEndpoint('https://cloud.appwrite.io/v1')
    .setProject('65ea14397f7bc583026d')
    .setSelfSigned(status: true);

Account account = Account(client);

Future createUser(String name, String email, String password, BuildContext context) async {
  try{
    final user = await account.create(
      userId: ID.unique(),
      email: email,
      password: password,
      name: name,
    );
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account created! Please login")));
    Navigator.pushNamed(context, "/login");
  }catch(e){

  }
}

Future loginUser(String password, String email, BuildContext context)async{
  try{
    final user = await account.createEmailSession( 
    email: email, 
    password: password,
    );
    Navigator.pushNamed(context, '/home');
  }catch(e){

  }
}


