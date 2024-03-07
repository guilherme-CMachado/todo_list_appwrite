import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';

import '../auth.dart';

class TodoProvider extends ChangeNotifier {
  TodoProvider() {
    // Move the readTodos call to an asynchronous method
    _initialize();
  }

  String databaseId = "65ea2e2637ee09858bdb";
  String collectionId = "65ea3016063c64d4af95";

  final Databases database = Databases(client);
  List<Document> todos = [];

  List<Document> get allTodos => todos;

  Future<void> _initialize() async {
    await readTodos();
  }

  Future<void> readTodos() async {
    try {
      final data = await database.listDocuments(
          databaseId: databaseId, collectionId: collectionId);
      todos = data.documents;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> createNewTodo(
      String? title, String? description, String email) async {
    final collection = await database.createDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: ID.unique(),
        data: {
          'title': title, // Corrected typo: 'tilte' to 'title'
          'description': description,
          'isDone': false,
          'createdBy': email, // Corrected typo: 'cretedBy' to 'createdBy'
        });
    await readTodos();
    notifyListeners();
  }

  Future<void> markCompleted(String id, bool isDone) async {
    await database.updateDocument(
        databaseId: databaseId,
        collectionId: collectionId,
        documentId: id,
        data: {"isDone": isDone});
    await readTodos();
    notifyListeners();
  }

  Future<void> updateTodo(String title, String description, String id) async {
    await database.updateDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: id,
      data: {
        'title': title,
        'description': description,
      },
    );
    await readTodos();
    notifyListeners();
  }

  Future<void> deleteTodo(String id) async {
    await database.deleteDocument(
      databaseId: databaseId,
      collectionId: collectionId,
      documentId: id,
    );
    await readTodos();
    notifyListeners();
  }
}
