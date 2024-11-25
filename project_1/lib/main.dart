import 'package:flutter/material.dart';
import 'package:project_1/Home_Page.dart';
import 'package:project_1/Login.dart';
import 'package:project_1/Todoapp.dart';
import 'package:project_1/my_home_page.dart';


void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.blue,
      ),
      home: TodoList1(),
    );
  }
}
