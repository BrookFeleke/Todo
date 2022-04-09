import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todos.dart';
import 'package:todo/utils.dart';
import '../model/todo.dart';
import '../page/edit_todo_page.dart';

class TodoWidget extends StatelessWidget {
  final Todo? todo;

  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Slidable(
          actionPane: const SlidableDrawerActionPane(),
          actions: [
            IconSlideAction(
              color: Colors.green,
              caption: 'Edit',
              icon: Icons.edit,
              onTap: () => editTodo(context, todo!),
            ),
          ],
          secondaryActions: [
            IconSlideAction(
              icon: Icons.delete,
              color: const Color.fromARGB(255, 247, 93, 82),
              caption: 'Delete',
              onTap: () => deleteTodo(context, todo!),
            )
          ],
          child: buildTodo(context),
          key: Key(todo!.id.toString()),
        ),
      );
  Widget buildTodo(BuildContext context) => GestureDetector(
    onTap: () => editTodo(context,todo!),
    child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Checkbox(
                onChanged: (_) {
                  final provider =
                      Provider.of<TodosProvider>(context, listen: false);
  
                  final isDone = provider.toggleTodoState(todo!);
  
                  Utils.showSnackBar(context,
                      isDone ? 'Task Completed' : 'Task marked incomplete');
                },
                value: todo!.isDone,
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.white,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo!.title,
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  if (todo!.description.isNotEmpty)
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Text(todo!.description),
                    )
                ],
              ))
            ],
          ),
        ),
  );

  void deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editTodo(BuildContext context, Todo todo) => Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => EditTodoPage(todo: todo)));
}
