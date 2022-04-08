import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';
import './Todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TodoWidget(
      todo: Todo(createdTime: DateTime.now(), title: 'Walk the Dog 💅')
      
    );
  }
}