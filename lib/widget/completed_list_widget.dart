import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/widget/todo_widget.dart';
import '../provider/todos.dart';

class CompletedListWidget extends StatelessWidget {
  const CompletedListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todosCompleted;

    return todos.isEmpty
        ? const Center(child: Text("No Completed todos"))
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
