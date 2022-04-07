import 'package:flutter/material.dart';

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
        content: Column(
            children: [Text('New Todo',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),],
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start));
  }
}
