import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_widget.dart';
import '../provider/todos.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;

    return todos.isEmpty
        ? const Center(child: Text("No todos"))
        : ListView.separated(
            separatorBuilder: ((context, index) => Container(
                  height: 7,
                )),
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];

              return TodoWidget(todo: todo);
            },
          );
  }
}
