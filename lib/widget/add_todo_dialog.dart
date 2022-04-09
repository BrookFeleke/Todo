import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/provider/todos.dart';
import './Todo_form_widget.dart';

class AddTodoDialogWidget extends StatefulWidget {
  const AddTodoDialogWidget({Key? key}) : super(key: key);

  @override
  State<AddTodoDialogWidget> createState() => _AddTodoDialogWidgetState();
}

class _AddTodoDialogWidgetState extends State<AddTodoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        elevation: 5,
        backgroundColor: Theme.of(context).primaryColorLight,
        content: Form(
          key: _formKey,
          child: Column(
              children: [
                const Text(
                  'New Todo',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                const SizedBox(height: 8),
                TodoFormWidget(
                  onChangedTitle: (title) => setState(() {
                    this.title = title;
                  }),
                  onChangedDescription: (description) => setState(() {
                    this.description = description;
                  }),
                  onSavedTodo: addTodo,
                )
              ],
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start),
        ));
  }

  void addTodo() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    } else {
      final todo = Todo(
          createdTime: DateTime.now(),
          title: title,
          id: DateTime.now().toString(),
          description: description);

      final provider = Provider.of<TodosProvider>(context, listen: false);
      provider.addTodo(todo);

      Navigator.of(context).pop();
    }
  }
}
