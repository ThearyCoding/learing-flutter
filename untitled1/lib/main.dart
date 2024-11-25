import 'package:flutter/material.dart';
import 'package:untitled1/CalculateBacII.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.amber,
        useMaterial3: false,

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black26)
      ),
      home: const CalculateBacII(),
    );
  }
}


