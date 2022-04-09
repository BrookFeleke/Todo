import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;

  const TodoFormWidget({
    Key? key,
    this.title = '',
    this.description = '',
    required this.onChangedTitle,
    required this.onChangedDescription,
    required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTitle(),
        const SizedBox(
          height: 8,
        ),
        buildDescription(),
        const SizedBox(
          height: 8,
        ),
        buildButton(context),
      ],
    );
  }

  Widget buildTitle() => TextFormField(
        initialValue: title,
        maxLines: 1,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration:
            const InputDecoration(border: UnderlineInputBorder(), labelText: 'Title'),
      );
  Widget buildDescription() => TextFormField(
        initialValue: description,
        maxLines: 3,
        onChanged: onChangedDescription,
        decoration: const InputDecoration(
            border: UnderlineInputBorder(), labelText: 'Description'),
      );
  Widget buildButton(ctx) => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
        onPressed: onSavedTodo,
        child: const  Text("Save"),
        style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 78, 74, 63)))),
  );
}
