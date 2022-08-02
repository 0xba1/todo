import 'package:flutter/material.dart';
import 'package:todo_caspian/model/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> list = [];

  void toggleTodo(String id) {
    final todo = list.firstWhere((element) => element.id == id);
    todo.isCompleted = !todo.isCompleted;
    notifyListeners();
  }

  void createTodo(String title) {
    list.add(Todo(title));
    notifyListeners();
  }

  void deleteTodo(String id) {
    list.removeWhere((element) => element.id == id);
  }

  Todo? getTodo(String id) {
    if (list.isEmpty) return null;
    return list.firstWhere((element) => element.id == id);
  }
}
