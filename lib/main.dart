import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todos.dart';

import './page/homepage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


    static final String title = 'ToDo App';
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodosProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const HomePage(),
      ),
    );
  }
}


