import 'package:flutter/material.dart';
import '../model/todo.dart';
class TodosProvider extends ChangeNotifier {
  List<Todo> _todo = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Kill Berekt 😥',
description: 'Hello',
    ),
    Todo(createdTime: DateTime.now(),
    title: 'I dont even know what to do',
    description: 'This is the description of this to do list and it is todo to do bla bla bla')
  ];


  List<Todo> get todos => _todo.where((todo) => todo.isDone == false).toList();

  List<Todo> get todosCompleted => _todo.where((todo)=> todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todo.add(todo);

    notifyListeners();
  }

  void removeTodo(Todo todo){
    _todo.remove(todo);
    notifyListeners();
  }

  bool toggleTodoState(Todo todo){
    todo.isDone = !todo.isDone;
    return todo.isDone;
    notifyListeners();
  }
}