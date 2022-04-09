import 'package:flutter/material.dart';

import 'package:todo/main.dart';
import 'package:todo/widget/completed_list_widget.dart';
import '../widget/add_todo_dialog.dart';
import '../widget/todo_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const TodoListWidget(),
      const CompletedListWidget(),
    ];
    return Scaffold(
      backgroundColor: const  Color.fromARGB(255, 221, 218, 218),
      appBar: AppBar(
        actions: const  [
         Padding(
            padding:  EdgeInsets.all(8.0),
            child: Icon(Icons.mode_night_rounded),
          )
        ],
        title: const Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_rounded), label: 'Todos'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed')
        ],
      ),
      body: tabs[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        child: const  Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) {
                return const AddTodoDialogWidget();
              },
              barrierDismissible: false);
        },
      ),
    );
  }
}
