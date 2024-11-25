import 'package:flutter/material.dart';
import 'package:project_1/componenet/bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: MyButtonNavBar()
    );
  }
}