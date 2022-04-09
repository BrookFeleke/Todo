import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todos.dart';
import 'package:todo/widget/todo_form_widget.dart';

import '../model/todo.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;
  const EditTodoPage({Key? key, required this.todo}) : super(key: key);

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final _formkey = GlobalKey<FormState>();
  String? title;
  String? description;

  @override
  void initState() {
    super.initState();
    title = widget.todo.title;
    description = widget.todo.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Todo'),
        actions: [IconButton(onPressed: () {
          final provider = Provider.of<TodosProvider>(context, listen: false);
          provider.removeTodo(widget.todo);

          Navigator.of(context).pop();
        }, icon: const Icon(Icons.delete))],
      ),
      body: Form(
        key: _formkey,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: TodoFormWidget(
              title: title!,
              description: description!,
              onChangedTitle: (title) => setState(() {
                this.title = title;
              }),
              onChangedDescription: (description) => setState(() {
                this.description = description;
              }),
              onSavedTodo: saveTodo,
            )),
      ),
    );
  }

  void saveTodo() {
    final isValid = _formkey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.updateTodo(widget.todo, title!, description!);

      Navigator.of(context).pop();
    }
  }
}
