import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../model/todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo? todo;

  const TodoWidget({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) =>   ClipRRect(
    borderRadius: BorderRadius.circular(5),
    child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          actions: [
            IconSlideAction(
              color: Colors.green,
              caption: 'Edit',
              icon: Icons.edit,
              onTap: () {},
            ),
          ],
          secondaryActions: [
            IconSlideAction(
              icon: Icons.delete,
              color: Color.fromARGB(255, 247, 93, 82),
              caption: 'Delete',
              onTap: () {},
            )
          ],
          child: buildTodo(context),
          key: Key(todo!.id.toString()),
        ),
  );
  Widget buildTodo(BuildContext context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              onChanged: (_) {},
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
      );
}
