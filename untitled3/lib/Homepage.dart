import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:untitled3/Favorite.dart';
import 'package:untitled3/cartProduct.dart';
import 'package:untitled3/todoapp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final screnn = [
    DisplayProduct(),
    CartProduct(),
    Favorite(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screnn[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            padding: EdgeInsets.all(16),
            selectedIndex: _selectedIndex,
            onTabChange: (int index){
              setState(() {
                _selectedIndex = index;
              });
            },
            tabs: [
              GButton(
                icon: Icons.add,
                text: "Add",
              ),
              GButton(
                icon: Icons.favorite_border_outlined,
                text: "Like",
              ),
              GButton(
                icon: Icons.settings,
                text: 'settings',
              )
            ],
          ),
        ),
      ),
    );
  }
}
